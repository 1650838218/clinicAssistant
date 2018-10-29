/* 主页 js 对应index.html*/
$(function () {

    // 对菜单添加click事件
    $('.layui-nav.layui-nav-tree a').on('click',function (event) {
        // console.log($(this).attr('url'));
        var url = $(this).attr('url');
        if (url) {
            $('#bodyContent').load('/index/goto',{url:url});
        }
    });
});
