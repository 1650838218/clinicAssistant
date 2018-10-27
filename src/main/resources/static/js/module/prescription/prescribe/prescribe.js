/*处方管理*/
var functionSet = (function () {

    /**
     * 疾病编辑
     * @param flag
     */
    var editDisease = function (flag) {
        // 获取目录树中已选择的疾病类别
        var treeobj = $.fn.zTree.getZTreeObj("treeDisease");
        var selectNodes = treeobj.getSelectedNodes();
        if (flag == 0) {// 新增
            $("form[lay-filter='diseaseForm']")[0].reset();
            if (selectNodes.length > 0) {
                // ztee 获取某节点的祖先节点，并用符号连接
                layui.form.val('diseaseForm', {
                    'pId':selectNodes[0].pId,
                    'belong':getAncestorNodes(selectNodes[0])
                });
            } else {
                layui.form.val('diseaseForm', {
                    'pId':selectNodes[0].pId,
                    'belong':'ROOT'
                });
            }
            showEditWindow();
        } else if (flag == 1) {// 修改
            if (selectNodes.length > 0) {
                layui.form.val('diseaseForm', {
                    'id':selectNodes[0].id,
                    'pId':selectNodes[0].pId,
                    'name':selectNodes[0].name,
                    'belong':getAncestorNodes(selectNodes[0])
                });
                showEditWindow();
            }
        }
    }

    /**
     * 弹出疾病编辑框
     */
    var showEditWindow = function () {
        // 将编辑面板移动到index.html的layerPanel中，不做这一步，遮罩会有问题
        $("#layerPanel").append($("#layerContent div"));
        layer.prompt({
            skin:'layer-myskin',
            title:'基本信息',
            btn:['保存'],
            content: $("#layerPanel"),
            end:function () {
                $("#layerContent").append($("#layerPanel div"));
            },
            yes:function () {
                // 获取表单的数据，并保存
            }
        });
    }
    
    /**
     * ztree 获取祖先节点
     * @param node
     * @param connector
     * @returns {null}
     */
    var getAncestorNodes = function (node,connector) {
        if (node == null) return null;
        if (connector == null || connector == '') {
            connector = '->';
        }
        var newNode = node;
        var str = connector + newNode.name;
        while (newNode.getParentNode() != null) {
            var parentNode = newNode.getParentNode();
            str = connector + parentNode.name + str;
            newNode = parentNode;
        }
        return str.substr(2);
    }
    
    return {

    }
})();

$(function () {
    // tag-it 标签
    $('#details').tagit({
    });

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


    // 新增疾病按钮点击事件
    $("#addParentBtn").on('click', function () {

    });
});


