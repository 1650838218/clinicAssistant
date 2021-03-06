(function ($) {
    // 动态加载表格
    layui.table.render({
        elem: '#dictionaryTable',
        url: '/dictionary/queryPage',
        where: $(".search-form").serialize(),
        request: {
            limitName: 'size'
        },
        cols: [
            [
                {title: '序号', type: 'numbers', templet: '#indexTpl'},
                {field: 'code', width: 100, title: '字典编码'},
                {field: 'text', width: 80, title: '显示值'},
                {field: 'value', title: '真实值'}
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
            // btn:['保存'],
            content: $("#layerPanel"),
            end:function () {
                $("#layerContent").append($("#layerPanel div"));
            }
        }, function (value, index, elem) {
            console.log(value);
        });
    });
})(jQuery)