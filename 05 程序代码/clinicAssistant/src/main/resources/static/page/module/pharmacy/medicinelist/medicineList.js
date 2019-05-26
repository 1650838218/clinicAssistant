/** 药品清单 */
//@ sourceURL=medicineList.js
layui.use(['form', 'utils', 'jquery', 'layer', 'table', 'ajax'], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var utils = layui.utils;
    var leftTableId = 'left-table';
    var rootMapping = '/pharmacy/medicineList';
    form.render();

    // 初始化表格
    table.render({
        elem: '#left-table',
        // url: rootMapping + '/queryPage',
        height: 'full-140',
        page: {
            limit: 20,
            groups: 3,
            layout: ['count','refresh']
        },
        request: {
            limitName: 'size' //每页数据量的参数名，默认：limit
        },
        cols: [[
            {field: 'medicineName', title: '药品名称'}
        ]],
        done: function (res, curr, count) {
            $('#add-btn').click();// 清空表单
            $('#del-btn').addClass('layui-btn-disabled').attr('disabled','disabled');// 禁用 删除按钮
            // 选中当前行
            var medicineListId = $('#medicinelist-form input[name="medicineListId"]').val();
            if (utils.isNotNull(medicineListId)) {
                var tableData = table.cache[leftTableId];
                if (utils.isNotEmpty(tableData)) {
                    for (var i = 0; i < tableData.length; i++) {
                        if (parseInt(tableData[i].medicineListId) === parseInt(medicineListId)) {
                            var rowIndex = tableData[i][table.config.indexName];
                            $('.left-panel .layui-table tbody tr[data-index="' + rowIndex + '"]').find('div').addClass('select');
                        }
                    }
                }
            }

        }
    });

    // 动态加载药品类型下拉框
    utils.splicingOption({
        elem: $('#medicinelist-form select[name="medicineType"]'),
        where: {dictTypeKey: 'YPFL'},
    });

    // 监听药品名称输入事件
    $('#medicinelist-form input[name="medicineName"]').on('input propertychange', function () {
        var medicineName = $(this).val().trim();
        if (utils.isNotNull(medicineName)) {
            var fullPinyin = pinyinUtil.getPinyin(medicineName, '', false, true);
            var abbreviation = pinyinUtil.getFirstLetter(medicineName, true);
            $('#medicinelist-form input[name="fullPinyin"]').val(fullPinyin);
            $('#medicinelist-form input[name="abbreviation"]').val(abbreviation);
        } else {
            $('#medicinelist-form input[name="fullPinyin"]').val('');
            $('#medicinelist-form input[name="abbreviation"]').val('');
        }
    });

    // 新增 药品
    $('#add-btn').click(function () {
        utils.clearForm('#medicinelist-form');// 清空表单
        form.val('medicinelist-form', {
            medicineType: 1,
            poisonous: 'false'
        });// 设置初始值
        form.render();
    });

    // 删除 药品
    $('#del-btn').click(function () {
        layer.confirm(MSG.delete_confirm + '该药品吗？',{icon: 3}, function () {
            var medicineListId = $('#medicinelist-form input[name="medicineListId"]').val();
            if (medicineListId != null && medicineListId != undefined && medicineListId != '') {
                ajax.delete(rootMapping + '/delete/' + medicineListId, function (success) {
                    if (success) {
                        layer.msg(MSG.delete_success);
                        table.reload(leftTableId, {});
                    } else {
                        layer.msg(MSG.delete_fail);
                    }
                });
            } else {
                layer.msg('药品ID为空，无法删除！', {icon:2});
            }
        });
    });

    // 表单自定义校验规则
    form.verify({
        repeat: function (value, item) { //value：表单的值、item：表单的DOM对象
            var inputName = $(item).attr('name');
            var url = '';
            var msg = '';
            var data = {};
            data[inputName] = value.trim();
            data.medicineListId = $('#medicinelist-form input[name="medicineListId"]').val();
            if (inputName === 'medicineName') {
                url = rootMapping + '/notRepeatName';
                msg = '药品名称已被占用，请重新填写！';
            } else if (inputName === 'barcode') {
                url = rootMapping + '/notRepeatBarcode';
                msg = '条形码已被占用，请重新填写！';
            }
            if (utils.isNotNull(url) && utils.isNotNull(data[inputName])) {
                ajax.getJSONAsync(url, data, function (result) {
                    if (result) msg = '';
                }, false);
            } else {
                msg = '';
            }
            return msg;
        },
        regExp: function (value, item) {
            var inputName = $(item).attr('name');
            var msg = '';
            var reg = '';
            if (inputName === 'barcode') {
                reg = /^[a-zA-Z0-9]*$/;
                msg = '条形码只能输入数字和字母，请重新填写！';
            }
            if (!!msg && !reg.test(value)) {
                return msg;
            }
        }
    });

    // 保存
    form.on('submit(submit-btn)', function (data) {
        var formData = data.field;
        ajax.postJSON(rootMapping + '/save', formData, function (medicineList) {
            if (medicineList != null && utils.isNotNull(medicineList.medicineListId)) {
                getById(medicineList.medicineListId);
                layer.msg(MSG.save_success);
                table.reload(leftTableId, {});
            } else {
                layer.msg(MSG.save_fail);
            }
        }, data.elem);
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });

    // 取消
    $('#cancel-btn').click(function () {
        var medicineListId = $('#medicinelist-form input[name="medicineListId"]').val();
        if (medicineListId !== null && medicineListId !== undefined && medicineListId !== '') {
            getById(medicineListId);// 重新查询
        } else {
            $('#add-btn').click();// 清空表单
        }
    });

    // 监听行单击事件
    table.on('row(left-table)', function (obj) {
        $('.left-panel .layui-table tbody tr div').removeClass('select');
        $(obj.tr).find('div').addClass('select');
        $('#del-btn').removeClass('layui-btn-disabled').removeAttr('disabled');
        // $('#del-btn').removeAttr('disabled');
        // 获取id，根据ID查询多级字典，表单设置值
        var medicineListId = obj.data.medicineListId;
        getById(medicineListId);

    });

    // 根据id查询多级字典
    function getById(medicineListId) {
        if (utils.isNotNull(medicineListId)) {
            $.getJSON(rootMapping + '/getById', {medicineListId: medicineListId}, function (medicineList) {
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

    // 查询 药品
    var timeoutId = null;
    var lastKeyword = '';
    $('.left-panel .left-search input').bind('input porpertychange', function () {
        var _keywords = $(this).val();
        if (timeoutId) {
            clearTimeout(timeoutId);
        }
        timeoutId = setTimeout(function() {
            if (lastKeyword === _keywords) {
                return;
            }
            table.reload(leftTableId, {where: {keywords: _keywords}});
            lastKeyword = _keywords;
        }, 500);
    });
});