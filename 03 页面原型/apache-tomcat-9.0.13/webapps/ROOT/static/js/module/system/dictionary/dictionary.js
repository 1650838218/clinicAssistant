/*数据字典*/
//@ sourceURL=dictionary.js
$(function () {
    // 查询并加载菜单 tree
    $.getJSON('static/data/dictionary.json', loadTree);

    // 模态框隐藏时重置表单
    $('#dictionaryModal').on('hide.bs.modal', function (e) {
        $("#dictionaryModal input").val('');
        $("#dictionaryModal p").html('');
        $('#dictionaryModal form').data('bootstrapValidator').resetForm(true);// 清空校验
    });

    $('#saveBtn').on('click', saveDictionaryBtnClick);// 保存字典类型
    // $('#saveAndCreatBtn').on('click', saveDictionaryBtnClick);// 保存字典类型
    $('#addDictionaryItemBtn').on('click', addDictionaryItem);// 添加字典项
    // 处方 保存按钮监听事件
    // $('#save').on('click', savePrescribe);
    // $('#saveAndReset').on('click', saveAndResetPrescribe);

    // 表格拖拽
    $('#dictionaryItem').bootstrapTable({
        onReorderRowsDrag: function (table, row) {
            // 拖拽钱触发
            var dragbeforeidx = $(row).attr("data-index");// 取索引号
        },
        // 拖拽完成后的这条数据，
        onReorderRowsDrop: function (table, row) {
            var draglateridx = $(row).attr("data-index");// 取索引号
        },
        // 当拖拽结束后，整个表格的数据
        onReorderRow: function (newData) {
            //这里的newData是整个表格数据，数组形式
            console.log(newData); // 调试用代码
            /*$.post("",
                {jsondata: JSON.stringify(newData)},//将整张表数据Post，当然，先序列化成Json
                function (data) {
                    if (data == "success") {
                        $table.bootstrapTable('refresh');
                    }
                }
            );*/
        }
    });

    // ztree 参数设置
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            showLine: false,
            selectedMulti: false
        },
        edit: {
            enable: true,
            showRemoveBtn: showRemoveBtn,
            showRenameBtn: showRenameBtn,
            removeTitle: BTN.delete,
            renameTitle: BTN.edit
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: onClick,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove
        }
    };

    /**
     * 加载数据字典类型
     * @param zNodes
     */
    function loadTree(zNodes) {
        if (zNodes.length > 0) {
            for (var i = 0; i < zNodes.length; i++) {
                zNodes[i].isParent = zNodes[i].type == 1;
            }
            var dictionaryTree = $.fn.zTree.init($("#dictionaryTree"), setting, zNodes);
            dictionaryTree.expandAll(true);
            // 搜索框内容改变监听事件
            fuzzySearch('dictionaryTree', '.tree-panel .search-input', null, true); //初始化模糊搜索方法
            selectFirstNode();
        } else {
            // 没有数据时显示提示信息并因此表单
            $('#dictionaryTree').hide();
            $('#dictionaryForm').hide();
            $('.blank-text').show();
        }
    }

    /**
     * 显示添加按钮
     * @param treeId
     * @param treeNode
     */
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.type == 1 && $("#addBtn_" + treeNode.tId).length <= 0) {
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='添加字典类型' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_" + treeNode.tId);
            if (btn) {
                btn.bind("click", treeNode, addDictionary);
            }
        }
    };

    /**
     * 移除添加按钮
     * @param treeId
     * @param treeNode
     */
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
    };

    /**
     * 是否显示编辑按钮
     *      当前节点是字典类型  显示编辑按钮
     *      当前节点是菜单，不显示编辑按钮
     * @param treeId
     * @param treeNode
     * @returns {boolean}
     */
    function showRenameBtn(treeId, treeNode) {
        return treeNode.type == 2;
    }

    /**
     * 是否显示删除按钮
     *      当前节点是字典类型  显示删除按钮
     *      当前节点是菜单，不显示删除按钮
     * @param treeId
     * @param treeNode
     * @returns {boolean}
     */
    function showRemoveBtn(treeId, treeNode) {
        return treeNode.type == 2;
    }

    /**
     * 选中第一个节点
     */
    function selectFirstNode() {
        var treeObj = $.fn.zTree.getZTreeObj('dictionaryTree');
        if (treeObj != null) {
            var nodes = treeObj.getNodes();
            if (nodes != null && nodes.length > 0) {
                treeObj.selectNode(nodes[0]);
                treeObj.setting.callback.onClick(null, treeObj.setting.treeId, nodes[0]);
            }
        }
    }

    /**
     * 点击添加图标触发
     */
    function addDictionary(event) {
        if (!event) return;
        var treeNode = event.data;
        if (treeNode) {
            $("#dictionaryModal input[name='pId']").val(treeNode.id);// 设置pId
            $("#dictionaryModal input[name='type']").val(2);// 设置type
            $(".form-horizontal p").html(getAncestorNodes(treeNode,"",1));// 设置 所属菜单（模块）
        }
        $('#dictionaryModal').find('.modal-title').text('添加字典类型');
        $('#dictionaryModal').modal({backdrop: 'static'});
    }

    /**
     * ztree 获取祖先节点
     * @param node 当前选中的节点
     * @param connector 连接符
     * @param flag 0 不包括自己 1 包括自己
     * @returns {*}
     */
    function getAncestorNodes(node, connector, flag) {
        if (node == null) return null;
        if (!connector) {
            connector = '->';
        }
        var newNode = node;
        var str = '';
        if (flag == 1) {
            str = connector + newNode.name;
        }
        while (newNode.getParentNode() != null) {
            var parentNode = newNode.getParentNode();
            str = connector + parentNode.name + str;
            newNode = parentNode;
        }
        return str.substr(2);
    }

    /**
     * 单击树节点触发
     *      单击的节点是菜单节点，则右侧提示“请选择一个字典类型”
     *      单击的节点是字典类型节点，则右侧显示该字典类型下的所有字典项
     * @param event
     * @param treeId
     * @param treeNode
     */
    function onClick(event, treeId, treeNode) {
        if (!!treeNode) {
            if (treeNode.type == 1) { //  菜单节点
                $('.form-panel .dictionary-info').hide();
                $('.form-panel .blank-text').show();
            } else if (treeNode.type == 2) { //  字典类型节点
                $('.form-panel .blank-text').hide();
                $('.form-panel .dictionary-info').show();
                $('.form-panel .dictionary-info input[name="id"]').val(treeNode.id);
                $('.form-panel .dictionary-info p[name="name"]').html(treeNode.name);
                $('.form-panel .dictionary-info p[name="code"]').html(treeNode.code);
                $('#dictionaryItem').bootstrapTable();// 渲染bootstrap表格
                try {
                    var key = treeNode.id;
                    $.getJSON('static/data/dictionaryItem.json', {pId: key}, function (data) {
                        $('#dictionaryItem').bootstrapTable('load', data);// 表格
                    });
                } catch (e) {
                    layer.alert('字典项获取失败，请联系系统管理员！', {title: '错误', icon: 2});
                }
            }
        }
    }

    /**
     * 点击编辑图标触发
     */
    function beforeEditName(treeId, treeNode) {
        if (treeNode != null) {
            $('#dictionaryModal').find("input[name='id']").val(treeNode.id);
            $('#dictionaryModal').find("input[name='pId']").val(treeNode.pId);
            $('#dictionaryModal').find("input[name='name']").val(treeNode.name);
            $('#dictionaryModal').find("input[name='code']").val(treeNode.code);
            $('.form-horizontal p').html(getAncestorNodes(treeNode), "", 0);
            $('#dictionaryModal').find('.modal-title').text('修改字典类型');
            $('#dictionaryModal').modal({backdrop: 'static'});
        }
        return false;
    }

    /**
     * 点击删除图标触发
     */
    function beforeRemove(treeId, treeNode) {
        if (treeNode) {
            var msg = MSG.delete_confirm + '名为' + treeNode.name + '的数据字典类型吗?';
            var url = '';
            layer.confirm(msg, {icon: 3, title: BTN.delete}, function (index) {
                // 后台删除
                $.ajax({
                    url: url + treeNode.id,
                    type: 'DELETE',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            layer.msg(MSG.delete_success, {offset: 'rb', time: 2000});
                            // ztree删除节点
                            var treeobj = $.fn.zTree.getZTreeObj(treeId);
                            treeobj.removeNode(treeNode, false);// 不触发回调方法
                        } else {
                            layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                    }
                });
                layer.close(index);
            });
        }
        return false;
    }

    /**
     * 模态框 保存 按钮点击事件
     */
    function saveDictionaryBtnClick() {
        $('#dictionaryModal form').bootstrapValidator('validate');// 触发校验
        var flag = $('#dictionaryModal form').data('bootstrapValidator').isValid();// 获取校验结果
        if (flag) {
            var type = $("#dictionaryModal input[name='type']").val();
            if (type == 2) {// 保存字典
                saveDictionary($('#dictionaryModal form').serialize());
            } else if (type == 3) {// 保存字典项
                saveDictionaryItem($('#dictionaryModal form').serialize());
            }
        }
    }

    // 表单验证
    $('#dictionaryModal form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                // message: '名称验证失败',
                validators: {
                    notEmpty: {
                        message: '名称不能为空！'
                    }
                }
            },
            code: {
                validators: {
                    notEmpty: {
                        message: '编码不能为空！'
                    }
                }
            }
        }
    });

    /**
     * 字典类型保存
     * @param data
     */
    function saveDictionary(dictionaryData) {
        $.post('/save', data, function (resultData, textStatus, jqXHR) {
            if (resultData) {
                layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                // 增加节点并选中
                var treeobj = $.fn.zTree.getZTreeObj('dictionaryTree');
                if (treeobj != null) {
                    var oldNode = treeobj.getNodeByParam('id', resultData.id, null);
                    if (oldNode == null) {// 新增
                        var newNodes = [];
                        var parentNode = treeobj.getNodeByParam('id', resultData.pId, null);
                        newNodes = treeobj.addNodes(parentNode, resultData);
                        treeobj.selectNode(newNodes[0]);
                        treeobj.setting.callback.onClick(null, treeobj.setting.treeId, newNodes[0]);
                    } else {// 修改
                        oldNode.name = resultData.name;
                        oldNode.code = resultData.code;
                        treeobj.updateNode(oldNode);
                        treeobj.setting.callback.onClick(null, treeobj.setting.treeId, oldNode);
                    }
                } else {
                    $.getJSON('static/data/dictionary.json', loadTree);
                }
            } else {
                layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
            }
        })
    }

    /**
     * 添加字典项
     */
    function addDictionaryItem() {
        var pId = $('.form-panel .dictionary-info input[name="id"]').val();
        if (!pId) {
            layer.alert('请先选中一个字典类型！', {title: '错误', icon: 2});
            return false;
        }
        $("#dictionaryModal input[name='pId']").val(pId);// 设置pId
        $("#dictionaryModal input[name='type']").val(3);// 设置pId
        var treeobj = $.fn.zTree.getZTreeObj('dictionaryTree');
        if (treeobj != null) {
            var dictionary = treeobj.getNodeByParam("id",pId,null);
            if (dictionary != null) {
                $("#dictionaryModal .form-horizontal p").html(getAncestorNodes(dictionary,"",1));// 设置 所属菜单（模块）
                $('#dictionaryModal').find('.modal-title').text('添加字典项');
                $('#dictionaryModal').modal({backdrop: 'static'});
            }
        }
    }

    /**
     * 编辑字典项
     * @param dictionaryItem
     */
    editDictionaryItem = function (dictionaryItemId) {
        if (dictionaryItemId) {
            try {
                // 根据ID查询字典项
                $.getJSON('', {orderDetailId: dictionaryItemId}, function (data) {
                    // 赋值
                    $("#dictionaryModal form").fillData(data);
                    var treeobj = $.fn.zTree.getZTreeObj('dictionaryTree');
                    if (treeobj != null) {
                        var dictionary = treeobj.getNodeByParam("id",pId,null);
                        if (dictionary != null) {
                            $("#dictionaryModal .form-horizontal p").html(getAncestorNodes(dictionary,"",1));// 设置 所属菜单（模块）
                        }
                    }
                    $('#dictionaryModal').find('.modal-title').text('修改字典项');
                    $('#dictionaryModal').modal({backdrop: 'static'});
                });
            } catch (e) {
                layer.alert('字典项查询失败，请联系系统管理员！',{title: '错误',icon: 2});
            }
        } else {
            layer.alert('该字典项ID为空，请联系系统管理员！',{title: '错误',icon: 2});
        }
    }

    /**
     * 保存字典项
     * @param data 待保存的数据
     * @param flag 1 ：只保存；2 ：保存后新建
     */
    function saveDictionaryItem(data, flag) {
        try {
            $.post('/save', data, function (data, textStatus, jqXHR) {
                if (data) {
                    // 1.提示保存成功
                    layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                    // 2.刷新列表
                    $.getJSON('static/data/dictionaryItem.json', {pId: data.type}, function (searchData) {
                        $('#dictionaryItem').bootstrapTable('load', searchData);// 表格
                    });
                    $('#dictionaryModal').modal('hide');
                } else {
                    layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
                }
            });
        } catch (e) {
            layer.alert('保存失败，请联系系统管理员！', {title: '错误', icon: 2});
        }
    }

    /**
     * 删除字典项
     * @param e
     * @param dictionaryItemId
     * @param row
     * @param index
     */
    delDictionaryItem = function(e,dictionaryItemId,row,index) {
        if (dictionaryItemId) {
            var msg = MSG.delete_confirm + '该字典项吗?';
            var url = '/prescription/prescribe/delete/';
            layer.confirm(msg, {icon: 3, title: BTN.delete}, function (index) {
                $.ajax({
                    url: url + dictionaryItemId,
                    type: 'DELETE',
                    success: function (data, textStatus, jqXHR) {
                        if (data.success) {
                            layer.msg(MSG.delete_success, {offset: 'rb', time: 2000});
                            $('#dictionaryItem').bootstrapTable('remove', {
                                field: 'id',
                                values: [row.id]
                            });
                        } else {
                            layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                    }
                });
                layer.close(index);
            });
        } else {
            layer.alert('该字典项ID为空，请联系系统管理员！',{title: '错误',icon: 2});
        }
    }
});


/**
 * 表格操作列
 * @param value
 * @param row
 * @param index
 * @returns {string}
 *  data-toggle="modal" data-value="' + value + '" data-target="#orderDetailModal" data-whatever="update"
 */
function operateFormatter(value, row, index) {
    return [
        '<a class="update" href="javascript:void(0);" title="修改">',
        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>',
        '</a>  ',
        '<a class="remove" href="javascript:void(0);" title="删除">',
        '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>',
        '</a>'
    ].join('');
}

/**
 * 表格操作列按钮点击事件
 */
window.operateEvents = {
    'click .update': function (e, value, row, index) {
        editDictionaryItem(value);
        // alert('You click like action, row: ' + JSON.stringify(value));
    },
    'click .remove': function (e, value, row, index) {
        delDictionaryItem(e,value,row,index);
    }
};