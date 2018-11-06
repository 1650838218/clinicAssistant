package com.littledoctor.clinicassistant.module.cases.entity;

import com.mysql.fabric.xmlrpc.base.Data;

import javax.persistence.*;
import javax.sql.DataSource;
import java.util.Date;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 20:25
 * @Description: 诊断
 */
@Entity
@Table(name = "CASEA_DIAGNOSIS")
public class CasesDiagnosis {

    /** 患者个人信息 */
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CASES_PEOPLE_ID", referencedColumnName = "ID")
    private CasesPeople casesPeople;

    /** 就诊时间 */
    @Column(name = "VIS_DATE", nullable = false)
    private Date visDate;

    /** 诊断类型
     * 0:主要诊断
     * 1:次要诊断*/
    @Column(name = "TYPE")
    private Integer type;

    /** 诊断结果 */
    @Column(name = "CONCLUSION", length = 50)
    private String conclusion;

    /** 患者年龄 */
    @Column(name = "AGE", length = 3)
    private Integer age;

    /** 职业 */
    @Column(name = "JOB")
    private String job;

}
