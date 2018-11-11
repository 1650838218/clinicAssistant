/** 病历管理--患者个人信息 */
//@ sourceURL=casesPeople.js
(function ($) {
    // form表单更新渲染
    var form = layui.form;
    form.render();

    // 按钮绑定clike事件处理方法
    $(".layui-card-body .layui-btn-container button").on("click", addCasesPeople);


    // 动态加载表格
    layui.table.render({
        elem: '#casesPeopleTable',
        url: '/casesPeople/queryPage',
        where: $(".search-form").serialize(),
        request: {
            limitName: 'size'
        },
        cols: [
            [
                {title: '序号', type: 'numbers', templet: '#indexTpl'},
                {field: 'name', width: 150, title: '姓名'},
                {field: 'sex', width: 120, title: '性别'},
                {field: 'phone', width: 200, title: '手机号'},
                {field: 'weixin', width: 200, title: '微信'},
                {field: 'address', title: '现居住地'},
            ]
        ],
        page: true
    });


    /**
     * 添加患者
     * @param event
     */
    function addCasesPeople(event) {
        showEditWindow({title: '添加患者'}, {/*reset: editWindowReset, */save: saveCasesPeople, validate: validate});
    }

    /**
     * 重置编辑窗口
     */
    function editWindowReset() {
        $("#layerContent input:text").val('');
        $("#layerContent input:radio[name='sex']:first").attr("checked","checked");
    }

    /**
     * 保存患者
     * @param data
     */
    function saveCasesPeople(data) {
        $.post('/casesPeople/save', data, function (result, textStatus, jqXHR) {
            if (result) {
                layer.msg(MSG.save_success, {offset: 'rb', time: 2000});
                // 表格添加一行并选中
            } else {
                layer.msg(MSG.save_fail, {offset: 'rb', time: 2000});
            }
        });
    }

    /**
     *
     */
    function validate(data) {

        if (!data || !data.name) {
            layer.msg('请填写患者姓名！', {icon: 2, time: 1000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        } else if (data.name.length > 10) {
            layer.msg('患者姓名不能超过10个汉字！', {icon: 2, time: 2000});
            $("#layerPanel").find("input[name='name']").focus();
            return false;
        } else if (!data.sex)
        return true;
    }

    /**
     * 弹出编辑窗口
     */
    function showEditWindow(option, callback) {
        // 将编辑面板移动到index.html的layerPanel中，不做这一步，遮罩会有问题
        $("#layerPanel form").append($("#layerContent div"));
        var localOption = {
            skin: 'layer-myskin',
            title: '基本信息',
            btn: [BTN.save],
            content: $("#layerPanel"),
            success: function(layero, index){
                // layui.form.render();
            },
            end: function () {
                // 重置所有输入项
                // $("#layerPanel button[type='reset']").click();
                // if (callback.reset) callback.reset();
                /*$('#layerPanel input:text').val('');
                $('#layerPanel textarea').val('');
                $('#layerPanel input:radio').removeAttr("checked");
                // $('#layerPanel input:radio:first').checked = true;
                $('#layerPanel select:first-child').prop("selected",true);*/
                // 将弹出框源码放到原位置
                $("#layerContent").append($("#layerPanel form div"));
            },
            yes: function (index, layero) {
                // 获取表单的数据，并保存
                // var data = {};
                // $("#layerPanel").find("input").each(function (index, element) {
                //     data[$(element).attr('name')] = $(element).val();
                // });
                // if (callback.validate(data)) {
                //     layer.close(index); //如果设定了yes回调，需进行手工关闭
                //     callback.save(data);// 回调方法，保存
                // }
            }
        };
        layer.prompt($.extend(localOption, option));
    }
})(jQuery);