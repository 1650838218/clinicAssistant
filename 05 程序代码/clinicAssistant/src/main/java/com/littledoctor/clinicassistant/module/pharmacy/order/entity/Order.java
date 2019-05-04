package com.littledoctor.clinicassistant.module.pharmacy.order.entity;

import com.mysql.jdbc.Blob;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:23
 * @Description: 药房管理 订单
 */
@Entity
@Table(name = "PHARMACY_ORDER")
public class Order {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ORDER_ID", nullable = false)
    private Integer orderId;

    /** 订单名称 */
    @Column(name = "ORDER_NAME")
    private String orderName;

    /** 订单日期 */
    @Column(name = "ORDER_DATE")
    private String orderDate;

    /** 供货商ID */
    @Column(name = "SUPPLIER_ID")
    private Integer supplierId;

    /** 供货商联系方式 */
    @Column(name = "SUPPLIER_PHONE")
    private String supplierPhone;

    /** 订单类型，字典键：DDLX */
    @Column(name = "ORDER_TYPE")
    private Integer orderType;

    /** 订单总价 */
    @Column(name = "TOTAL_PRICE")
    private String totalPrice;

    /** 订单照片附件 */
    @Column(name = "ORDER_PICTURE")
    private Blob orderPicture;

    /** 订单创建时间 */
    @Column(name = "CREATE_TIME")
    private Date createTiem;

    /** 订单更新时间 */
    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierPhone() {
        return supplierPhone;
    }

    public void setSupplierPhone(String supplierPhone) {
        this.supplierPhone = supplierPhone;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Blob getOrderPicture() {
        return orderPicture;
    }

    public void setOrderPicture(Blob orderPicture) {
        this.orderPicture = orderPicture;
    }

    public Date getCreateTiem() {
        return createTiem;
    }

    public void setCreateTiem(Date createTiem) {
        this.createTiem = createTiem;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }
}
