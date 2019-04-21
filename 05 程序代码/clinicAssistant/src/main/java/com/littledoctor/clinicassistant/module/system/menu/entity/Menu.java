package com.littledoctor.clinicassistant.module.system.menu.entity;

import com.littledoctor.clinicassistant.common.plugin.tree.TreeNodeType;

import javax.persistence.*;
import javax.swing.tree.TreeNode;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 19:15
 * @Description: 系统管理--菜单管理
 */
@Entity
@Table(name = "MENU")
public class Menu {

     /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MENU_ID", nullable = false)
    private Integer menuId;

    /** 父ID */
    @Column(name = "PARENT_MENU_ID", nullable = false)
    private Integer parentMenuId;

    /** 父级菜单名称 */
    @Transient
    private String parentMenuName;

    /** 菜单名称 */
    @Column(name = "MENU_NAME", nullable = false, length = 500)
    private String menuName;

    /** 排序号 */
    @Column(name = "MENU_ORDER")
    private Integer menuOrder;

    /** 菜单URL */
    @Column(name = "MENU_URL", length = 255)
    private String menuUrl;

    /** 是否可用 0：不可用；1：可用 */
    @Column(name = "IS_USE", length = 5)
    private String isUse;

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(Integer parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(Integer menuOrder) {
        this.menuOrder = menuOrder;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getIsUse() {
        return isUse;
    }

    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }

    public String getParentMenuName() {
        return parentMenuName;
    }

    public void setParentMenuName(String parentMenuName) {
        this.parentMenuName = parentMenuName;
    }
}
