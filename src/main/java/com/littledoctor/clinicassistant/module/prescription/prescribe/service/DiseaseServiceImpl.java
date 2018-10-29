package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.dao.DiseaseRepository;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/28 17:57
 * @Description: 处方管理--疾病
 */
@Service
public class DiseaseServiceImpl implements DiseaseService{

    private Logger log = LoggerFactory.getLogger(DiseaseServiceImpl.class);

    @Autowired
    private DiseaseRepository diseaseRepository;

    @Override
    public Disease save(Disease disease) {
        return diseaseRepository.saveAndFlush(disease);
    }

    @Override
    public List<Disease> queryTree(String name) {
        return diseaseRepository.findAll(new Specification<Disease>() {
            @Override
            public Predicate toPredicate(Root<Disease> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                if (!StringUtils.isEmpty(name)) {
                    return cb.like(root.get("name"), name);
                }
                return null;
            }
        });
    }
}
