package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:10
 * @Description: 多级字典 节点表
 */
@Entity
@Table(name = "DICT_MANY_LEVEL_NODE")
public class DictManyLevelNode {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "NODE_ID", nullable = false)
    private Integer nodeId;

    /** 父节点ID */
    @Column(name = "PARENT_NODE_ID", nullable = false)
    private Integer parentNodeId;

    /** 节点名称*/
    @Column(name = "NODE_NAME", nullable = false, length = 500)
    private String nodeName;

    public Integer getNodeId() {
        return nodeId;
    }

    public void setNodeId(Integer nodeId) {
        this.nodeId = nodeId;
    }

    public Integer getParentNodeId() {
        return parentNodeId;
    }

    public void setParentNodeId(Integer parentNodeId) {
        this.parentNodeId = parentNodeId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }
}
