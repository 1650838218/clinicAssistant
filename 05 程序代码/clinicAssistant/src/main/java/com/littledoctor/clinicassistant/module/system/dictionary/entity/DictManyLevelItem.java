package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:10
 * @Description: 多级字典 节点表
 */
@Entity
@Table(name = "DICT_MANY_LEVEL_ITEM")
public class DictManyLevelItem {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DICT_ITEM_ID", nullable = false)
    private Integer dictItemId;

    /** 节点ID */
    @Column(name = "NODE_ID", nullable = false)
    private String nodeId;

    /** 父节点ID */
    @Column(name = "PARENT_NODE_ID")
    private String parentNodeId;

    /** 节点名称*/
    @Column(name = "NODE_NAME", nullable = false, length = 500)
    private String nodeName;

    /** 顺序号 */
    @Column(name = "SEQUENCE_NUMBER", length = 3)
    private Integer sequenceNumber;

    public Integer getDictItemId() {
        return dictItemId;
    }

    public void setDictItemId(Integer dictItemId) {
        this.dictItemId = dictItemId;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getParentNodeId() {
        return parentNodeId;
    }

    public void setParentNodeId(String parentNodeId) {
        this.parentNodeId = parentNodeId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public Integer getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(Integer sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }
}
