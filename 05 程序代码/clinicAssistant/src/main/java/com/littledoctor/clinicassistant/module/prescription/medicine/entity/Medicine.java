package com.littledoctor.clinicassistant.module.prescription.medicine.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/18 22:00
 * @Description: 药材实体类
 */
@Entity
@Table(name = "MEDICINE")
public class Medicine {
    /** 名称 */
    @Id
    @Column(name = "NAME", nullable = false, length = 10)
    private String name;

    /** 简拼 首字母 */
    @Column(name = "ABBREVIATION", length = 10)
    private String abbreviation;

    /** 全拼 */
    @Column(name = "FULL_PINYIN", length = 100)
    private String fullPinyin;

    /** 用量 */
    @Column(name = "DOSAGE")
    private int dosage;

    /** 描述 */
    @Column(name = "DESCRIPTION")
    private String description;

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getFullPinyin() {
        return fullPinyin;
    }

    public void setFullPinyin(String fullPinyin) {
        this.fullPinyin = fullPinyin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDosage() {
        return dosage;
    }

    public void setDosage(int dosage) {
        this.dosage = dosage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
