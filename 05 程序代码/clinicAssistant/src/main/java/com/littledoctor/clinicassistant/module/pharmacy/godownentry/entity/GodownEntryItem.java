package com.littledoctor.clinicassistant.module.pharmacy.godownentry.entity;

import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-11 18:24
 * @Description: 入库单明细
 */
@Entity
@Table(name = "GODOWN_ENTRY_ITEM")
public class GodownEntryItem {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "GODOWN_ENTRY_ITEM_ID", nullable = false)
    private Integer godownEntryItemId;

    /** 入库单ID */
    @Column(name = "GODOWN_ENTRY_ID")
    private Integer godownEntryId;

    /** 药品清单ID */
    @Column(name = "MEDICINE_LIST_ID")
    private Integer medicineListId;

    /** 数量，购进的数量 */
    @Column(name = "COUNT")
    private Double count;

    /** 数量单位 */
    @Column(name = "COUNT_UNIT")
    private Integer countUnit;

    /** 零售价 */
    @Column(name = "SELLING_PRICE")
    private Double sellingPrice;

    /** 批号 */
    @Column(name = "BATCH_NUMBER")
    private String batchNumber;

    /** 生产日期 */
    @Column(name = "MANUFACTURE_DATE")
    private String manufactureDate;

    /** 有效期至 */
    @Column(name = "EXPIRE_DATE")
    private String expireDate;

    /** 库存量，剩余量；售出，过期，损毁，退货等需要修改此字段 */
    @Column(name = "STOCK")
    private Double stock;

    public Integer getGodownEntryItemId() {
        return godownEntryItemId;
    }

    public void setGodownEntryItemId(Integer godownEntryItemId) {
        this.godownEntryItemId = godownEntryItemId;
    }

    public Integer getGodownEntryId() {
        return godownEntryId;
    }

    public void setGodownEntryId(Integer godownEntryId) {
        this.godownEntryId = godownEntryId;
    }

    public Integer getMedicineListId() {
        return medicineListId;
    }

    public void setMedicineListId(Integer medicineListId) {
        this.medicineListId = medicineListId;
    }

    public Double getCount() {
        return count;
    }

    public void setCount(Double count) {
        this.count = count;
    }

    public Integer getCountUnit() {
        return countUnit;
    }

    public void setCountUnit(Integer countUnit) {
        this.countUnit = countUnit;
    }

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getManufactureDate() {
        return manufactureDate;
    }

    public void setManufactureDate(String manufactureDate) {
        this.manufactureDate = manufactureDate;
    }

    public String getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }

    public Double getStock() {
        return stock;
    }

    public void setStock(Double stock) {
        this.stock = stock;
    }
}
