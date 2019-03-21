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

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", nullable = false)
    private Integer id;

    /** 类型编码 eg：sex */
    @Column(name = "CODE", nullable = false, length = 20)
    private String code;

    /** 类型编码 eg：sex */
    @Column(name = "name", length = 50)
    private String name;

    /** 显示值 eg：男 女 */
    @Column(name = "TEXT", nullable = false, length = 50)
    private String text;

    /** 字典值 */
    @Column(name = "VALUE", nullable = false, length = 10)
    private String value;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
