package com.littledoctor.clinicassistant.common.plugin.layui;

import com.littledoctor.clinicassistant.common.constant.Constant;
import com.littledoctor.clinicassistant.common.msg.Message;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 21:00
 * @Description:
 */
public class LayuiTableEntity {

    /** 返回码，0：成功；其他：失败 */
    private Integer code;

    /** 错误信息 */
    private String msg;

    /** 总条数，不是分页后查询结果的总条数，而是根据条件查询出的总条数*/
    private Integer count;

    /** 返回数据 */
    private List<? extends Object> data;

    public LayuiTableEntity() {

    }

    public LayuiTableEntity(List<? extends Object> data) {
        if (!CollectionUtils.isEmpty(data)) {
            this.code = 0;
            this.msg = Message.QUERY_SUCCESS;
            this.count = data.size();
            this.data = data;
        } else {
            this.code = 1;
            this.msg = Message.QUERY_FAILED;
            this.count = 0;
            this.data = new ArrayList<>();
        }

    }
}
