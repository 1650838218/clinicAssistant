package com.littledoctor.clinicassistant.module.cases.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 19:55
 * @Description: 患者基本信息表
 */
@Entity
@Table(name = "CASES_PEOPLE")
public class CasesPeople {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;

    /** 患者姓名 */
    @Column(name = "NAME", length = 10, nullable = false)
    private String name;

    /** 性别
     * 0 男
     * 1 女
     */
    @Column(name = "SEX")
    private Integer sex;

    /** 手机号 */
    @Column(name = "PHONE", length = 20)
    private String phone;

    /** 微信号 */
    @Column(name = "WEIXIN", length = 20)
    private String weixin;

    /** 地址 */
    @Column(name = "ADDRESS", length = 100)
    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
