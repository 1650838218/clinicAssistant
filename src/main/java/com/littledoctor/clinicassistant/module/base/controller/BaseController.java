package com.littledoctor.clinicassistant.module.base.controller;

import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.base.Entity.QueryParam;
import com.littledoctor.clinicassistant.module.base.service.BaseService;
import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 19:29
 * @Description: 基础Controller类
 */
public class BaseController<T> {

    private Logger log = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    private BaseService<T> baseService;

    /**
     * 保存
     * @param t
     * @return
     */
    @RequestMapping(name = "/save", method = RequestMethod.POST)
    public T save(T t) {
        try {
            Assert.notNull(t,"被保存的实体不能为空");
            return baseService.save(t);
        } catch (Exception e) {
            log.info(e.getMessage(),e);
            return null;
        }
    }

    /**
     * 分页查询
     * 如有需要，必须重写<p>toQueryParam</p>方法
     * @param queryParam 查询条件
     * @param page
     * @return
     */
    @RequestMapping(value = "/queryPage", method = RequestMethod.GET)
    public JSONObject queryPage(@RequestParam Map<String, Object> queryParam, Pageable page) {
        try {
            Page<T> result = baseService.queryPage(toQueryParam(queryParam),page);
            return ControllerUtils.pageToJSON(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return ControllerUtils.errorJSON();
        }
    }

    /**
     * 转换查询条件，如果子类需要使用<p>queryPage</p>方法，则必须重写<p>toQueryParam</p>方法，否则每次查询都是查询所有数据
     * @param queryParam
     * @return
     */
    protected List<QueryParam> toQueryParam(Map<String, Object> queryParam) {
        return null;
    }


}
