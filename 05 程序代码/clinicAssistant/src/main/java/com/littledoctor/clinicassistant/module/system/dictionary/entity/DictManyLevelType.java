package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:09
 * @Description: 多级字典类型表
 */
@Entity
@Table(name = "DICT_MANY_LEVEL_TYPE")
public class DictManyLevelType {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DICT_TYPE_ID", nullable = false)
    private Integer dictTypeId;

    /** 多级字典字典类型名称 */
    @Column(name = "DICT_TYPE_NAME", nullable = false, length = 500)
    private String dictTypeName;

    /** 多级字典字典键 */
    @Column(name = "DICT_TYPE_KEY", nullable = false, length = 50)
    private String dictTypeKey;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    @JoinColumn(name = "DICT_TYPE_ID")
    @OrderBy("sequenceNumber")
    private List<DictManyLevelItem> manyLevelNodeList = new ArrayList<>();

    public DictManyLevelType() {

    }

    public DictManyLevelType(Integer dictTypeId, String dictTypeName, String dictTypeKey) {
        this.dictTypeId = dictTypeId;
        this.dictTypeName = dictTypeName;
        this.dictTypeKey = dictTypeKey;
    }

    public Integer getDictTypeId() {
        return dictTypeId;
    }

    public void setDictTypeId(Integer dictTypeId) {
        this.dictTypeId = dictTypeId;
    }

    public String getDictTypeName() {
        return dictTypeName;
    }

    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName;
    }

    public String getDictTypeKey() {
        return dictTypeKey;
    }

    public void setDictTypeKey(String dictTypeKey) {
        this.dictTypeKey = dictTypeKey;
    }

    public List<DictManyLevelItem> getManyLevelNodeList() {
        return manyLevelNodeList;
    }

    public void setManyLevelNodeList(List<DictManyLevelItem> manyLevelNodeList) {
        this.manyLevelNodeList = manyLevelNodeList;
    }
}
