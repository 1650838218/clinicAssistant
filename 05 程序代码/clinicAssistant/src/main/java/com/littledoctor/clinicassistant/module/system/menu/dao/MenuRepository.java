package com.littledoctor.clinicassistant.module.system.menu.dao;

import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 20:34
 * @Description: 系统管理--菜单管理 dao
 */
public interface MenuRepository extends JpaRepository<Menu,Integer> {

    /**
     * 查询菜单树
     * @return
     */
    @Query(value = "select new com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity(t.menuName , t.menuId, t.parentMenuId) from Menu t order by t.menuOrder")
    List<TreeEntity> findTreeEntity();

    /**
     * 查询下拉菜单树
     * @param id
     * @return
     */
    @Query(value = "select new com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity(t.menuName , t.menuId, t.parentMenuId) from Menu t where t.menuId not in (?1) order by t.menuOrder")
    List<TreeEntity> findSelectTree(Integer[] id);
}
