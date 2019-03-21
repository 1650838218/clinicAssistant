$(function(){
    // 加载菜单
     $.ajax({
        url:"static/data/menu.json",
        type:"get",
        dataType:"json",
        success:function(data, textStatus, jqXHR){
            if (data) {
                initMenu(data);
            } else {
                layer.msg('菜单加载失败！', {icon: 2, time: 1000});
            }
        },
        error:function(XMLHttpRequest, textStatus, errorThrown) {
            layer.msg('菜单加载失败！', {icon: 2, time: 1000});
        }
    });

    /**
     * 初始化菜单
     * @param menuData
     */
    function initMenu(menuData) {
        var menuHtml = joinMenuHtml(menuData);
        $("nav.main-menu").prepend(menuHtml);
        addClickEvent();
    }

    /**
     * 拼接 菜单 的html
     * @param menuData
     * @returns {string}
     */
    function joinMenuHtml(menuData) {
        var menuHtml = "";
        menuHtml += "<ul>";
        $.each(menuData,function(i,n){
            menuHtml += "<li>";
            menuHtml += "<a href='javascript:void(0);' url='" + n.url + "'>";
            menuHtml += "<i class='" + n.icon + " nav-icon'></i>";

            if (n.children.length > 0) {
                menuHtml += "<span class='nav-text icon-right'>" + n.name + "</span>";
                menuHtml += "<i class='icon iconfont icon-i-arrow-right'></i>";
            } else {
                menuHtml += "<span class='nav-text'>" + n.name + "</span>";
            }
            menuHtml += "</a>";
            if (n.children.length > 0) {
                menuHtml += "<ul>";
                $.each(n.children, function(j,m){
                    menuHtml += "<li>";
                    menuHtml += "<a class='subnav-text' href='javascript:void(0);' url='" + m.url + "'>" + m.name + "</a>";
                    menuHtml += "</li>";
                });
                menuHtml += "</ul>";
            }
            menuHtml += "</li>";
        });
        menuHtml += "</ul>";
        return menuHtml;
    }

    /**
     * 对菜单添加click事件
     */
    function addClickEvent() {
        $('nav.main-menu li a').on('click',function (event) {
            // console.log($(this).attr('url'));
            var url = $(this).attr('url');
            if (url) {
                $('#bodyContent').load('templates/module/' + url);
            }
        });
    }
});