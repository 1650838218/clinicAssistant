$(function () {
    // ztree 参数设置
    var setting = {
        view: {
            showLine: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: onClick
        }
    };

    // 查询并加载菜单 tree
    $.getJSON('/menu/queryTree', {}, function (zNodes) {
        var menuTree = $.fn.zTree.init($("#treeMenu"), setting, zNodes);
        menuTree.expandAll(true);
    });


    // 提交按钮监听事件
    layui.form.on('submit(save)', function (data) {
        $.post('/menu/save', data.field, function (data) {
            if (data) {
                layer.msg('保存成功', {time: 2000});
            }
        });
    });

    /**
     * 点击树节点（菜单）触发，在右侧表单中显示菜单详情
     * @param event
     * @param treeId
     * @param treeNode
     */
    function onClick(event, treeId, treeNode) {
        var form = layui.form;
        //表单初始赋值
        form.val('menuForm', {
            "name": treeNode.name
            , "sort": treeNode.sort
            , "url": treeNode.url
            , 'id': treeNode.id
        })
    }

});