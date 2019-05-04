/** 供应商 */
//@ sourceURL=supplier.js
layui.use(['utils', 'jquery', 'layer', 'table', 'ajax'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var utils = layui.utils;
    var rootMappint = '/pharmacy/supplier';
    var supplierTableId = 'supplier-table';

    // 初始化表格
    table.render({
        elem: '#supplier-table',
        url: rootMappint + '/findAll',
        limit: 300,// 最多可有300个供应商
        cols: [[
            {field: 'supplierId', title: TABLE_COLUMN.numbers, width: '5%', type: 'numbers'},
            {field: 'supplierName', title: '供应商名称', width: '20%', edit: 'text'},
            {field: 'supplierPhone', title: '联系方式', width: '20%', edit: 'text'},
            {field: 'supplierAddress', title: '地址', edit: 'text'},
            {title: TABLE_COLUMN.operation, toolbar: '#operate-column', width: '13%', align: 'center'}
        ]],
        parseData: function (res) {
            if (res == null || res.data == null || res.data.length <= 0) {
                res.count = 1;
                res.code = 0;
                res.msg = '';
                res.data = [{
                    supplierId: '',
                    supplierName: '',
                    supplierPhone: '',
                    supplierAddress: ''
                }];
            }
        },
        done: function (res, curr, count) {

        }
    });

    //监听表格操作列
    table.on('tool(' + supplierTableId + ')', function (obj) {
        var data = obj.data;
        if (obj.event === 'create') {
            createRow(obj);
        } else if (obj.event === 'delete') {
            deleteRow(obj);
        } else if (obj.event === 'save') {
            saveRow(obj);
        }
    });

    // 新增行
    function createRow(obj) {
        var dataBak = [];// 缓存表格已有的数据
        var oldData = table.cache[supplierTableId];
        var newRow = {
            supplierId: '',
            supplierName: '',
            supplierPhone: '',
            supplierAddress: ''
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
            if (!Array.isArray(oldData[i]) || oldData[i].length > 0)
                dataBak.push(oldData[i]);
        }
        // 插入空白行
        if (rowIndex != -1) {
            dataBak.splice(rowIndex + 1, 0, newRow);
        } else {
            dataBak.push(newRow);
        }
        table.reload(supplierTableId, {
            url:'',
            data: dataBak   // 将新数据重新载入表格
        });
    }

    // 删除行
    function deleteRow(obj) {
        // 此处的删除是真删除
        layer.confirm(MSG.delete_confirm + '该供应商吗？', {icon: 0}, function (index) {
            var supplierId = obj.data.supplierId;
            if (utils.isNotNull(supplierId)) {
                ajax.delete(rootMappint + '/delete/' + supplierId, function (success) {
                    if (success) {
                        layer.msg(MSG.delete_success);
                        obj.del();
                    } else {
                        layer.msg(MSG.delete_fail);
                    }
                });
            } else {
                layer.msg(MSG.delete_success);
                obj.del();
            }
            layer.close(index);
            // 判断表格行是否全部删除
            var oldData = table.cache[supplierTableId];
            if (oldData.length > 0) {
                // 做for循环的原因：obj.del只是把该行数据删掉，但是oldData的长度不变，必须要判断行数据是否为空
                for (var i = 0; i < oldData.length; i++) {
                    if (!Array.isArray(oldData[i]) || oldData[i].length > 0) {
                        return;
                    }
                }
            }
            // 如果表格行全部被删除，则新增一个空白行
            var newRow = [{
                supplierId: '',
                supplierName: '',
                supplierPhone: '',
                supplierAddress: ''
            }];
            table.reload(supplierTableId, {
                url: '',
                data: newRow   // 将新数据重新载入表格
            });
        });
    }
    
    // 保存行
    function saveRow(obj) {
        // 行数据校验
        var rowData = obj.data;
        var rowIndex = obj.tr[0].rowIndex;
        if (!utils.isNotNull(rowData.supplierName.trim())
            || !utils.isNotNull(rowData.supplierPhone.trim())) {
            layer.msg('供应商名称和联系方法不能为空！', {icon: 5, shift: 6});
        }
        ajax.postJSON(rootMappint + '/save', rowData, function (supplier) {
            if (supplier != null && utils.isNotNull(supplier.supplierId)) {
                layer.msg(MSG.save_success);
                var oldData = table.cache[supplierTableId];
                for (var i = 0; i < oldData.length; i++) {
                    if (oldData[i][table.config.indexName] === rowIndex) {
                        oldData[i].supplierId = supplier.supplierId;
                        oldData[i].supplierName = supplier.supplierName;
                        oldData[i].supplierPhone = supplier.supplierPhone;
                        oldData[i].supplierAddress = supplier.supplierAddress;
                        break;
                    }
                }
                table.reload(supplierTableId, {
                    url: '',
                    data: oldData
                });
            } else {
                layer.msg(MSG.save_fail);
            }
        }, obj.tr.find('td').last().find('a[lay-event="save"]'));
    }
});