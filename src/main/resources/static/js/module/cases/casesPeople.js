/** 病历管理--患者个人信息 */
//@ sourceURL=casesPeople.js
(function ($) {
    // form表单更新渲染
    var form = layui.form;
    form.render();

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
                {field: 'name', width: 100, title: '姓名'},
                {field: 'sex', width: 80, title: '性别'},
                {field: 'phone', width: 80, title: '手机号'},
                {field: 'weixin', width: 80, title: '微信'},
                {field: 'address', title: '现居住地'},
            ]
        ],
        page: true
    });

    // 按钮绑定clike事件处理方法
    $(".layui-card-body .layui-btn-container button").on("click", function () {
        // 将编辑面板移动到index.html的layerPanel中，不做这一步，遮罩会有问题
        $("#layerPanel").append($("#layerContent div"));
        layer.prompt({
            skin:'layer-myskin',
            title:'基本信息',
            btn:['保存'],
            content: $("#layerPanel"),
            end:function () {
                $("#layerContent").append($("#layerPanel div"));
            }
        }, function (value, index, elem) {
            console.log(value);
        });
    });
})(jQuery);