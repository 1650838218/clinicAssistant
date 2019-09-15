/** 采购单 */
//@ sourceURL=purchaseBillForm.js
layui.use(['form','utils', 'jquery', 'layer', 'table', 'ajax', 'laydate','optimizeSelectOption'], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var utils = layui.utils;
    var laydate = layui.laydate;
    var rootMapping = '/pharmacy/purchasebill';
    var itemTableId = 'purchasebill-table';
    var formId = 'purchasebill-form';
    var medicineLayer = null;
    form.render();

    // 动态加载供应商
    utils.splicingOption({
        elem: $('#' + formId + ' select[name="supplierId"]'),
        tips: '请选择供应商',
        url:'/pharmacy/supplier/getSelectOption',
        realValueName: 'realValue',
        displayValueName: 'displayValue',
    });
    // 动态加载日期控件
    laydate.render({
        elem: '#' + formId + ' input[name="purchaseBillDate"]',
        value: new Date(),
        isInitValue: true
    });
    // 动态加载数量单位下拉框
    utils.splicingOption({
        elem: $('#count-unit-select select[name="countUnit"]'),
        where: {dictTypeKey: 'SLDW'},
        defaultValue:1
    });

    // 初始化表格
    /*var itemTable = table.render({
        elem: '#purchasebill-table',
        limit: 500,//
        height: 'full-240',
        cols: [[
            {field: 'goodsName', title: '药品名称', width: '20%', edit: 'text', event: 'searchMedicine'},
            {field: 'specifications', title: '规格', width: '18%', edit: 'text'},
            {field: 'manufacturer', title: '制造商', width: '18%', edit: 'text'},
            {field: 'count', title: '数量', width: '8%', edit: 'text'},
            {field: 'countUnit', title: '单位', width: '12%', templet: '#count-unit-select',},
            {field: 'unitPrice', title: '单价(元)', width: '8%', edit: 'text'},
            {field: 'totalPrice', title: '总价(元)', width: '8%', edit: 'text'},
            {field: 'purchaseBillItemId', title: TABLE_COLUMN.operation, toolbar: '#operate-column', align: 'center'}
        ]],
        data: [{
            "goodsName": "",
        }]
    });*/
    $('#purchasebill-table').datagrid({
        fitColumns: true,// 横向充满，防止出现横向滚动条
        autoRowHeight: false,
        rownumbers: true,
        scrollbarSize: 8,
        columns:[
            [
                {field: 'goodsName', title: '药品名称', width: '200', editor: 'combobox'},
                {field: 'specifications', title: '规格', width: '180', editor: 'text'},
                {field: 'manufacturer', title: '制造商', width: '180', editor: 'text'},
                {field: 'count', title: '数量', width: '100', editor: 'numberbox'},
                {field: 'countUnit', title: '单位', width: '120', editor: 'combobox'},
                {field: 'unitPrice', title: '单价(元)', width: '120', editor: 'numberbox'},
                {field: 'totalPrice', title: '总价(元)', width: '80', editor: 'numberbox'},
                {field: 'purchaseBillItemId', title: TABLE_COLUMN.operation, width:'150', fixed: true, align: 'center',
                    formatter: function(value,row,index){
                        var Action = "<a class=\"layui-btn layui-btn-normal layui-btn-xs\" lay-event=\"create\">新增</a>\n" +
                            "    <a class=\"layui-btn layui-btn-normal layui-btn-xs\" lay-event=\"delete\">删除</a>";
                        return Action;
                    }
                }
            ]
        ],
        data: [
            {},{},{},{}
        ]
    });

    // 表格添加行
    function addRow(obj) {
        var dataBak = [];// 缓存表格已有的数据
        var oldData = table.cache[itemTableId];
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
        table.reload(itemTableId, {
            data: dataBak   // 将新数据重新载入表格
        });
    }

    //监听表格操作列
    table.on('tool(' + itemTableId + ')', function (obj) {
        var data = obj.data;
        var tr = obj.tr;
        var tdElem = this, jqTd = $(tdElem);
        if (obj.event === 'create') {
            // addRow();
            itemTable.addRow({});
        }
        else if (obj.event === 'delete') {
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
        else if (obj.event === 'searchMedicine') {
            // 监听表格药品名称列的点击事件，输入时自动搜索药品并用layer显示
            var offset = tdElem.getBoundingClientRect();// 当前单元格的位置
            var layerPosition = {top: offset.top + $(tr).height() + 4, left: offset.left};
            function medicineFilter(_keywords) {
                if (medicineLayer) layer.close(medicineLayer);
                medicineLayer = layer.open({
                    type: 1,// 页面层
                    title: false,// 不显示标题
                    closeBtn: 0,// 不显示关闭按钮
                    shade: 0,// 不显示遮罩
                    anim: -1,// 不显示动画
                    fixed: false,// 位置固定
                    isOutAnim: false,// 不开启关闭动画
                    offset: [layerPosition.top + 'px', layerPosition.left + 'px'],// 位置
                    // area: [dlElem.outerWidth() + 'px', dlElem.outerHeight() + 'px'],
                    area: jqTd.outerWidth() + 'px',
                    content: '<div class="layui-unselect layui-form-select layui-form-selected"></div>',
                    // skin: 'layui-option-layer',
                    success: function (layero, index) {
                        var select = layero.find('.layui-layer-content').css({overflow: 'hidden'}).find('.layui-form-selected');
                        var optionHtml = '<dl class="layui-anim layui-anim-upbit" style="top: 0px; position: relative;"><dd lay-value="" class="layui-select-tips layui-this">请选择供应商</dd><dd lay-value="155" class="">神威大药房</dd><dd lay-value="156" class="">桂林三金</dd></dl>';
                        select.append(optionHtml);
                        jqTd.find('input.layui-table-edit').on('keydown', function(e) {
                            var keyCode = e.keyCode;
                            e.preventDefault();
                            if (keyCode === 38) { //Up 键
                                var currDD = select.find('dd.layui-this');
                                var prevDD = currDD.prev();
                                if (prevDD.length > 0) {
                                    currDD.removeClass('layui-this');
                                    prevDD.addClass('layui-this');
                                }
                            }
                            if (keyCode === 40) { //Down 键
                                var currDD = select.find('dd.layui-this');
                                var nextDD = currDD.next();
                                if (nextDD.length > 0) {
                                    currDD.removeClass('layui-this');
                                    nextDD.addClass('layui-this');
                                }
                            }
                            if (keyCode === 13) {
                                // 获取当前选中的option，后台查询，将查询结果更新到表格中
                                jqTd.find('input.layui-table-edit').blur();
                                var currDD = select.find('dd.layui-this');
                                obj.update({goodsName: currDD.val()});
                                layer.close(medicineLayer);
                            }
                        });
                    }
                });
            }

            var lastKeyword = '';
            var timeoutId = null;
            $('input.layui-table-edit').on('input propertychange', function (event) {
                // 输入后先查询，有查询结果再弹layer，无结果则隐藏
                var _keywords = $(this).val();
                if (timeoutId) {
                    clearTimeout(timeoutId);
                }
                timeoutId = setTimeout(function() {
                    if (lastKeyword === _keywords) {
                        return;
                    }
                    medicineFilter(_keywords); //lazy load ztreeFilter function
                    lastKeyword = _keywords;
                }, 0);
            });
        }
    });

    // 根据id查询多级字典
    function getById(purchaseBillId) {
        if (utils.isNotNull(purchaseBillId)) {
            $.getJSON(rootMapping + '/getById', {purchaseBillId: purchaseBillId}, function (medicineList) {
                if (medicineList != null) {
                    console.log(medicineList);
                    form.val('medicinelist-form', medicineList);
                } else {
                    layer.alert('未找到该药品，请重试！',{icon: 0}, function (index) {
                        table.reload(leftTableId, {});
                        layer.close(index);
                    });
                }
            });
        }else {
            layer.msg('药品ID为空，无法查询！', {icon:2});
        }
    }






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
});

