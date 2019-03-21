package com.littledoctor.clinicassistant.module.cases.service;

import com.littledoctor.clinicassistant.module.cases.entity.CasesPeople;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 患者基本信息
 */
public interface CasesPeopleService {
    /**
     * 保存
     * @param entity
     * @return
     */
    public CasesPeople save(CasesPeople entity);

    /**
     * 分页查询
     * @param name
     * @param page
     * @return
     */
    public Page<CasesPeople> queryPage(String name, Pageable page);
}
