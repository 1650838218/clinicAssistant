$(function () {
    // ztree 参数设置
    var setting = {
        view: {
            showLine: false,
            selectedMulti:false,
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        edit: {
            enable:true,
            removeTitle:BTN.delete,
            renameTitle:BTN.edit
        },
        callback: {
            onClick: onClick,
            beforeRemove:beforeRemove,
            beforeRename:beforeRename
        }
    };

    // 添加菜单 按钮点击事件
    $("#addMenuBtn").on('click', function () {
        var menuTree = $.fn.zTree.getZTreeObj('menuTree');
        if (menuTree == null) {
            $("form[lay-filter='menuForm']").find("button[type='reset']").click();// 重置右侧表单
        } else {
            var selectNodes = menuTree.getSelectedNodes();
            if (selectNodes == null || selectNodes.length <= 0) {
                $("form[lay-filter='menuForm']").find("button[type='reset']").click();// 重置右侧表单
            } else {
                var selectNode = selectNodes[0];
                $("form[lay-filter='menuForm']").find("button[type='reset']").click();// 重置右侧表单
                layui.form.val('menuForm',{
                    'pId':selectNode.id
                });
            }
        }
    });

    // 查询并加载菜单 tree
    $.getJSON('/menu/queryTree', {}, function (zNodes) {
        if (zNodes == null || zNodes.length <= 0) {
            $('.tree-panel .blank-text-div').css('dispaly','block');
        } else {
            var menuTree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
            menuTree.expandAll(true);
            // 搜索框内容改变监听事件
            fuzzySearch('menuTree','.tree-panel .search-input',null,true); //初始化模糊搜索方法
        }
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
            "name": treeNode.name,
            "sort": treeNode.sort,
            "url": treeNode.url,
            'id': treeNode.id,
            'pId':treeNode.pId
        })
    }

    /**
     * ztree自定义添加按钮
     * @param treeId
     * @param treeNode
     */
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) {
            btn.bind("click", function () {
                $("form[lay-filter='menuForm']").find("button[type='reset']").click();// 重置右侧表单
                layui.form.val('menuForm',{
                    'pId':treeNode.id
                });
                return false;
            });
        }
    }

    /**
     * ztree 隐藏增加按钮
     * @param treeId
     * @param treeNode
     */
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    }
});