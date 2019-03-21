package com.littledoctor.clinicassistant.module.system.menu.entity;

import javax.persistence.*;

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
    @Column(name = "ID", nullable = false)
    private int id;

    /** 父ID */
    @Column(name = "PID", nullable = false)
    private int pId;

    /** 菜单名称 */
    @Column(name = "NAME", nullable = false, length = 10)
    private String name;

    /** 排序号 */
    @Column(name = "SORT")
    private int sort;

    /** 菜单URL */
    @Column(name = "URL", length = 255)
    private String url;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
