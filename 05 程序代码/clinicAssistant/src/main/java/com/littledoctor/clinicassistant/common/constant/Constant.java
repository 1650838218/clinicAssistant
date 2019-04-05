package com.littledoctor.clinicassistant.common.constant;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/20 10:15
 * @Description: 常量
 */
public interface Constant {

    /**
     * 动态表格，返回的数据格式
     */
    public static final String[] CONTROLLER_TABLE_RESPONSE = {"code","msg","count","data"};

    /**
     * 动态表格 返回的json数据中code的值
     * 0 表示成功
     * 1 表示失败
     */
    public static final short[] CONTROLLER_TABLE_CODE = {0,1};

    /**
     * 动态表格 查询结果数
     */
    public static final short CONTROLLER_TABLE_COUNT = 0;

    /** 所有树形结构的根节点ID */
    public static final Integer ROOT_NODE_ID = 0;

    /** 字符串分隔符 */
    public static final String SPLIT_STR = ",";
}
