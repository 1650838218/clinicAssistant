package com.littledoctor.clinicassistant.common.plugin.tree;

import org.springframework.scheduling.support.SimpleTriggerContext;

import java.util.List;

/**
 * @业务信息:
 * @Filename: TreeEntity.java
 * @Description:
 * @Create Message:
 * Date         Author   Version   Description
 * ------------------------------------------------------------------
 * 2019-04-04   周俊林
 * @Modification History:
 * Date         Author   Version   Description
 * ------------------------------------------------------------------
 * 2019-04-04   周俊林
 */
public class TreeEntity {

    private String label;

    private Integer id;

    private Integer pId;

    private List<TreeEntity> children;

    public TreeEntity() {

    }

    public TreeEntity(String label, Integer id, Integer pId) {
        this.label = label;
        this.id = id;
        this.pId = pId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

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

    public List<TreeEntity> getChildren() {
        return children;
    }

    public void setChildren(List<TreeEntity> children) {
        this.children = children;
    }
}
