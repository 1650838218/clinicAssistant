package com.littledoctor.clinicassistant.module.base.controller;

import com.littledoctor.clinicassistant.module.base.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 19:29
 * @Description: 基础类
 */
@RestController
public class BaseController<T> {

    private Logger log = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    private BaseService<T> baseService;

}
