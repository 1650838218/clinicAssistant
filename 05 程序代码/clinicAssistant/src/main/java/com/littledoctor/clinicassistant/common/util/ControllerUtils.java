package com.littledoctor.clinicassistant.common.util;

import com.littledoctor.clinicassistant.common.constant.Constant;
import com.littledoctor.clinicassistant.common.msg.Message;
import net.sf.json.JSONObject;
import org.springframework.data.domain.Page;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/20 09:52
 * @Description: Controller 工具类
 */
public class ControllerUtils {

    /**
     * 数据表格 将page对象转为JSON
     * @param page
     * @return
     */
    public static JSONObject pageToJSON(Page page) {
        JSONObject json = new JSONObject();
        if (page == null) return nullJSON();
        return notNullJSON(page);
    }

    /**
     * 数据表格 查询结果不为空的返回信息
     * @param page
     * @return
     */
    public static JSONObject notNullJSON(@NotNull Page page) {
        JSONObject json = new JSONObject();
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[0], Constant.CONTROLLER_TABLE_CODE[0]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[1], Message.CONTROLLER_TABLE_MSG[1]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[2], page.getNumberOfElements());
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[3], page.getContent());
        return json;
    }

    /**
     * 数据表格 查询结果为空的返回信息
     * @return
     */
    public static JSONObject nullJSON() {
        JSONObject json = new JSONObject();
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[0], Constant.CONTROLLER_TABLE_CODE[0]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[1], Message.CONTROLLER_TABLE_MSG[0]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[2], Constant.CONTROLLER_TABLE_COUNT);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[3], new ArrayList<Object>());
        return json;
    }

    /**
     * 数据表格 异常的返回信息
     * @return
     */
    public static JSONObject errorJSON() {
        JSONObject json = new JSONObject();
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[0], Constant.CONTROLLER_TABLE_CODE[1]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[1], Message.CONTROLLER_TABLE_MSG[2]);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[2], Constant.CONTROLLER_TABLE_COUNT);
        json.put(Constant.CONTROLLER_TABLE_RESPONSE[3], new ArrayList<Object>());
        return json;
    }
}
