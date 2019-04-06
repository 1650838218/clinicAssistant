package com.littledoctor.clinicassistant.module.system.menu.service;

import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
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
    Menu save(Menu menu);

    /**
     * 查询所有菜单项
     * @return
     */
    List<TreeEntity> findTreeEntity() throws Exception;

    /**
     * 根据ID查询菜单
     * @param menuId
     * @return
     */
    Menu getById(String menuId) throws Exception;

    /**
     * 查询下拉树
     * @param menuIds 需要被排除的ids，用逗号分隔
     * @return
     */
    List<TreeEntity> querySelectTree(String menuIds) throws Exception;

    /**
     * 删除菜单
     * @param menuId
     * @return
     */
    boolean delete(Integer menuId) throws Exception;
}
