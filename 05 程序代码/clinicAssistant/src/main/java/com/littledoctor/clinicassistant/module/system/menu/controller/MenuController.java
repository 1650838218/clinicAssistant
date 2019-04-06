package com.littledoctor.clinicassistant.module.system.menu.controller;

import com.littledoctor.clinicassistant.common.msg.Message;
import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
import com.littledoctor.clinicassistant.common.plugin.tree.TreeUtils;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import com.littledoctor.clinicassistant.module.system.menu.service.MenuService;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 19:12
 * @Description: 系统管理--菜单管理
 */
@RestController
@RequestMapping("/system/menu")
public class MenuController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MenuService menuService;

    /**
     * 保存菜单信息
     * @param menu
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Menu save(Menu menu) {
        try {
            Assert.notNull(menu, Message.PARAMETER_IS_NULL);
            return menuService.save(menu);// 保存
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return new Menu();
    }

    /**
     * 查询菜单树
     * @return
     */
    @RequestMapping(value = "/queryTree", method = RequestMethod.GET)
    public Map<String, Object> queryTree() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<TreeEntity> data = menuService.findTreeEntity();
            map.put("code", "200");
            map.put("data", TreeUtils.listToTree(data));
            return map;
        } catch (Exception e) {
            map.put("code", "500");
            map.put("data", null);
            log.error(e.getMessage(), e);
        }
        return map;
    }

    /**
     * 查询下拉菜单树
     * @param menuIds 需要排除的菜单id，逗号分隔
     * @return
     */
    @RequestMapping(value = "/querySelectTree", method = RequestMethod.GET)
    public Map<String, Object> querySelectTree(String menuIds) {
        Map<String, Object> map = new HashMap<>();
        try {
            List<TreeEntity> data = menuService.querySelectTree(menuIds);
            map.put("code", "200");
            map.put("data", data);
            return map;
        } catch (Exception e) {
            map.put("code", "500");
            map.put("data", null);
            log.error(e.getMessage(), e);
        }
        return map;
    }

    /**
     * 根据ID查询菜单
     * @param menuId
     * @return
     */
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public Menu getById(String menuId) {
        try {
            Assert.notNull(menuId, Message.PARAMETER_IS_NULL);
            return menuService.getById(menuId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return new Menu();
    }

    /**
     * 删除菜单
     * @param menuId
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable("id") Integer menuId) {
        try {
            Assert.notNull(menuId, Message.PARAMETER_IS_NULL);
            return menuService.delete(menuId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }
}


