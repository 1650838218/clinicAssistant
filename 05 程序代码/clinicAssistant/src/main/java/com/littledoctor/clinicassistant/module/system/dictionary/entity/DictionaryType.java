package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:01
 * @Description: 数据字典
 */
@Entity
@Table(name = "DICTIONARY_TYPE")
public class DictionaryType {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DICT_TYPE_ID", nullable = false)
    private Integer dictTypeId;

    /** 类型名称*/
    @Column(name = "DICT_TYPE_NAME", nullable = false, length = 500)
    private String dictTypeName;

    /** 字典键*/
    @Column(name = "DICT_TYPE_KEY", nullable = false, length = 500)
    private String dictTypeKey;

    /** 菜单ID */
    @Column(name = "MENU_ID", nullable = false)
    private Integer menuId;

    @Transient
    private String menuName;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    @JoinColumn(name = "DICT_TYPE_ID")
    private List<DictionaryItem> dictItem = new ArrayList<>();

    public Integer getDictTypeId() {
        return dictTypeId;
    }

    public void setDictTypeId(Integer dictTypeId) {
        this.dictTypeId = dictTypeId;
    }

    public String getDictTypeName() {
        return dictTypeName;
    }

    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName;
    }

    public String getDictTypeKey() {
        return dictTypeKey;
    }

    public void setDictTypeKey(String dictTypeKey) {
        this.dictTypeKey = dictTypeKey;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public List<DictionaryItem> getDictItem() {
        return dictItem;
    }

    public void setDictItem(List<DictionaryItem> dictItem) {
        this.dictItem = dictItem;
    }
}
