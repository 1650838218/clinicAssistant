package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:01
 * @Description: 数据字典
 */
@Entity
@Table(name = "dictionary")
public class Dictionary {

    /** 类型编码 eg：sex */
    @Id
    @Column(name = "CODE", nullable = false, length = 20)
    private String code;

    /** 字典值 */
    @Id
    @Column(name = "VALUE", nullable = false, length = 10)
    private String value;

    /** 显示值 eg：男 女 */
    @Column(name = "TEXT", nullable = false, length = 50)
    private String text;

    /** 所属模块的ID，即菜单ID */
    @Column(name = "BELONG")
    private Integer belong;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

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
}
