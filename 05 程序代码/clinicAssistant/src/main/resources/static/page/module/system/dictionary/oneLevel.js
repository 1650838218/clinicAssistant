/** 菜单管理 */
//@ sourceURL=oneLevel.js
layui.use(['form', 'eleTree', 'jquery', 'layer', 'table', 'ajax'], function () {
    var $ = layui.jquery;
    var eleTree = layui.eleTree;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var rootMappint = '/system/dictionary/oneLevel';
    var leftTree;// 左侧菜单树
    var dictItemTableId = 'dict-item-table';
    var currentDictTypeId = '';
    form.render();

    $('#add-btn').on('click', resetForm);// 新增字典
    $('#del-btn').on('click', delDictionaryFun);// 删除字典
    form.on('submit(submit-btn)', saveDictionary);// 保存字典
    $("#dictionary-info input[name='menuName']").on("click", loadSelectTree); // 加载下拉树
    eleTree.on("nodeClick(eleTree-menu)", leftTreeClick);// 左侧菜单树点击事件

    // 加载左侧菜单树
    leftTree = eleTree.render({
        elem: '.left-tree',
        url: rootMappint + "/queryTree",
        method: "get",
        highlightCurrent: true,// 高亮显示当前节点
        defaultExpandAll: true,// 默认展开所有节点
        expandOnClickNode: false,// 单击展开
        checkOnClickNode: true,// 单击选中
        showCheckbox: false,// 是否显示复选框
        searchNodeMethod: function (value, data) {
            if (!value) return true;
            return data.label.indeeleTree-menuxOf(value) !== -1;
        },
        done: function (res) {
            console.log(res);
        }
    });

    // 搜索
    $(".left-panel .left-search .eleTree-search").on("change", function () {
        if (!!leftTree) leftTree.search($(this).val());
    });

    // 初始化表格
    table.render({
        elem: '#dict-item-table',
        limit: 15,// 每个字典类型最多可以录入30个字典项
        cols: [[
            {field: 'dictItemName', title: '字典项名称', width: '35%', edit: 'text'},
            {field: 'dictItemValue', title: '字典项值', width: '35%', edit: 'text'},
            {field: 'isUse', title: '是否可用', templet: '#is-use-switch', width: '15%', align: 'center'},
            {field: 'dictItemId', title: TABLE_COLUMN.operation, toolbar: '#operate-column', align: 'center'}
        ]],
        data: [{
            "dictItemName": "",
            "dictItemValue": "",
            "isUse": "1"
        }]
    });

    //监听表格操作列
    table.on('tool(' + dictItemTableId + ')', function (obj) {
        var data = obj.data;
        if (obj.event === 'create') {
            var dataBak = [];// 缓存表格已有的数据
            var oldData = table.cache[dictItemTableId];
            var newRow = {
                "dictItemName": "",
                "dictItemValue": "",
                "isUse": "1",
                "dictItemId": ''
            };
            // 获取当前行的位置
            var rowIndex = -1;
            try {
                rowIndex = obj.tr[0].rowIndex;
            } catch (e) {
                layer.alert(MSG.system_exception, {icon: 2});
            }
            //将之前的数组备份
            for (var i = 0; i < oldData.length; i++) {
                dataBak.push(oldData[i]);
            }
            // 插入空白行
            if (rowIndex != -1) {
                dataBak.splice(rowIndex + 1, 0, newRow);
            } else {
                dataBak.push(newRow);
            }
            table.reload(dictItemTableId, {
                data: dataBak   // 将新数据重新载入表格
            });
        } else if (obj.event === 'delete') {
            // 此处的删除是假删除，必须要将表格保存后才会生效
            // 不去后台删除的原因是：表格会统一跟随字典类型统一保存，页面上被删除的字典项会在保存时自动跟字典类型解除外键关系
            obj.del();// 先删除行
            // 再判断表格行是否全部删除
            var oldData = table.cache[dictItemTableId];
            if (oldData.length > 0) {
                // 做for循环的原因：obj.del只是把该行数据删掉，但是oldData的长度不变，必须要判断行数据是否为空
                for (var i = 0; i < oldData.length; i++) {
                    if (!!oldData[i]) {
                        layer.close(index);
                        return;
                    }
                }
            }
            // 如果表格行全部被删除，则新增一个空白行
            var newRow = [{
                "dictItemName": "",
                "dictItemValue": "",
                "isUse": "1",
                "dictItemId": ''
            }];
            table.reload(dictItemTableId, {
                data: newRow   // 将新数据重新载入表格
            });
        }
    });

    // 监听switch开关
    form.on('switch(is-use)', function (obj) {
        var selectIfKey = obj.othis;// 获取当前控件
        var parentTr = selectIfKey.parents("tr");// 获取当前所在行
        var parentTrIndex = parentTr.attr("data-index");// 获取当前所在行的索引
        var tableData = table.cache[dictItemTableId];
        if (tableData.length > parentTrIndex) {
            tableData[parentTrIndex].isUse = obj.elem.checked ? 1 : 0;
            table.reload(dictItemTableId, {
                data: tableData   // 将新数据重新载入表格
            });
        }
    });

    // 左侧字典树的点击事件 根据ID查询字典
    function leftTreeClick(d) {
        $(".select-tree").hide();// 隐藏下拉树
        if (d.data.currentData.nodeType === 'MENU') {// 当前节点类型是菜单节点
            currentDictTypeId = null;
            resetForm();// 重置表单
        } else if (d.data.currentData.nodeType === 'DICTIONARY_TYPE') {
            var dictionaryId = d.data.currentData.id;
            currentDictTypeId = dictionaryId;
            try {
                $.getJSON(rootMappint + '/getById', {"dictionaryId": dictionaryId}, function (dictionaryData) {
                    if (!!dictionaryData && !!dictionaryData.dictTypeId) {
                        assigForm(dictionaryData);// 给表单赋值
                        table.reload(dictItemTableId, {data: dictionaryData.dictItem})// 加载表格
                    } else {
                        layer.alert(MSG.query_fail, {icon: 2});
                    }
                });
            } catch (e) {
                console.log(e);
                layer.alert(MSG.query_fail, {icon: 2});
            }
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
        // 重置表格
        var newRow = [{
            "dictItemName": "",
            "dictItemValue": "",
            "isUse": "1",
            "dictItemId": ''
        }];
        table.reload(dictItemTableId, {
            data: newRow   // 将新数据重新载入表格
        });
    }

    /**
     * 给表单赋值
     * @param data
     */
    function assigForm(data) {
        // 表单赋值
        form.val("dictionary-form", {
            "dictTypeId": data.dictTypeId,
            "menuId": data.menuId,
            "menuName": data.menuName,
            "dictTypeName": data.dictTypeName,
            "dictTypeKey": data.dictTypeKey
        });
    }

    // 表单自定义校验规则
    form.verify({
        repeat: function (value, item) { //value：表单的值、item：表单的DOM对象
            var inputName = $(item).attr('name');
            var url = '';
            var msg = '';
            var data = {};
            data[inputName] = value.trim();
            data.dictTypeId = $('#dictionary-info input[name="dictTypeId"]').val();
            if (inputName === 'dictTypeName') {
                url = rootMappint + '/repeatTypeName';
                msg = '字典名称已被占用，请重新填写！';
            } else if (inputName === 'dictTypeKey') {
                url = rootMappint + '/repeatTypeKey';
                msg = '字典键已被占用，请重新填写！';
            }
            if (utils.isNotNull(url)) {
                ajax.getJSONAsync(url, data, function (result) {
                    if (result) msg = '';
                }, false);
            }
            return msg;
        },
        regExp: function (value, item) {
            var inputName = $(item).attr('name');
            var msg = '';
            var reg = '';
            if (inputName === 'dictTypeKey') {
                reg = /^[a-zA-Z][a-zA-Z_]*$/;
                msg = '字典键以英文字母开头，只能输入字母和下划线，请重新填写！';
            }
            if (!!msg && !reg.test(value)) {
                return msg;
            }
        }
    });

    /**
     * 删除菜单
     */
    function delDictionaryFun() {
        if (!!currentDictTypeId) {
            layer.confirm(MSG.delete_confirm + '此字典吗？', {icon: 3, title: '提示'}, function (index) {
                ajax.delete(rootMappint + '/delete/' + currentDictTypeId, function (data, textStatus, jqXHR) {
                    if (data) {
                        layer.msg(MSG.delete_success);
                        if (!!leftTree) leftTree = leftTree.reload();
                        resetForm();
                    } else {
                        layer.msg(MSG.delete_fail);
                    }
                });
                layer.close(index);
            });
        } else {
            layer.msg(MSG.select_one);
        }
    };

    // 表格数据校验
    function verifyTable(tableData) {
        if (!tableData) {
            layer.alert('表格数据为空，请填写表格数据！', {icon: 2});
            return false;
        }
        // 删除空数组
        for (var i = 0; i < tableData.length; i++) {
            if (Array.isArray(tableData[i]) && tableData[i].length === 0) {
                tableData.splice(i, 1);
            }
        }
        if (!tableData || tableData.length <= 0) {
            layer.alert('表格数据为空，请填写表格数据！', {icon: 2});
            return false;
        }
        for (var i = 0; i < tableData.length; i++) {
            // 判断是否是空行
            if (!tableData[i].dictItemName || !tableData[i].dictItemValue) {// 表格数据校验
                layer.alert('表格数据不完整，请补充完整！', {icon: 2});
                return false;
            }
        }
        // 校验是否有重复数据
        for (var i = 0; i < tableData.length - 1; i++) {
            var row1 = tableData[i];
            for (var j = i + 1; j < tableData.length; j++) {
                var row2 = tableData[j];
                if (row1.dictItemName === row2.dictItemName
                    || row1.dictItemValue === row2.dictItemValue) {
                    layer.alert('字典项名称和字典项值不能重复，请重新填写！', {icon: 2});
                    return false;
                }
            }
        }
        return tableData;
    }

    /**
     * 保存字典
     * @param data
     * @returns {boolean}
     */
    function saveDictionary(obj) {
        $(obj.elem).addClass('layui-btn-disabled');// 按钮禁用，防止重复提交
        $(obj.elem).attr('disabled', 'disabled');
        var dictionary = obj.field;// 表单值
        var dictItems = table.cache[dictItemTableId];// 获取表格数据
        dictItems = verifyTable(dictItems);// 表格数据校验
        if (!dictItems) {
            $(obj.elem).removeClass('layui-btn-disabled');// 按钮可用
            $(obj.elem).removeAttr('disabled');
            return false;
        }
        dictionary.dictItem = dictItems;
        ajax.postJSON(rootMappint + '/save', dictionary, function (dict) {
            if (!!dict && !!dict.dictTypeId) {
                assigForm(dict);// 赋值
                table.reload(dictItemTableId, {data: dict.dictItem});
                if (!!leftTree) leftTree = leftTree.reload({async: false});
                leftTree.setHighLight(dict.dictTypeId);// 高亮显示当前菜单
                currentDictTypeId = dict.dictTypeId;
                layer.msg(MSG.save_success);
            } else {
                layer.msg(MSG.save_fail);
            }
            $(obj.elem).removeClass('layui-btn-disabled');// 按钮可用
            $(obj.elem).removeAttr('disabled');
        });
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

