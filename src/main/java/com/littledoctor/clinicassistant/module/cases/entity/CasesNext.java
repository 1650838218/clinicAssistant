package com.littledoctor.clinicassistant.module.cases.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/7 21:39
 * @Description: 复诊
 */
@Entity
@Table(name = "CASES_NEXT")
public class CasesNext {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;

    /** 复诊时间 */
    @Column(name = "NEXT_DATE", nullable = false)
    private Date nextDate;

    /** 望闻问切 */
    @Column(name = "LLQP", length = 500)
    private String llqp;

    /** 处方 */
    @Column(name = "PRESCRIBE", length = 500)
    private String prescribe;

    /** 剂数 */
    @Column(name = "COUNT", length = 2)
    private Integer count;

    /** 处方总价 */
    @Column(name = "TOTAL_PRICE")
    private float totalPrice;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CASES_FIRST_ID", referencedColumnName = "ID")
    private CasesFirst casesFirst;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNextDate() {
        return nextDate;
    }

    public void setNextDate(Date nextDate) {
        this.nextDate = nextDate;
    }

    public String getLlqp() {
        return llqp;
    }

    public void setLlqp(String llqp) {
        this.llqp = llqp;
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

    public CasesFirst getCasesFirst() {
        return casesFirst;
    }

    public void setCasesFirst(CasesFirst casesFirst) {
        this.casesFirst = casesFirst;
    }
}
