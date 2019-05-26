package com.littledoctor.clinicassistant.module.pharmacy.godownentry.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-11 18:23
 * @Description: 入库单
 */
@Entity
@Table(name = "GODOWN_ENTRY")
public class GodownEntry {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "GODOWN_ENTRY_ID", nullable = false)
    private Integer godownEntryId;

    /** 采购单ID */
    @Column(name = "PURCHASE_BILL_ID")
    private Integer purchaseBillId;

    /** 入库单单号 取当前时间yyyymmddhhmmsssss */
    @Column(name = "GODOWN_ENTRY_CODE")
    private String godownEntryCode;

    /** 入库单名称 */
    @Column(name = "GODOWN_ENTRY_NAME")
    private String godownEntryName;

    /** 入库单日期 */
    @Column(name = "GODOWN_ENTRY_DATE")
    private String godownEntryDate;

    /** 创建时间 */
    @Column(name = "CREATE_TIME")
    private Date createTime;

    /** 更新时间 */
    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    public Integer getGodownEntryId() {
        return godownEntryId;
    }

    public void setGodownEntryId(Integer godownEntryId) {
        this.godownEntryId = godownEntryId;
    }

    public Integer getPurchaseBillId() {
        return purchaseBillId;
    }

    public void setPurchaseBillId(Integer purchaseBillId) {
        this.purchaseBillId = purchaseBillId;
    }

    public String getGodownEntryCode() {
        return godownEntryCode;
    }

    public void setGodownEntryCode(String godownEntryCode) {
        this.godownEntryCode = godownEntryCode;
    }

    public String getGodownEntryName() {
        return godownEntryName;
    }

    public void setGodownEntryName(String godownEntryName) {
        this.godownEntryName = godownEntryName;
    }

    public String getGodownEntryDate() {
        return godownEntryDate;
    }

    public void setGodownEntryDate(String godownEntryDate) {
        this.godownEntryDate = godownEntryDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
