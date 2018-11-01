/*处方管理*/
//@ sourceURL=prescribe.js

/**
 * ztree 回调方法
 */
var ztreeCallback = (function () {
    /**
     * 点击树节点（菜单）触发，在右侧表单中显示菜单详情
     * @param event
     * @param treeId
     * @param treeNode
     */
    var onClick = function (event, treeId, treeNode) {
        var form = layui.form;
        //表单初始赋值
        form.val('prescribeForm', {
            // 'id':'',
            'diseaseId':treeNode.id
           /* 'name': treeNode.name,
            'abbreviation':'',
            'doggerel':'',
            'details':''*/
        })
    }

    /**
     * 点击编辑图标触发
     */
    var beforeEditName = function (treeId, treeNode) {
        var event = {
            data:{
                flag:1,
                treeNode:treeNode
            }
        };
        diseaseFunSet.editDisease(event);
        return false;
    }

    /**
     * 点击删除图标触发
     */
    var beforeRemove = function (treeId, treeNode) {
        if (treeNode) {
            layer.confirm(MSG.delete_confirm + '名为' + treeNode.name + '的疾病类型及其处方吗?', {icon: 3, title:BTN.delete}, function(index){
                // 后台删除
                $.ajax({
                    url:'/prescription/disease/delete',
                    data:{id:treeNode.id},
                    type:'DELETE',
                    success:function(data, textStatus, jqXHR) {
                        layer.msg(MSG.delete_success, {offset: 'rb', time: 2000});
                        // ztree删除节点
                        var treeobj = $.fn.zTree.getZTreeObj(treeId);
                        treeobj.removeNode(treeNode,false);// 不触发回调方法
                    },
                    error:function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                    }
                });
                layer.close(index);
            });
        }
        return false;
    }

    return {
        onClick: onClick,
        beforeEditName:beforeEditName,
        beforeRemove:beforeRemove
    }
})();

/**
 * 疾病 处理方法集合
 * @type
 */
var diseaseFunSet = (function () {
    /**
     * 疾病编辑
     * @param event 按钮点击事件
     */
    var editDisease = function (event) {
        if (!event || !event.data || (event.data.flag != 0 && event.data.flag != 1)) return;
        var flag = event.data.flag;
        if (flag == 0) {// 新增
            // 获取目录树中已选择的疾病类别
            var treeobj = $.fn.zTree.getZTreeObj('treeDisease');
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
            showEditWindow({title: '添加疾病类型'}, {save:save,validate:validate});
        } else if (flag == 1) {// 修改
            if (event.data.treeNode != null) {
                var selectNode = event.data.treeNode;
                $('#layerContent').find("input[name='id']").val(selectNode.id);
                $('#layerContent').find("input[name='pId']").val(selectNode.pId);
                $('#layerContent').find("input[name='name']").val(selectNode.name);
                $('#layerContent').find("input[name='belong']").val(getAncestorNodes(selectNode,'',1));
                showEditWindow({title: '修改疾病类型'}, {save:save,validate:validate});
            }
        }
    }

    /**
     * 弹出疾病编辑框
     */
    var showEditWindow = function (option, callback) {
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
    var getAncestorNodes = function (node, connector, flag) {
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
    var validate = function (data) {
        if (!data || !data.name) {
            layer.msg('请填写疾病名称！',{icon:2,time:1000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        } else if (data.name.length > 10) {
            layer.msg('疾病名称不能超过10个汉字！',{icon:2,time:2000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        }
        return true;
    }

    /**
     * 疾病保存
     * @param data
     */
    var save = function (data) {
        $.post('/prescription/disease/save', data, function (data, textStatus, jqXHR) {
            if (data) {
                layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                // 增加节点并选中
                var treeobj = $.fn.zTree.getZTreeObj('treeDisease');
                if (treeobj != null) {
                    var newNodes = [];
                    if (data.pId == -1) {
                        newNodes = treeobj.addNodes(null, data);
                    } else {
                        var parentNode = treeobj.getNodeByParam('id', data.pId, null);
                        newNodes = treeobj.addNodes(parentNode, data);
                    }
                    treeobj.selectNode(newNodes[0]);
                } else {
                    $.getJSON('/prescription/disease/queryTree', {}, diseaseFunSet.loadTree);
                }
            } else {
                layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
            }
        })
    }

    /**
     * 加载疾病类型树
     * @param zNodes
     */
    var loadTree = function (zNodes) {
        if (zNodes.length > 0) {
            var diseaseTree = $.fn.zTree.init($("#treeDisease"), setting, zNodes);
            diseaseTree.expandAll(true);
            // 搜索框内容改变监听事件
            fuzzySearch('treeDisease','.tree-panel .search-input',null,true); //初始化模糊搜索方法
        } else {
            // 提示信息
            $('.tree-panel .blank-text-div').css('display','block');
        }
    }

    return {
        editDisease: editDisease,   // 编辑疾病名称
        loadTree: loadTree          // 加载疾病类型树
    }
})();

// ztree 参数设置
var setting = {
    view: {
        showLine: false
    },
    edit: {
        enable:true,
        showRemoveBtn:true,
        showRenameBtn:true,
        removeTitle:BTN.delete,
        renameTitle:BTN.edit
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {
        onClick: ztreeCallback.onClick,
        beforeEditName:ztreeCallback.beforeEditName,
        beforeRemove:ztreeCallback.beforeRemove
    }
};

$(function () {
    // 查询并加载菜单 tree
    $.getJSON('/prescription/disease/queryTree', {}, diseaseFunSet.loadTree);
    // 新增疾病按钮点击事件
    $("#addParentBtn").on('click', {flag: 0}, diseaseFunSet.editDisease);

    // tag-it 标签
    $('#details').tagit({});
    // 处方 保存按钮监听事件
    layui.form.on('submit(save)', function (data) {
        $.post('/prescription/prescribe/save', data.field, function (data) {
            if (data) {
                layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
            }
        });
    });


});

