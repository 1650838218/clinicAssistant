package com.littledoctor.clinicassistant.common.msg;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/20 10:16
 * @Description: 各种提示信息
 */
public interface Message {

    /**
     * 数据表格 返回信息 提示信息
     */
    public static final String[] CONTROLLER_TABLE_MSG = {"暂无数据！","","数据查询异常，请联系管理员！"};

    public static final String PARAMETER_IS_NULL = "入参为空！";

    public static final String QUERY_SUCCESS = "查询成功！";

    public static final String QUERY_FAILED = "查询失败！";

    public static final String QUERY_EXCEPTION = "数据查询异常，请联系管理员！";

    public static final String NO_DATA = "暂无数据！";

}
