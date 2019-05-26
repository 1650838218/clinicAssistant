layui.define(['element', 'sidebar', 'mockjs', 'menu', 'route', 'utils', 'component', 'kit', 'apiconfig', 'tabs'], function(exports) {
  var element = layui.element,
    utils = layui.utils,
    $ = layui.jquery,
    _ = layui.lodash,
    route = layui.route,
    layer = layui.layer,
    menu = layui.menu,
    tabs = layui.tabs,
    component = layui.component,
    apiconfig = layui.apiconfig,
    kit = layui.kit;


  var Admin = function() {
    this.config = {
      elem: '#app',
      loadType: 'SPA'// 单页面
    };
    this.version = '1.0.0';
  };


  Admin.prototype.ready = function(callback) {
    var that = this,
      config = that.config;

    // 初始化加载方式
    const { getItem } = utils.localStorage;
    const setting = getItem("KITADMIN_SETTING_LOADTYPE");
    if (setting !== null && setting.loadType !== undefined) {
      config.loadType = setting.loadType;
    }

    kit.set({
      type: config.loadType
    }).init();

    // 初始化路由
    _private.routeInit(config);
    // 初始化左侧菜单
    _private.menuInit(config);
    // 初始化选项卡
    if (config.loadType === 'TABS') {
      _private.tabsInit();
    }
    // 跳转至首页
    if (location.hash === '') {
      utils.setUrlState('主页', '#/');
    }

    // 监听头部右侧 nav
    component.on('nav(header_right)', function(_that) {
      var target = _that.elem.attr('kit-target');
      if (target === 'setting') {
        // 绑定sidebar
        layui.sidebar.render({
          elem: _that.elem,
          //content:'', 
          title: '设置',
          shade: true,
          // shadeClose:false,
          // direction: 'left'
          dynamicRender: true,
          url: 'views/setting.html',
          // width: '50%', //可以设置百分比和px
        });
      }
    });

    // 注入mock
    layui.mockjs.inject(APIs);

    // 初始化渲染
    if (config.loadType === 'SPA') {
      route.render();
    }
    that.render();

    // 执行回调函数
    typeof callback === 'function' && callback();
  }
  Admin.prototype.render = function() {
    var that = this;
    return that;
  }

  var _private = {
    routeInit: function(config) {
      var that = this;
      // route.set({
      //   beforeRender: function (route) {
      //     // 此配置可以限制页面访问
      //     if (!utils.oneOf(route.path, ['/user/table', '/user/table2', '/'])) {
      //       return {
      //         id: new Date().getTime(),
      //         name: 'unauthorized',
      //         path: '/error/unauthorized',
      //         component: 'views/error/unauthorized.html'
      //       };
      //     }
      //     return route;
      //   }
      // });
      // 配置路由
      var routeOpts = {
        routes: [{
          path: '/',
          component: 'page/module/home/home.html',
          name: 'Home'
        }, {
          path: '/system/menu',
          component: 'page/module/system/menu/menu.html',
          name: '菜单管理'
        }, {
          path: '/system/oneLevel',
          component: 'page/module/system/dictionary/oneLevel.html',
          name: '一级字典'
        }, {
          path: '/system/manyLevel',
          component: 'page/module/system/dictionary/manyLevel.html',
          name: '多级字典'
        }, {
          path: '/pharmacy/supplier',
          component: 'page/module/pharmacy/supplier/supplier.html',
          name: '供货商'
        }, {
            path: '/pharmacy/medicinelist',
            component: 'page/module/pharmacy/medicinelist/medicineList.html',
            name: '药品清单'
        }, {
          path: '/pharmacy/purchasebill',
          component: 'page/module/pharmacy/purchasebill/purchaseBillForm.html',
          name: '采购单'
        }, {
          path: '/user/form',
          component: 'components/form/index.html',
          name: 'Form'
        }, {
          path: '/docs/mockjs',
          component: 'docs/mockjs.html',
          name: '拦截器(Mockjs)'
        }, {
          path: '/docs/menu',
          component: 'docs/menu.html',
          name: '左侧菜单(Menu)'
        }, {
          path: '/docs/route',
          component: 'docs/route.html',
          name: '路由配置(Route)'
        }, {
          path: '/docs/tabs',
          component: 'docs/tabs.html',
          name: '选项卡(Tabs)'
        }, {
          path: '/docs/utils',
          component: 'docs/utils.html',
          name: '工具包(Utils)'
        }]
      };
      if (config.loadType === 'TABS') {
        routeOpts.onChanged = function() {
          // 如果当前hash不存在选项卡列表中
          if (!tabs.existsByPath(location.hash)) {
            // 新增一个选项卡
            that.addTab(location.hash, new Date().getTime());
          } else {
            // 切换到已存在的选项卡
            tabs.switchByPath(location.hash);
          }
        }
      }
      route.setRoutes(routeOpts);
      return this;
    },
    addTab: function(href, layid) {
      var r = route.getRoute(href);
      if (r) {
        tabs.add({
          id: layid,
          title: r.name,
          path: href,
          component: r.component,
          rendered: false,
          icon: '&#xe62e;'
        });
      }
    },
    menuInit: function(config) {
      var that = this;

      const { user } = apiconfig;
      const { getMenus } = user;
      // 配置menu
      menu.set({
        dynamicRender: false,
        elem: '#menu-box',
        isJump: config.loadType === 'SPA',
        onClicked: function(obj) {
          if (config.loadType === 'TABS') {
            if (!obj.hasChild) {
              var data = obj.data;
              var href = data.href;
              var layid = data.layid;
              that.addTab(href, layid);
            }
          }
        },
        remote: {
          url: apiconfig.user.getMenus,
          method: 'post'
        },
        cached: false
      }).render();
      console.log(menu)
      return this;
    },
    tabsInit: function() {
      tabs.set({
        onChanged: function(layid) {
          // var tab = tabs.get(layid);
          // if (tab !== null) {
          //   utils.setUrlState(tab.title, tab.path);
          // }
        }
      }).render(function(obj) {
        // 如果只有首页的选项卡
        if (obj.isIndex) {
          route.render('#/');
        }
      });
    }
  }

  var admin = new Admin();
  admin.ready(function() {
    console.log('Init successed.');
  });

  //输出admin接口
  exports('index', {});
});