/** 菜单管理 */
//@ sourceURL=oneLevel.js
layui.use(['form', 'eleTree', 'jquery', 'layer', 'table'], function () {
    var $ = layui.jquery;
    var eleTree = layui.eleTree;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var leftTree;// 左侧菜单树
    form.render();

    $('#add-btn').on('click', resetForm);// 新增菜单
    $('#del-btn').on('click', delDictionaryFun);// 删除菜单
    form.on('submit(submit-btn)', saveDictionary);// 保存菜单
    $('#reset-btn').on('click', resetForm);// 重置菜单
    $("#dictionary-info input[name='menuName']").on("click", loadSelectTree); // 加载下拉树
    eleTree.on("nodeClick(eleTree-menu)", leftTreeClick);// 左侧菜单树点击事件

    // 加载左侧菜单树
    leftTree = eleTree.render({
        elem: '.left-tree',
        url: "/system/dictionary/queryTree",
        method: "get",
        highlightCurrent: true,// 高亮显示当前节点
        defaultExpandAll: true,// 默认展开所有节点
        expandOnClickNode: false,// 单击展开
        checkOnClickNode: true,// 单击选中
        showCheckbox: false,// 是否显示复选框
        searchNodeMethod: function (value, data) {
            if (!value) return true;
            return data.label.indexOf(value) !== -1;
        }
    });

    // 搜索
    $(".left-panel .left-search .eleTree-search").on("change", function () {
        if (!!leftTree) leftTree.search($(this).val());
    });

    // 初始化表格
    table.render({
        elem: '#dict-item-table',
        cols: [[
            {field: 'dictItemName', title: '字典项名称', width: '35%', edit: 'text'},
            {field: 'dictItemValue', title: '字典项值', width: '35%', edit: 'text'},
            {field: 'isUse', title: '是否可用', templet: '#is-use-switch', width: '15%', align: 'center'},
            {field: 'dictItemId', title: '操作', toolbar: '#operate-column', align: 'center'}
        ]],
        data: [{
            "dictItemName": "",
            "dictItemValue": "",
            "isUse": "1"
        }]
    });

    //监听表格操作列
    table.on('tool(dict-item-table)', function (obj) {
        var data = obj.data;
        console.log(obj);
        if (obj.event === 'create') {
            var dataBak = [];// 缓存表格已有的数据
            var oldData = table.cache['dict-item-table'];
            var newRow = {
                "dictItemName": "",
                "dictItemValue": "",
                "isUse": "1"
            };
            for (var i = 0; i < oldData.length; i++) {
                dataBak.push(oldData[i]);      //将之前的数组备份
            }
            dataBak.push(newRow);
            table.reload("dict-item-table", {
                data: dataBak   // 将新数据重新载入表格
            });
        } else if (obj.event === 'delete') {
            layer.confirm('确认删除该字典项吗？', function (index) {
                obj.del();
                layer.close(index);
            });
        }
    });


    // 左侧菜单树的点击事件 根据ID查询菜单详情
    function leftTreeClick(d) {
        var dictionaryId = d.data.currentData.id;
        $(".select-tree").hide();// 隐藏下拉树
        try {
            $.getJSON('/system/menu/getById', {"dictionaryId": dictionaryId}, function (dictionaryData) {
                if (!!dictionaryData && !!dictionaryData.dictionaryId) {
                    assigForm(dictionaryData);// 给表单赋值
                } else {
                    layer.alert('查询失败！');
                }
            });
        } catch (e) {
            console.log(e);
            layer.alert('查询失败！');
        }
    };

    /**
     * 重置表单
     */
    function resetForm() {
        // 表单清空
        assigForm({
            dictionaryId: '',
            menuId: '',
            menuName: '',
            dictionaryName: '',
            dictionaryKey: ''
        });
        // 删除高亮
        leftTree.unHighLight();
    }

    /**
     * 给表单赋值
     * @param data
     */
    function assigForm(data) {
        // 表单赋值
        form.val("dictionary-form", {
            "menuId": data.dictionaryId,
            "parentMenuId": data.menuId,
            "menuName": data.menuName,
            "parentMenuName": data.dictionaryName,
            "menuUrl": data.dictionaryKey
        });
    }

    /**
     * 删除菜单
     */
    function delDictionaryFun() {
        var menuId = $('#dictionary-info input[name="menuId"]').val();
        if (!!menuId) {
            try {
                layer.confirm('确认删除此菜单吗？', {icon: 3, title: '提示'}, function (index) {
                    $.ajax({
                        url: '/system/menu/delete/' + menuId,
                        type: 'delete',
                        success: function (data, textStatus, jqXHR) {
                            if (data) {
                                layer.msg('删除成功！');
                                if (!!leftTree) leftTree.reload();
                                resetForm();
                            } else {
                                layer.msg('删除失败！');
                            }
                        },
                        error: function () {
                            layer.msg('删除失败！');
                        }
                    });
                    layer.close(index);
                });
            } catch (e) {
                layer.msg('删除失败！');
            }
        } else {
            layer.msg('请先选择一条记录！');
        }
    };

    /**
     * 保存菜单
     * @param data
     * @returns {boolean}
     */
    function saveDictionary(data) {
        try {
            $(data.elem).attr({"disabled": "disabled"});// 按钮禁用，防止重复提交
            data.field.isUse = data.field.isUse == "on" ? "1" : "0";
            $.post('/system/menu/save', data.field, function (menu) {
                if (!!menu && !!menu.menuId) {
                    assigForm(menu);// 赋值
                    $(data.elem).removeAttr('disabled');// 按钮可用
                    layer.msg('保存成功！');
                } else {
                    layer.msg('保存失败！');
                }
                if (!!leftTree) leftTree.reload({async: false});
                leftTree.setHighLight(menu.menuId);// 高亮显示当前菜单
            });
        } catch (e) {
            layer.msg('保存失败！');
            console.log(e);
        }
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    };

    // 查询加载树形下拉框的内容
    function loadSelectTree(e) {
        e.stopPropagation();
        var selectMenuTree = eleTree.render({
            elem: '.select-tree',
            url: "/system/menu/querySelectTree",
            method: "get",
            defaultExpandAll: true,
            expandOnClickNode: false,
            highlightCurrent: true
        });
        $(".select-tree").toggle();
    };

    // 下拉树选中事件
    eleTree.on("nodeClick(menu-eleTree)", function (d) {
        $("[name='menuId']").val(d.data.currentData.id);
        $("[name='menuName']").val(d.data.currentData.label);
        $(".select-tree").hide();
    });

    // 下拉树隐藏
    $(document).on("click", function () {
        $(".select-tree").hide();
    });

});

