package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:01
 * @Description: 数据字典
 */
@Entity
@Table(name = "DICTIONARY_ITEM")
public class DictionaryItem {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DICT_ITEM_ID", nullable = false)
    private Integer dictItemId;

    /** 字典项名称*/
    @Column(name = "DICT_ITEM_NAME", nullable = false, length = 500)
    private String dictItemName;

    /** 字典项值*/
    @Column(name = "DICT_ITEM_VALUE", nullable = false, length = 500)
    private String dictItemValue;

    /** 是否启用 */
    @Column(name = "IS_USE", nullable = false, length = 1)
    private Integer isUse;

    public Integer getDictItemId() {
        return dictItemId;
    }

    public void setDictItemId(Integer dictItemId) {
        this.dictItemId = dictItemId;
    }

    public String getDictItemName() {
        return dictItemName;
    }

    public void setDictItemName(String dictItemName) {
        this.dictItemName = dictItemName;
    }

    public String getDictItemValue() {
        return dictItemValue;
    }

    public void setDictItemValue(String dictItemValue) {
        this.dictItemValue = dictItemValue;
    }

    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }
}
