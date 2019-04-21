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

    /**
     * 主键ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MANY_LEVEL_TYPE_ID", nullable = false)
    private Integer manyLevelTypeId;

    /**
     * 类型名称
     */
    @Column(name = "MANY_LEVEL_TYPE_NAME", nullable = false, length = 500)
    private String manyLevelTypeName;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    @JoinColumn(name = "MANY_LEVEL_TYPE_ID")
    private List<DictManyLevelNode> manyLevelNodeList = new ArrayList<>();

    public DictManyLevelType() {

    }

    public DictManyLevelType(Integer manyLevelTypeId, String manyLevelTypeName) {
        this.manyLevelTypeId = manyLevelTypeId;
        this.manyLevelTypeName = manyLevelTypeName;
    }

    public Integer getManyLevelTypeId() {
        return manyLevelTypeId;
    }

    public void setManyLevelTypeId(Integer manyLevelTypeId) {
        this.manyLevelTypeId = manyLevelTypeId;
    }

    public String getManyLevelTypeName() {
        return manyLevelTypeName;
    }

    public void setManyLevelTypeName(String manyLevelTypeName) {
        this.manyLevelTypeName = manyLevelTypeName;
    }

    public List<DictManyLevelNode> getManyLevelNodeList() {
        return manyLevelNodeList;
    }

    public void setManyLevelNodeList(List<DictManyLevelNode> manyLevelNodeList) {
        this.manyLevelNodeList = manyLevelNodeList;
    }
}
