package com.littledoctor.clinicassistant.common.plugin.layui;

import com.littledoctor.clinicassistant.common.constant.Constant;
import com.littledoctor.clinicassistant.common.msg.Message;
import org.springframework.data.domain.Page;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 21:00
 * @Description:
 */
public class LayuiTableEntity<T> {

    /** 返回码，0：成功；其他：失败 */
    private Integer code;

    /** 错误信息 */
    private String msg;

    /** 总条数，不是分页后查询结果的总条数，而是根据条件查询出的总条数*/
    private Integer count;

    /** 返回数据 */
    private List<T> data;

    public LayuiTableEntity() {
        this.code = 1;
        this.msg = Message.NO_DATA;
        this.count = 0;
        this.data = new ArrayList<>();
    }

    public LayuiTableEntity(List<T> data) {
        if (!CollectionUtils.isEmpty(data)) {
            this.code = 0;
            this.msg = Message.QUERY_SUCCESS;
            this.count = data.size();
            this.data = data;
        } else {
            this.code = 1;
            this.msg = Message.NO_DATA;
            this.count = 0;
            this.data = new ArrayList<>();
        }
    }

    public LayuiTableEntity(List<T> data, Integer count) {
        if (!CollectionUtils.isEmpty(data)) {
            this.code = 0;
            this.msg = Message.QUERY_SUCCESS;
            this.count = count;
            this.data = data;
        } else {
            this.code = 1;
            this.msg = Message.NO_DATA;
            this.count = count;
            this.data = new ArrayList<>();
        }
    }

    public LayuiTableEntity(Page<T> page) {
        this.count =  Integer.parseInt(String.valueOf(page.getTotalElements()));
        this.code = 0;
        this.data = page.getContent();
        if (this.count > 0) {
            this.msg = Message.QUERY_SUCCESS;
        } else {
            this.msg = Message.NO_DATA;
        }
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
