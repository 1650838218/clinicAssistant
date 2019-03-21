// 采购入库js
//@ sourceURL=order.js
$(function () {
    // 后台根据默认条件查询订单，默认条件：最近三个月的未入库订单
    $.getJSON('static/data/order.json', {}, loadOrder);
    // 订单查询条件改变事件
    $('.div-search .form-control').on('change', reloadOrder);
    // 初始化日期控件
    initDatetimepicker();
    // 初始化表格
    $('#orderTable').bootstrapTable();
    // 订单下拉框的change事件
    $('.div-search .selectpicker').on('change', queryOrderDetail);
    // 切换查询条件 显示/隐藏 的状态
    $('#toggleSearch').on('click',toggleSearch);
    // 下拉按钮监听事件
    $('#orderModal').on('hide.bs.modal',orderModalHide);
    $('#orderModal').on('show.bs.modal',orderModalShow);
    $('#editOrderBtn').on('click',editOrder);
    $('#saveOrderBtn').on('click',saveOrder);
    $('#delOrderBtn').on('click',delOrder);
    $('#orderDetailModal').on('hide.bs.modal',orderDetailModalHide);
    $('#orderDetailModal').on('show.bs.modal',orderDetailModalShow);
    $('#saveOrderDetailBtn').on('click',saveOrderDetail);
    // $('#delOrderDetailBtn').on('click',delOrderDetail);
    $('#storageBtn').on('click',orderStorage);// 订单入库

    // 订单模态框隐藏时重置表单
    function orderModalHide(event) {
        $("#orderModal input").val('');
        $("#orderModal select").each(function (index,ele) {
            $(ele).find('option:first').prop("selected", 'selected');
        });
        $('#orderModal form').data('bootstrapValidator').resetForm(true);// 清空校验
    };

    // 订单模态框显示时修改标题
    function orderModalShow(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        var modal = $(this);
        if (recipient == 'create') {
            modal.find('.modal-title').text('新建订单');
            addOrder();
        } else if (recipient == 'update') {
            modal.find('.modal-title').text('修改订单');
            // editOrder();
        }
    };

    // 订单模态框隐藏时重置表单
    function orderDetailModalHide(event) {
        $("#orderDetailModal input").val('');
        $("#orderDetailModal select").each(function (index,ele) {
            $(ele).find('option:first').prop("selected", 'selected');
        });
        $('#orderDetailModal form select[name="pinyin"]').empty();
        $('#orderDetailModal form').data('bootstrapValidator').resetForm(true);// 清空校验
    };

    // 订单模态框显示时修改标题
    function orderDetailModalShow(event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        var modal = $(this);
        if (recipient == 'create') {
            modal.find('.modal-title').text('添加明细');
        } else if (recipient == 'update') {
            modal.find('.modal-title').text('修改明细');
            // editOrderDetail(button.data('value'));
        }
    };

    /**
     * 添加订单明细
     */
    function addOrderDetail() {
        // 初始化
        $('#orderModal input[name="type"]').val('1');
        $('#orderModal input[name="date"]').val(new Date().format("yyyy-MM-dd"));
        $('#orderModal .selectpicker').selectpicker('render');
    }

    /**
     * 修改订单明细
     */
    editOrderDetail = function(orderDetailId) {
        if (orderDetailId) {
            $('#orderDetailModal').find('.modal-title').text('修改明细');
            try {
                // 根据ID查询订单明细
                $.getJSON('/static/data/orderItem.json', {orderDetailId: orderDetailId}, function (data) {
                    // 赋值
                    $("#orderDetailModal form").fillData(data);
                    $('#orderDetailModal').modal({backdrop: 'static'});// 显示模态框
                });
            } catch (e) {
                layer.alert('订单明细查询失败，请联系系统管理员！',{title: '错误',icon: 2});
            }
        } else {
            layer.alert('该订单明细ID为空，请联系系统管理员！',{title: '错误',icon: 2});
        }
    }

    /**
     * 删除订单明细
     */
    delOrderDetail = function(e,orderDetailId,row,index) {
        if (orderDetailId) {
            var orderName = $('.div-search .selectpicker option:selected').text();
            var msg = MSG.delete_confirm + '名为' + orderName + '的订单吗?';
            var url = '/prescription/prescribe/delete/';
            layer.confirm(msg, {icon: 3, title: BTN.delete}, function (index) {
                $.ajax({
                    url: url + orderDetailId,
                    type: 'DELETE',
                    success: function (data, textStatus, jqXHR) {
                        if (data.success) {
                            layer.msg(MSG.delete_success, {offset: 'rb', time: 2000});
                            $('#orderTable').bootstrapTable('remove', {
                                field: 'id',
                                values: [row.id]
                            });
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
        } else {
            layer.alert('该订单明细ID为空，请联系系统管理员！',{title: '错误',icon: 2});
        }
    }

    /**
     * 保存订单明细
     */
    function saveOrderDetail() {
        $('#orderDetailModal form').bootstrapValidator('validate');// 触发校验
        var flag = $('#orderDetailModal form').data('bootstrapValidator').isValid();// 获取校验结果
        if (flag) {
            $.post('/static/data/saveOrderDetail.json',$('#orderDetailModal form').serialize(),function (result) {
                if (result.success) {
                    layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                    queryOrderDetail();// 重新查询订单明细
                    $('#orderDetailModal').modal('hide');
                } else {
                    layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
                }
            },'json');
        }
    }
    
    /**
     * 删除订单
     */
    function delOrder() {
        // 获取当前选中的订单
        var orderId = $('.div-search .selectpicker').val();
        if (orderId) {
            var orderName = $('.div-search .selectpicker option:selected').text();
            var msg = MSG.delete_confirm + '名为' + orderName + '的订单吗?';
            var url = '/prescription/prescribe/delete/';
            layer.confirm(msg, {icon: 3, title: BTN.delete}, function (index) {
                $.ajax({
                    url: url + orderId,
                    type: 'DELETE',
                    success: function (data, textStatus, jqXHR) {
                        layer.msg(MSG.delete_success, {offset: 'rb', time: 2000});
                        $('.div-search .selectpicker option[value="' + orderId + '"]').remove();
                        $('.div-search .selectpicker option:first').prop("selected", 'selected');
                        $('.div-search .selectpicker').selectpicker('render');
                        $('.div-search .selectpicker').change();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.msg(MSG.delete_fail, {offset: 'rb', time: 2000});
                    }
                });
                layer.close(index);
            });
        } else {
            layer.msg('请先选择一条订单记录！', {offset: 'auto', time: 2000});
        }
    }
    
    /**
     * 保存订单
     */
    function saveOrder() {
        $('#orderModal form').bootstrapValidator('validate');// 触发校验
        var flag = $('#orderModal form').data('bootstrapValidator').isValid();// 获取校验结果
        if (flag) {
            $.post('/static/data/orderDetail.json',$('#orderModal form').serialize(),function (result) {
                if (result.success) {
                    layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                    $('.div-search .selectpicker option[value="' + result.data.id + '"]').html(result.data.name);
                    $('.div-detail form input[name="orderId"]').html(result.data.id);
                    $('.div-detail form p[name="date"]').html(result.data.date);
                    $('.div-detail form p[name="dealer"]').html(result.data.dealer);
                    $('.div-detail form p[name="phone"]').html(result.data.phone);
                    $('.div-detail form p[name="totalPrice"]').html(result.data.totalPrice + '元');
                    $('#orderModal').modal('hide');
                } else {
                    layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
                }
            },'json');
        }
    }

    // 表单验证
    $('#orderModal form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                // message: '名称验证失败',
                validators: {
                    notEmpty: {
                        message: '名称不能为空'
                    }
                }
            },
            date: {
                validators: {
                    notEmpty: {
                        message: '日期不能为空'
                    }
                }
            },
            dealer: {
                validators: {
                    notEmpty: {
                        message: '供应商不能为空'
                    }
                }
            },
            phone: {
                validators: {
                    phone: {
                        country: 'CN',
                        message: '请输入正确的电话或手机号码'
                    }
                }
            },
            totalPrice: {
                validators: {
                    notEmpty: {
                        message: '总价不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            }
        }
    });

    // 表单验证
    $('#orderDetailModal form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            barCode:{
              validators: {
                  stringLength: {
                      max: 50,
                      message:'最多输入50个字符'
                  }
              }
            },
            name: {
                // message: '名称验证失败',
                validators: {
                    notEmpty: {
                        message: '名称不能为空'
                    },
                    stringLength: {
                        max:20,
                        message:'最多输入20个字符'
                    }
                }
            },
            pinyin: {
                validators: {
                    notEmpty: {
                        message: '拼音简称不能为空'
                    }
                }
            },
            specifications: {
                validators: {
                    stringLength: {
                        max: 50,
                        message: '最多输入50个字符'
                    }
                }
            },
            type: {
                validators: {
                    notEmpty: {
                        message: '药品分类不能为空'
                    }
                }
            },
            validDate: {
                validators: {
                    notEmpty: {
                        message: '有效期至不能为空'
                    }
                }
            },
            producer: {
                validators: {
                    stringLength: {
                        max: 100,
                        message: '最多输入100个字符'
                    }
                }
            },
            purchasePrice: {
                validators: {
                    notEmpty: {
                        message: '进价不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            },
            purchaseCount: {
                validators: {
                    notEmpty: {
                        message: '数量不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1})?$)|(^0$)|(^\d\.\d{1}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            },
            purchaseUnit: {
                validators: {
                    notEmpty: {
                        message: '单位不能为空'
                    }
                }
            },
            totalPrice: {
                validators: {
                    notEmpty: {
                        message: '总价不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            },
            sellUnit: {
                validators: {
                    notEmpty: {
                        message: '零售单位不能为空'
                    }
                }
            },
            unitConvert: {
                validators: {
                    notEmpty: {
                        message: '单位换算不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?)$/i,
                        message: '请输入正整数'
                    }
                }
            },
            profitPercent: {
                validators: {
                    regexp: {
                        regexp:/^(\d|[1-9]\d|100)$/i,
                        message: '请输入0-100的整数'
                    }
                }
            },
            sellingPrice: {
                validators: {
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            },
            stock: {
                validators: {
                    notEmpty: {
                        message: '总价不能为空'
                    },
                    regexp: {
                        regexp:/(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            },
            stockWarn: {
                validators: {
                    regexp: {
                        regexp: /(^[1-9](\d+)?(\.\d{1,2})?$)|(^0$)|(^\d\.\d{1,2}$)/i,
                        message: '请输入非负的两位小数'
                    }
                }
            }
        }
    });
    
    /**
     * 添加订单
     * @param even
     */
    function addOrder(even) {
        $('#orderModal input[name="type"]').val('1');
        $('#orderModal input[name="date"]').val(new Date().format("yyyy-MM-dd"));
        $('#orderModal .selectpicker').selectpicker('render');
        // $('#orderModal').modal({backdrop:'static'});
    }

    /**
     * 修改订单
     * @param even
     */
    function editOrder(even) {
        // 获取当前选中的订单
        var orderId = $('.div-search .selectpicker').val();
        if (orderId) {
            $('#orderModal').find('.modal-title').text('修改订单');
            try {
                $.getJSON('/static/data/orderDetail.json', {orderId: orderId}, function (data) {
                    // 赋值
                    $('#orderModal form').fillData(data);
                    $('#orderModal .selectpicker').selectpicker('render');
                    $('#orderModal').modal({backdrop: 'static'});// 显示模态框
                });
            } catch (e) {
                layer.msg('订单查询失败，请联系系统管理员！', {offset: 'auto', time: 2000});
            }
        } else {
            layer.msg('请先选择一条订单记录！', {offset: 'auto', time: 2000});
        }
    }
    
    /**
     * 加载订单明细
     * @param even
     */
    function queryOrderDetail(even) {
        var orderId = $('.div-search .selectpicker').val();
        // 根据orderId查询订单和订单明细
        $.getJSON('/static/data/orderDetail.json', {orderId: orderId}, loadOrderDetail);
    }

    /**
     * 加载订单明细
     * @param data
     */
    function loadOrderDetail(data) {
        $('.div-detail form input[name="orderId"]').html(data.id);
        $('.div-detail form p[name="date"]').html(data.date);
        $('.div-detail form p[name="dealer"]').html(data.dealer);
        $('.div-detail form p[name="phone"]').html(data.phone);
        $('.div-detail form p[name="totalPrice"]').html(data.totalPrice + '元');
        $('#orderTable').bootstrapTable('load', data.orderDetail);// 表格
    }

    /**
     * 查询参数改变后重新加载订单
     */
    function reloadOrder() {
        var data = {};
        $('.div-search .form-control').each(function (index, element) {
            var name = $(element).attr('name');
            var val = $(element).val();
            console.log(element);
            data[name] = val;
        });
        // console.log(data);
        $.getJSON('static/data/order.json', data, loadOrder);
    }

    /**
     * 加载订单
     * @param data
     */
    function loadOrder(data) {
        // 初始化日期选择器和单选按钮
        $(".div-search input[name='startDate']").val(data.startDate);
        $(".div-search input[name='endDate']").val(data.endDate);
        $(".div-search select[name='type']").val(data.type);
        initSelectPicker(data.content);
    }

    /**
     * 初始化订单下拉框
     * @param content
     */
    function initSelectPicker(content) {
        if (!content || content.length <= 0) return;
        var options = [], _options;
        for (var i = 0; i < content.length; i++) {
            var option = '';
            if (i == 0) {
                option = '<option selected value="' + content[i].id + '">' + content[i].name + '</option>';
            } else {
                option = '<option value="' + content[i].id + '">' + content[i].name + '</option>';
            }
            options.push(option);
        }
        _options = options.join('');
        $('.div-search .selectpicker')[0].innerHTML = _options;
        $('.div-search .selectpicker').selectpicker('render');
        $('.div-search .selectpicker').change();
    }

    /**
     * 初始化日期选择器
     * @param value
     */
    function initDatetimepicker(value) {
        var searchOption = {
            format: 'yyyy-mm',
            autoclose: true,
            todayHighlight: true,
            startView: 3,
            minView: 3
        };
        var option = {
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayBtn:true,
            todayHighlight: true,
            startView: 2,
            minView: 2
        };
        var startDate = $(".div-search input[name='startDate']");
        var endDate = $(".div-search input[name='endDate']");
        var orderDate = $('#orderModal input[name="date"]');
        var productionDate = $('#orderDetailModal input[name="productionDate"]');
        var validDate = $('#orderDetailModal input[name="validDate"]');
        startDate.datetimepicker(searchOption)
            .on('click', function (e) {
                startDate.datetimepicker("setEndDate", endDate.val());
            });
        endDate.datetimepicker(searchOption)
            .on('click', function (e) {
                endDate.datetimepicker("setStartDate", startDate.val());
            });
        orderDate.datetimepicker(option)
            .on('hide', function (event) {
                event.stopPropagation();
            });
        ;
        productionDate.datetimepicker($.extend({}, option, {todayBtn: false}))
            .on('hide', function (event) {
                event.stopPropagation();
            });
        validDate.datetimepicker($.extend({}, option, {todayBtn: false}))
            .on('hide', function (event) {
                event.stopPropagation();
            });

    }

    /**
     * 切换查询面板的显示隐藏状态
     */
    function toggleSearch() {
        $('.div-search form').toggle();
        if ($('.div-search form').is(':hidden')) {
            // 隐藏
            $(this).removeClass('glyphicon-chevron-down');
            $(this).addClass('glyphicon-chevron-up');
        } else {
            $(this).removeClass('glyphicon-chevron-up');
            $(this).addClass('glyphicon-chevron-down');
        }
    }

    // 定义表格列
    // 药品属性：药品名称，药品规格，药品分类，药品剂型，拼音简码，条形码，产地/厂家，生产日期，有效期至
    // 订单属性：进货数量，进货单位，进货单价，总价
    // 销售属性：零售单位，入库售价加成%，零售单价

    /**
     * 订单入库
     */
    function orderStorage() {
        var orderId = $('.div-detail form input[name="orderId"]').val();
        if (!!orderId) {
            // 1.校验总分是否平衡，即订单的总价要与所有明细的和相等
            // 2.所有的明细都必须要有售价，库存，库存预警
        } else {
            layer.alert('订单入库失败！',{title: '错误',icon: 2});
        }
    }
    
});

/**
 * 表格操作列
 * @param value
 * @param row
 * @param index
 * @returns {string}
 *  data-toggle="modal" data-value="' + value + '" data-target="#orderDetailModal" data-whatever="update"
 */
function operateFormatter(value, row, index) {
    return [
        '<a class="update" href="javascript:void(0);" title="修改">',
        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>',
        '</a>  ',
        '<a class="remove" href="javascript:void(0);" title="删除">',
        '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>',
        '</a>'
    ].join('');
}

/**
 * 表格操作列按钮点击事件
 */
window.operateEvents = {
    'click .update': function (e, value, row, index) {
        editOrderDetail(value);
        // alert('You click like action, row: ' + JSON.stringify(value));
    },
    'click .remove': function (e, value, row, index) {
        delOrderDetail(e,value,row,index);
    }
};
