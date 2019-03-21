/*处方管理*/
//@ sourceURL=prescribe.js
$(function () {
    // form表单更新渲染
    var form = layui.form;
    form.render();
    // 查询并加载菜单 tree
    $.getJSON('/prescription/disease/loadTree', loadTree);
    // 新增疾病按钮点击事件
    $("#addParentBtn").on('click', {flag: 0}, editDisease);
    // 初始化渲染tag-it 标签
    $('#details').tagit({});
    // 监听处方名称输入框的输入事件，方便将处方名称转换成汉语拼音首字母
    var input = $('.form-panel').find("input[name='name']");
    var select = $('.form-panel').find("select[name='abbreviation']");
    input.keyup({input:input,select:select},toPinYin);
    // 处方 保存按钮监听事件
    layui.form.on('submit(save)', savePrescribe);
    layui.form.on('submit(saveAndReset)', saveAndResetPrescribe);


    // ztree 参数设置
    var setting = {
        view: {
            showLine: false,
            selectedMulti: false
        },
        edit: {
            enable: true,
            showRemoveBtn: true,
            showRenameBtn: setRenameBtn,
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
            var diseaseTree = $.fn.zTree.init($("#diseaseTree"), setting, zNodes);
            diseaseTree.expandAll(true);
            // 搜索框内容改变监听事件
            fuzzySearch('diseaseTree', '.tree-panel .search-input', null, true); //初始化模糊搜索方法
            selectFirstNode();
            $('.blank-text-div').hide();// 隐藏提示信息
        } else {
            // 没有数据时显示提示信息
            $('.blank-text-div').show();
        }
    }

    /**
     * 是否显示编辑按钮
     *      当前节点是疾病  显示编辑按钮
     *      当前节点是处方，不显示编辑按钮
     * @param treeId
     * @param treeNode
     * @returns {boolean}
     */
    function setRenameBtn(treeId, treeNode) {
        return treeNode.isDisease;
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
     * 疾病编辑
     * @param event 按钮点击事件
     */
    function editDisease(event) {
        if (!event || !event.data || (event.data.flag != 0 && event.data.flag != 1)) return;
        var flag = event.data.flag;
        if (flag == 0) {// 新增
            // 获取目录树中已选择的疾病类别
            var treeobj = $.fn.zTree.getZTreeObj('diseaseTree');
            if (treeobj != null) {
                var selectNodes = treeobj.getSelectedNodes();
                if (selectNodes != null && selectNodes.length > 0) {
                    // ztee 获取某节点的祖先节点，并用符号连接
                    $('#layerContent').find("input[name='pId']").val(selectNodes[0].id);
                    $('#layerContent').find("input[name='belong']").val(getAncestorNodes(selectNodes[0], '', 0));
                } else {
                    $('#layerContent').find("input[name='pId']").val(-1);
                    $('#layerContent').find("input[name='belong']").val('顶级');
                }
            } else {
                $('#layerContent').find("input[name='pId']").val(-1);
                $('#layerContent').find("input[name='belong']").val('顶级');
            }
            showEditWindow({title: '添加疾病类型'}, {save: saveDisease, validate: validate});
        } else if (flag == 1) {// 修改
            if (event.data.treeNode != null) {
                var selectNode = event.data.treeNode;
                $('#layerContent').find("input[name='id']").val(selectNode.id);
                $('#layerContent').find("input[name='pId']").val(selectNode.pId);
                $('#layerContent').find("input[name='name']").val(selectNode.name);
                $('#layerContent').find("input[name='belong']").val(getAncestorNodes(selectNode, '', 1));
                showEditWindow({title: '修改疾病类型'}, {save: saveDisease, validate: validate});
            }
        }
    }

    /**
     * 弹出疾病编辑框
     */
    function showEditWindow(option, callback) {
        // 将编辑面板移动到index.html的layerPanel中，不做这一步，遮罩会有问题
        $("#layerPanel").append($("#layerContent div"));
        var localOption = {
            skin: 'layer-myskin',
            title: '基本信息',
            btn: [BTN.save],
            content: $("#layerPanel"),
            end: function () {
                // 重置所有输入项
                $("#layerPanel").find("input").each(function (index, element) {
                    $(element).val('');
                });
                // 将弹出框源码放到原位置
                $("#layerContent").append($("#layerPanel div"));
            },
            yes: function (index, layero) {
                // 获取表单的数据，并保存
                var data = {};
                $("#layerPanel").find("input").each(function (index, element) {
                    data[$(element).attr('name')] = $(element).val();
                });
                if (callback.validate(data)) {
                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                    callback.save(data);// 回调方法，保存
                }
            }
        };
        layer.prompt($.extend(localOption, option));
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
        while (newNode.getParentNode() != null) {
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
     * 数据校验
     * @param data
     */
    function validate(data) {
        if (!data || !data.name) {
            layer.msg('请填写疾病名称！', {icon: 2, time: 1000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        } else if (data.name.length > 10) {
            layer.msg('疾病名称不能超过10个汉字！', {icon: 2, time: 2000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        }
        return true;
    }

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
                    data.isDisease = true;
                    var oldNode = treeobj.getNodeByParam('id',data.id,null);
                    if (oldNode == null) {// 新增
                        var newNodes = [];
                        if (data.pId == -1) {
                            newNodes = treeobj.addNodes(null, data);
                        } else {
                            var parentNode = treeobj.getNodeByParam('id', data.pId, null);
                            newNodes = treeobj.addNodes(parentNode, data);
                        }
                        treeobj.selectNode(newNodes[0]);
                        treeobj.setting.callback.onClick(null, treeobj.setting.treeId, newNodes[0]);
                    } else {// 修改
                        oldNode.name = data.name;
                        treeobj.updateNode(oldNode);
                        // treeobj.setting.callback.onClick(null, treeobj.setting.treeId, oldNode);
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
     * 点击树节点（菜单）触发，在右侧表单中显示菜单详情
     * @param event
     * @param treeId
     * @param treeNode
     */
    function onClick(event, treeId, treeNode) {
        var form = layui.form;
        $('.form-panel').find("form[lay-filter='prescribeForm']").show();
        $('.form-panel').find("button[type='reset']").click();
        $('.form-panel').find(("select[name='abbreviation']")).empty();
        $('#details').tagit('removeAll');
        if (treeNode.isDisease) {// 疾病类型
            // 重置表单，初始化疾病名称和diseaseId
            form.val('prescribeForm', {
                'disease.name': getAncestorNodes(treeNode, '', 0),
                'disease.id': treeNode.id,
                'id':''
            });
        } else {// 处方
            form.val('prescribeForm', {
                'disease.name': getAncestorNodes(treeNode.getParentNode(), '', 0),
                'disease.id': treeNode.getParentNode().id,
                'id': treeNode.id,
                'name': treeNode.name,
                // 'abbreviation': treeNode.abbreviation,
                'type': treeNode.type
            });
            // 动态初始化 select和tag
            var select = $('.form-panel').find(("select[name='abbreviation']"));
            select.append('<option value="'+ treeNode.abbreviation +'" selected>'+ treeNode.abbreviation +'</option>');
            var tags = treeNode.details.split(',');
            $.each(tags, function (index, tag) {
                $('#details').tagit('createTag', tag);
            });
        }
    }

    /**
     * 点击编辑图标触发
     */
    function beforeEditName(treeId, treeNode) {
        var event = {
            data: {
                flag: 1,
                treeNode: treeNode
            }
        };
        editDisease(event);
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
            if (val == '') return;
            var arrRslt = makePy(val);
            select.empty();
            for (var i = 0; i < arrRslt.length; i++) {
                select.append('<option value="'+ arrRslt[i] +'">'+ arrRslt[i] +'</option>');
            }
            layui.form.render('select');
        }
    }
});

