package com.littledoctor.clinicassistant.module.base.Entity;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/9
 * @Description: 查询条件
 */
public class QueryParam {
    /** 查询条件 属性名 */
    private String key;

    /** 查询条件 属性值 */
    private String value;

    /** 查询条件 运算符 */
    private Operator operator;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Operator getOperator() {
        return operator;
    }

    public void setOperator(Operator operator) {
        this.operator = operator;
    }
}
