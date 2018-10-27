package com.littledoctor.clinicassistant.module.prescription.prescribe.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/25 21:47
 * @Description: 处方
 */
@Entity
@Table(name = "CF_PRESCRIBE")
public class Prescribe {
    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", nullable = false)
    private int id;

    /** 疾病ID */
    @Column(name = "DISEASE_ID", nullable = false)
    private int diseaseId;

    /** 疾病名称 */
    @Column(name = "NAME", nullable = false, length = 20)
    private String name;

    /** 简拼 */
    @Column(name = "ABBREVIATION", nullable = false, length = 20)
    private String abbreviation;

    /** 方歌 */
    @Column(name = "DOGGEREL", length = 100)
    private String doggerel;

    /** 处方内容 */
    @Column(name = "DETAILS", length = 1000)
    private String details;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDiseaseId() {
        return diseaseId;
    }

    public void setDiseaseId(int diseaseId) {
        this.diseaseId = diseaseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getDoggerel() {
        return doggerel;
    }

    public void setDoggerel(String doggerel) {
        this.doggerel = doggerel;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
