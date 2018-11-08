package com.littledoctor.clinicassistant.module.cases.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mysql.fabric.xmlrpc.base.Data;

import javax.persistence.*;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 20:25
 * @Description: 初诊
 */
@Entity
@Table(name = "CASEA_FIRST")
public class CasesFirst {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;

    /** 患者个人信息 */
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CASES_PEOPLE_ID", referencedColumnName = "ID")
    private CasesPeople casesPeople;

    /** 患者年龄 */
    @Column(name = "AGE", length = 3)
    private Integer age;

    /** 职业 */
    @Column(name = "JOB", length = 20)
    private String job;

    /** 就诊时间 */
    @Column(name = "FIRST_DATE", nullable = false)
    private Date firstDate;

    /** 望闻问切 */
    @Column(name = "LLQP", length = 500)
    private String llqp;

    /** 辩证分析 */
    @Column(name = "ANALYSIS", length = 100)
    private String analysis;

    /** 诊断结果 */
    @Column(name = "DIAGNOSIS", length = 50)
    private String diagnosis;

    /** 疗法 */
    @Column(name = "THERAPEUTIC_METHOD", length = 100)
    private String therapeuticMethod;

    /** 处方 */
    @Column(name = "PRESCRIBE", length = 500)
    private String prescribe;

    /** 剂数 */
    @Column(name = "COUNT", length = 2)
    private Integer count;

    /** 处方总价 */
    @Column(name = "TOTAL_PRICE")
    private float totalPrice;

    /** 复诊 */
    @OneToMany(mappedBy = "casesFirst", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
    private List<CasesNext> casesNexts = new ArrayList<>();

    /** 回访 */
    @OneToMany(mappedBy = "casesFirst", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
    private List<CasesFollow> casesFollows = new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public CasesPeople getCasesPeople() {
        return casesPeople;
    }

    public void setCasesPeople(CasesPeople casesPeople) {
        this.casesPeople = casesPeople;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Date getFirstDate() {
        return firstDate;
    }

    public void setFirstDate(Date firstDate) {
        this.firstDate = firstDate;
    }

    public String getLlqp() {
        return llqp;
    }

    public void setLlqp(String llqp) {
        this.llqp = llqp;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getTherapeuticMethod() {
        return therapeuticMethod;
    }

    public void setTherapeuticMethod(String therapeuticMethod) {
        this.therapeuticMethod = therapeuticMethod;
    }

    public String getPrescribe() {
        return prescribe;
    }

    public void setPrescribe(String prescribe) {
        this.prescribe = prescribe;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<CasesNext> getCasesNexts() {
        return casesNexts;
    }

    public void setCasesNexts(List<CasesNext> casesNexts) {
        this.casesNexts = casesNexts;
    }

    public List<CasesFollow> getCasesFollows() {
        return casesFollows;
    }

    public void setCasesFollows(List<CasesFollow> casesFollows) {
        this.casesFollows = casesFollows;
    }
}
