package com.littledoctor.clinicassistant.module.pharmacy.supplier.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 12:57
 * @Description: 供应商
 */
@Entity
@Table(name = "SUPPLIER")
public class Supplier {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "SUPPLIER_ID", nullable = false)
    private Integer supplierId;

    /** 供应商名称 */
    @Column(name = "SUPPLIER_NAME")
    private String supplierName;

    /** 供应商电话 */
    @Column(name = "SUPPLIER_PHONE")
    private String supplierPhone;

    /** 供应商地址 */
    @Column(name = "SUPPLIER_ADDRESS")
    private String supplierAddress;

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierPhone() {
        return supplierPhone;
    }

    public void setSupplierPhone(String supplierPhone) {
        this.supplierPhone = supplierPhone;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }
}
