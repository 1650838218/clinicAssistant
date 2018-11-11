package com.littledoctor.clinicassistant.module.cases.service;

import com.littledoctor.clinicassistant.module.cases.dao.CasesPeopleRepository;
import com.littledoctor.clinicassistant.module.cases.entity.CasesPeople;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 患者基本信息
 */
@Service
public class CasesPeopleServiceImpl implements CasesPeopleService{

    private Logger log = LoggerFactory.getLogger(CasesPeopleServiceImpl.class);

    @Autowired
    private CasesPeopleRepository casesPeopleRepository;

    @Override
    public CasesPeople save(CasesPeople entity) {
        return casesPeopleRepository.saveAndFlush(entity);
    }

    @Override
    public Page<CasesPeople> queryPage(String name, Pageable page) {
        return casesPeopleRepository.findAll(new Specification<CasesPeople>() {
            @Override
            public Predicate toPredicate(Root<CasesPeople> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                if (!StringUtils.isEmpty(name)) {
                    return criteriaBuilder.like(root.get("name"), name);
                }
                return null;
            }
        },page);
    }
}
