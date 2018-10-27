package com.littledoctor.clinicassistant.module.system.menu.service;

import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 20:35
 * @Description: 系统管理--菜单管理
 */
public interface MenuService {
    /**
     * 保存一个菜单项
     * @param menu
     */
    void save(Menu menu);

    /**
     * 查询所有菜单项
     * @return
     */
    List<Menu> queryTree();
}
