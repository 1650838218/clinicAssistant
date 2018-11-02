package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:01
 * @Description: 数据字典
 */
@Entity
@Table(name = "dictionary")
public class Dictionary {

    @EmbeddedId
    private DictionaryKey key;

    @Column(name = "name", length = 50)
    private String name;

    /** 显示值 eg：男 女 */
    @Column(name = "TEXT", nullable = false, length = 50)
    private String text;

    /** 所属模块的ID，即菜单ID */
    @Column(name = "BELONG")
    private Integer belong;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getBelong() {
        return belong;
    }

    public void setBelong(Integer belong) {
        this.belong = belong;
    }

    public DictionaryKey getKey() {
        return key;
    }

    public void setKey(DictionaryKey key) {
        this.key = key;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
