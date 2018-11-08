package com.littledoctor.clinicassistant.module.base.service;

import com.littledoctor.clinicassistant.module.base.dao.BaseRepository;
import com.littledoctor.clinicassistant.module.cases.service.CasesPeopleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 基础服务类
 */
@Service
public class BaseServiceImpl<T> implements BaseService<T> {

    private Logger log = LoggerFactory.getLogger(BaseServiceImpl.class);

    @Autowired
    private BaseRepository baseRepository;
}
