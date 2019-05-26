package com.littledoctor.clinicassistant.module.pharmacy.medicinelist.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/18 22:00
 * @Description: 药材清单实体类，进货时从此清单中选取
 */
@Entity
@Table(name = "MEDICINE_LIST")
public class MedicineList {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MEDICINE_LIST_ID", nullable = false)
    private Integer medicineListId;

    /** 条形码 */
    @Column(name = "BARCODE")
    private String barcode;

    /** 名称 */
    @Column(name = "MEDICINE_NAME", nullable = false)
    private String medicineName;

    /** 简拼 首字母 */
    @Column(name = "ABBREVIATION", nullable = false)
    private String abbreviation;

    /** 全拼 */
    @Column(name = "FULL_PINYIN", nullable = false)
    private String fullPinyin;

    /** 成分 */
    @Column(name = "COMPONENT", length = 1000)
    private String component;

    /** 功能主治 */
    @Column(name = "FUNCTION_ATTENDING", length = 1000)
    private String functionAttending;

    /** 规格 */
    @Column(name = "SPECIFICATIONS")
    private String specifications;

    /** 用法用量 */
    @Column(name = "USAGE_AND_DOSAGE", length = 1000)
    private String usageAndDosage;

    /** 禁忌 */
    @Column(name = "TABOO", length = 1000)
    private String taboo;

    /** 厂家，制造商 */
    @Column(name = "MANUFACTURER")
    private String manufacturer;

    /** 库存预警 */
    @Column(name = "STOCK_WARN")
    private Integer stockWarn;

    /** 是否有毒 */
    @Column(name = "POISONOUS")
    private boolean poisonous;

    /** 药品分类，YPFL：1：中草药；2：中成药；3：其他 */
    @Column(name = "MEDICINE_TYPE")
    private Integer medicineType;

    public Integer getMedicineListId() {
        return medicineListId;
    }

    public void setMedicineListId(Integer medicineListId) {
        this.medicineListId = medicineListId;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getFullPinyin() {
        return fullPinyin;
    }

    public void setFullPinyin(String fullPinyin) {
        this.fullPinyin = fullPinyin;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getFunctionAttending() {
        return functionAttending;
    }

    public void setFunctionAttending(String functionAttending) {
        this.functionAttending = functionAttending;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public String getUsageAndDosage() {
        return usageAndDosage;
    }

    public void setUsageAndDosage(String usageAndDosage) {
        this.usageAndDosage = usageAndDosage;
    }

    public String getTaboo() {
        return taboo;
    }

    public void setTaboo(String taboo) {
        this.taboo = taboo;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Integer getStockWarn() {
        return stockWarn;
    }

    public void setStockWarn(Integer stockWarn) {
        this.stockWarn = stockWarn;
    }

    public boolean isPoisonous() {
        return poisonous;
    }

    public void setPoisonous(boolean poisonous) {
        this.poisonous = poisonous;
    }

    public Integer getMedicineType() {
        return medicineType;
    }

    public void setMedicineType(Integer medicineType) {
        this.medicineType = medicineType;
    }
}
