package com.littledoctor.clinicassistant.module.base.service;

import com.littledoctor.clinicassistant.module.base.Entity.Operator;
import com.littledoctor.clinicassistant.module.base.Entity.QueryParam;
import com.littledoctor.clinicassistant.module.base.dao.BaseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 基础服务类
 */
@Service
public class BaseServiceImpl<T> implements BaseService<T> {

    private Logger log = LoggerFactory.getLogger(BaseServiceImpl.class);

    @Autowired
    private BaseRepository<T> baseRepository;

    @Override
    public T save(T t) {
        return baseRepository.saveAndFlush(t);
    }

    @Override
    public Page<T> queryPage(List<QueryParam> queryParams, Pageable page) {
        return baseRepository.findAll(new Specification<T>() {
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                if (queryParams == null || queryParams.size() == 0) return null;
                List<Predicate> predicates = new ArrayList<>();
                for (QueryParam qp: queryParams) {
                    switch (qp.getOperator()) {
                        case EQUAL:
                            if (qp.getKey() != null) {
                                predicates.add(criteriaBuilder.equal(root.get(qp.getKey()), qp.getValue()));
                            }
                            break;
                        case LIKE:
                            if (qp.getKey() != null) {
                                predicates.add(criteriaBuilder.like(root.get(qp.getKey()), '%' + qp.getValue() + '%'));
                            }
                            break;
                    }
                }
                return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },page);
    }
}
