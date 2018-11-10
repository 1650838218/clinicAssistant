package com.littledoctor.clinicassistant.module.base.service;

import com.littledoctor.clinicassistant.module.base.Entity.QueryParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 基础服务类
 */
@Service
public abstract class BaseServiceImpl<E, ID> implements BaseService<E, ID> {

    private Logger log = LoggerFactory.getLogger(BaseServiceImpl.class);

//    protected abstract <R extends JpaRepository<E,ID>, ID extends Serializable> R getJpaRepository();
//    protected abstract <S extends JpaSpecificationExecutor<E>> S getJpaSpecificationExecutor();

    @Resource
    private SimpleJpaRepository<E,ID> simpleJpaRepository;

    @Override
    public E save(E entity) {
        return simpleJpaRepository.saveAndFlush(entity);
    }

    @Override
    public Page<E> queryPage(List<QueryParam> queryParams, Pageable page) {
        return simpleJpaRepository.findAll(new Specification<E>() {
            @Override
            public Predicate toPredicate(Root<E> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
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
