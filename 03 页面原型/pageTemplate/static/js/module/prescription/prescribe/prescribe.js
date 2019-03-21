/*处方管理*/
//@ sourceURL=prescribe.js
$(function () {
    // 查询并加载菜单 tree
    $.getJSON('static/data/disease.json', loadTree);// /prescription/disease/loadTree

    // 模态框隐藏时重置表单
    $('#diseaseModal').on('hidden.bs.modal', function (e) {
        $("#diseaseModal input").val('');
        $("#diseaseModal p").html('');
    });

    // 模态框 保存 按钮绑定点击事件
    $('#saveBtn').on('click', saveDiseaseBtnClick);

    // 初始化渲染tag-it 标签
    $('#details').tagit({});

    // 监听处方名称输入框的输入事件，方便将处方名称转换成汉语拼音首字母
    var input = $('#prescribeForm').find("input[name='name']");
    var select = $('#prescribeForm').find("select[name='abbreviation']");
    input.keyup({input:input,select:select},toPinYin);

    // 处方 保存按钮监听事件
    $('#save').on('click', savePrescribe);
    $('#saveAndReset').on('click', saveAndResetPrescribe);

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
     * 加载疾病类型树
     * @param zNodes
     */
    function loadTree(zNodes) {
        if (zNodes.length > 0) {
            for (var i = 0; i < zNodes.length; i++) {
                zNodes[i].isParent = !zNodes[i].type;
            }
            var diseaseTree = $.fn.zTree.init($("#diseaseTree"), setting, zNodes);
            diseaseTree.expandAll(true);
            // 搜索框内容改变监听事件
            fuzzySearch('diseaseTree', '.tree-panel .search-input', null, true); //初始化模糊搜索方法
            selectFirstNode();
        } else {
            // 没有数据时显示提示信息并因此表单
            $('.blank-text-div').show();
            $('#diseaseTree').hide();
            $('#prescribeForm').hide();
        }
    }

    /**
     * 显示添加按钮
     * @param treeId
     * @param treeNode
     */
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.type || treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='添加' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) {
            btn.bind("click", treeNode, addDisease);
        }
    };

    /**
     * 移除添加按钮
     * @param treeId
     * @param treeNode
     */
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };

    /**
     * 是否显示编辑按钮
     *      当前节点是疾病  显示编辑按钮
     *      当前节点是处方，不显示编辑按钮
     * @param treeId
     * @param treeNode
     * @returns {boolean}
     */
    function showRenameBtn(treeId, treeNode) {
        return treeNode.isParent && treeNode.getParentNode() != null;
    }

    /**
     * 是否显示删除按钮
     *      当前节点是根节点  不显示删除按钮
     * @param treeId
     * @param treeNode
     * @returns {boolean}
     */
    function showRemoveBtn(treeId, treeNode) {
        return treeNode.getParentNode() != null;
    }
    
    /**
     * 选中第一个节点
     */
    function selectFirstNode() {
        var treeObj = $.fn.zTree.getZTreeObj('diseaseTree');
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
    function addDisease(event) {
        if (!event) return;
        var treeNode = event.data;
        if (treeNode) {
            var parentNode = treeNode.getParentNode();
            if (parentNode) {
                // 非根节点下添加
                $("#diseaseModal input[name='pId']").val(parentNode.pId);// 设置pId
                $(".form-horizontal p").html(getAncestorNodes(treeNode, '', 0));// 设置 所属类别
            } else {
                // 在根节点下添加
                $("#diseaseModal input[name='pId']").val(0);// 设置pId
                $(".form-horizontal p").html('顶级');// 设置 所属类别
            }
            // $("#diseaseModal input[name='type']").val(treeNode.level);// 设置节点类型
        }
        $('#diseaseModal').modal({backdrop:'static'});
    }
    /**
     * 疾病编辑
     * @param event 按钮点击事件
     */
    function editDisease(treeId, treeNode) {
        if (treeNode != null) {
            $('#diseaseModal').find("input[name='id']").val(treeNode.id);
            $('#diseaseModal').find("input[name='pId']").val(treeNode.pId);
            $('#diseaseModal').find("input[name='name']").val(treeNode.name);
            $('.form-horizontal p').html(getAncestorNodes(treeNode, '', 1));
            $('#diseaseModal').modal({backdrop:'static'});
            // showEditWindow({title: '修改疾病类型'}, {save: saveDisease, validate: validate});
        }
    }

    /**
     * ztree 获取祖先节点
     * @param node 当前选中的节点
     * @param connector 连接符
     * @param flag 0 添加 1 修改
     * @returns {*}
     */
    function getAncestorNodes(node, connector, flag) {
        if (node == null) return null;
        if (connector == null || connector == '') {
            connector = '->';
        }
        var newNode = node;
        var str = '';
        if (flag == 0) {
            str = connector + newNode.name;
        }
        while (newNode.getParentNode().getParentNode() != null) {
            var parentNode = newNode.getParentNode();
            str = connector + parentNode.name + str;
            newNode = parentNode;
        }
        if (str.length == 0) {
            return '顶级';
        }
        return str.substr(2);
    }

    /**
     * 点击树节点（菜单）触发，在右侧表单中显示菜单详情
     * @param event
     * @param treeId
     * @param treeNode
     */
    function onClick(event, treeId, treeNode) {
        // 判断点击的节点的类型
        // 1. 根节点 ：右侧显示提示信息（请选择一个疾病类型或处方）
        // 2. 疾病类型 ：右侧显示空白表单
        // 3. 处方 ：右侧显示该处方的详细信息
        if (treeNode.getParentNode() == null) {
            // 根节点
            // 隐藏表单，显示提示信息
            $('.form-panel form').hide();
            $('.form-panel .blank-text').html('请选择一个疾病类型或处方！');
            $('.form-panel .blank-text').show();
        } else if (treeNode.type == 0) {
            //  疾病类型
            //  显示表单，隐藏提示信息，reset表单，赋值pId
            $('.form-panel .blank-text').hide();
            $('.form-panel form').show();
            $(".form-panel button[type='reset']").click();
            $('.form-panel').find(("select[name='abbreviation']")).empty();
            $('#details').tagit('removeAll');
            $(".form-panel input[name='disease.id']").val(treeNode.id);
            $('.form-panel p').html(getAncestorNodes(treeNode,'',0));
        } else {
            //  处方
            //  显示表单，隐藏提示信息，赋值
            $('.form-panel .blank-text').hide();
            $('.form-panel form').show();
            $(".form-panel button[type='reset']").click();
            $('.form-panel').find(("select[name='abbreviation']")).empty();
            $('#details').tagit('removeAll');
            $(".form-panel input[name='id']").val(treeNode.id);
            $(".form-panel input[name='disease.id']").val(treeNode.getParentNode().id);
            $('.form-panel p').html(getAncestorNodes(treeNode,'',1));
            $(".form-panel input[name='name']").val(treeNode.name);
            $(".form-panel select[name='abbreviation']").val(treeNode.abbreviation);
            $(".form-panel input[name='type']").val(treeNode.type);
            $(".form-panel input[name='doggerel']").val(treeNode.doggerel);
            $(".form-panel input[name='details']").val(treeNode.details);
            // 动态初始化 select和tag
            var select = $('.form-panel').find(("select[name='abbreviation']"));
            select.append('<option value="'+ treeNode.abbreviation +'" selected>'+ treeNode.abbreviation +'</option>');
            if (treeNode.details) {
                var tags = treeNode.details.split(',');
                $.each(tags, function (index, tag) {
                    $('#details').tagit('createTag', tag);
                });
            }
        }
    }

    /**
     * 点击编辑图标触发
     */
    function beforeEditName(treeId, treeNode) {
        editDisease(treeId, treeNode);
        return false;
    }

    /**
     * 点击删除图标触发
     */
    function beforeRemove(treeId, treeNode) {
        if (treeNode) {
            if (treeNode.children) {// 有子节点
                layer.msg('请先删除子节点！',{time:2000});
            } else {
                var msg = '',url = '';
                if (treeNode.isDisease) {
                    msg = MSG.delete_confirm + '名为' + treeNode.name + '的疾病类型及其处方吗?';
                    url = '/prescription/disease/delete/';
                } else {
                    msg = MSG.delete_confirm + '名为' + treeNode.name + '的处方吗?';
                    url = '/prescription/prescribe/delete/';
                }
                layer.confirm(msg, {icon: 3, title: BTN.delete }, function (index) {
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
        }
        return false;
    }

    /**
     * 模态框 保存 按钮点击事件
     */
    function saveDiseaseBtnClick() {
        $('#diseaseModal form').bootstrapValidator('validate');// 触发校验
        var flag = $('#diseaseModal form').data('bootstrapValidator').isValid();// 获取校验结果
        if (flag) {
            saveDisease($('#diseaseModal form').serialize());
        }
    }

    // 表单验证
    $('#diseaseModal form').bootstrapValidator({
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
            }
        }
    });

    /**
     * 疾病保存
     * @param data
     */
    function saveDisease(data) {
        $.post('/prescription/disease/save', data, function (data, textStatus, jqXHR) {
            if (data) {
                layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                // 增加节点并选中
                var treeobj = $.fn.zTree.getZTreeObj('diseaseTree');
                if (treeobj != null) {
                    data.isParent = true;
                    var oldNode = treeobj.getNodeByParam('id',data.id,null);
                    if (oldNode == null) {// 新增
                        var newNodes = [];
                        var parentNode = treeobj.getNodeByParam('id', data.pId, null);
                        newNodes = treeobj.addNodes(parentNode, data);
                        treeobj.selectNode(newNodes[0]);
                        treeobj.setting.callback.onClick(null, treeobj.setting.treeId, newNodes[0]);
                    } else {// 修改
                        oldNode.name = data.name;
                        treeobj.updateNode(oldNode);
                        treeobj.setting.callback.onClick(null, treeobj.setting.treeId, oldNode);
                    }
                } else {
                    $.getJSON('/prescription/disease/loadTree', loadTree);
                }
            } else {
                layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
            }
        })
    }

    /**
     * 保存处方
     * @param data
     */
    function savePrescribe(data) {
        ajaxSavePrescribe(data, function (node) {
            var treeobj = $.fn.zTree.getZTreeObj('diseaseTree');
            treeobj.selectNode(node);
            treeobj.setting.callback.onClick(null,treeobj.setting.treeId,node);
        });
    }

    /**
     * 保存并新建
     * @param data
     */
    function saveAndResetPrescribe(data) {
        ajaxSavePrescribe(data, function (node) {
            var treeobj = $.fn.zTree.getZTreeObj('diseaseTree');
            treeobj.selectNode(node.getParentNode());
            treeobj.setting.callback.onClick(null,treeobj.setting.treeId,node.getParentNode());
        });
    }

    /**
     * ajax 保存 处方
     * @param data
     * @param callback
     */
    function ajaxSavePrescribe(data,callback) {
        var diseaseId = data.field['disease.id'];
        $.ajax({
            url:'/prescription/prescribe/save',
            data:data.field,
            type:'POST',
            success:function(data, textStatus, jqXHR) {
                if (data) {
                    data.isDisease = false;
                    var treeobj = $.fn.zTree.getZTreeObj('diseaseTree');
                    var oldNode = treeobj.getNodeByParam('id',data.id,null);
                    if (oldNode == null) {// 新增
                        var newNodes = [];
                        var parentNode = treeobj.getNodeByParam('id', diseaseId, null);
                        newNodes = treeobj.addNodes(parentNode, data);
                        callback(newNodes[0]);
                    } else {// 修改
                        oldNode.name = data.name;
                        oldNode.abbreviation = data.abbreviation;
                        oldNode.type = data.type;
                        oldNode.details = data.details;
                        treeobj.updateNode(oldNode);
                        callback(oldNode);
                    }
                    layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                } else {
                    layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
                }
            },
            error: function () {
                layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
            }
        });
    }

    /**
     * 汉字转拼音首字母
     * @param event
     */
    function toPinYin(event) {
        if (event && event.data && event.data.input && event.data.select) {
            var input = event.data.input;
            var select = event.data.select;
            var val = input.val().trim();
            if (val == '') {
                select.empty();// 清空下拉框
                return;
            }
            var arrRslt = makePy(val);
            select.empty();
            for (var i = 0; i < arrRslt.length; i++) {
                select.append('<option value="'+ arrRslt[i] +'">'+ arrRslt[i] +'</option>');
            }
        }
    }
});

