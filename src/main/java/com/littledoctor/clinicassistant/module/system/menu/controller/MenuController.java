package com.littledoctor.clinicassistant.module.system.menu.controller;

import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import com.littledoctor.clinicassistant.module.system.menu.service.MenuService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 19:12
 * @Description: 系统管理--菜单管理
 */
@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * 保存菜单信息
     * @param menu
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public boolean save(Menu menu) {
        if (menu != null) {
            menuService.save(menu);// 保存
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/queryTree", method = RequestMethod.GET)
    public List<Menu> queryTree() {
        return menuService.queryTree();
    }
}
