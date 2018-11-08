package com.littledoctor.clinicassistant.module.base.controller;

import com.littledoctor.clinicassistant.module.base.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 19:29
 * @Description: 基础Controller类
 */
@RestController
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

}
