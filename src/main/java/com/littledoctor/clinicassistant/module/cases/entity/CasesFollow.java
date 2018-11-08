package com.littledoctor.clinicassistant.module.cases.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 病情跟踪
 */
@Entity
@Table(name = "CASES_FOLLOW")
public class CasesFollow {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;

    /** 回访时间 */
    @Column(name = "FOLLOW_DATE", nullable = false)
    private Date followDate;

    /** 跟踪结果 */
    @Column(name = "RESULT", length = 500)
    private String result;

    /** 初诊 */
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

    public Date getFollowDate() {
        return followDate;
    }

    public void setFollowDate(Date followDate) {
        this.followDate = followDate;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public CasesFirst getCasesFirst() {
        return casesFirst;
    }

    public void setCasesFirst(CasesFirst casesFirst) {
        this.casesFirst = casesFirst;
    }
}
