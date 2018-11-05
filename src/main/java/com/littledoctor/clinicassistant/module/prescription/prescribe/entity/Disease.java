package com.littledoctor.clinicassistant.module.prescription.prescribe.entity;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/25 21:39
 * @Description: 疾病
 */
@Entity
@Table(name = "CF_DISEASE")
public class Disease {
    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID", nullable = false)
    private Integer id;

    /** 父ID */
    @Column(name = "PID", nullable = false)
    private Integer pId;

    /** 疾病名称 */
    @Column(name = "NAME", nullable = false, length = 10)
    private String name;

    @OneToMany(mappedBy = "disease", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
    private List<Prescribe> prescribeList = new ArrayList<Prescribe>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Prescribe> getPrescribeList() {
        return prescribeList;
    }

    public void setPrescribeList(List<Prescribe> prescribeList) {
        this.prescribeList = prescribeList;
    }

    /**
     * 转换成JSON
     * @return
     */
    public JSONObject toJSON() {
        JSONObject json = new JSONObject();
        json.put("id", this.getId());
        json.put("pId", this.getpId());
        json.put("name", this.getName());
        json.put("isDisease", true);
        return json;
    }
}
