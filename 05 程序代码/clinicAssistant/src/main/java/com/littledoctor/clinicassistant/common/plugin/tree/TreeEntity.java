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

    /*节点名称*/
    private String label;

    /*节点Id*/
    private Integer id;

    /*节点pId*/
    private Integer pId;

    /*节点类型*/
    private TreeNodeType nodeType;

    private List<TreeEntity> children;

    public TreeEntity() {

    }

    public TreeEntity(String label, Integer id, Integer pId) {
        this.label = label;
        this.id = id;
        this.pId = pId;
    }

    public TreeEntity(String label, Integer id, Integer pId, TreeNodeType nodeType) {
        this.label = label;
        this.id = id;
        this.pId = pId;
        this.nodeType = nodeType;
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

    public TreeNodeType getNodeType() {
        return nodeType;
    }

    public void setNodeType(TreeNodeType nodeType) {
        this.nodeType = nodeType;
    }
}
