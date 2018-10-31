package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.dao.DiseaseRepository;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;
import java.util.concurrent.LinkedBlockingDeque;

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

    @Override
    @Transactional
    public boolean delete(Integer id) {
        if (id != null) {
            List<Disease> deleteList = new ArrayList<>();// 保存所有待删除的疾病类型
            List<Integer> leafIds = new ArrayList<>();// 保存叶子节点的id，用来删除处方
            Deque<Integer> stack = new ArrayDeque<Integer>();// 保存子节点的id
            stack.push(id);
            while (!stack.isEmpty()) {
                // 查询
                Disease disease = new Disease();
                disease.setpId(stack.pop());
                Example<Disease> example = Example.of(disease);
                List<Disease> diseaseList = diseaseRepository.findAll(example);
                if (diseaseList.size() > 0) {
                    deleteList.addAll(diseaseList);
                    for (Disease d:diseaseList) {// 入栈
                        stack.push(d.getId());
                    }
                } else {
                    leafIds.add(disease.getpId());
                }
            }
            diseaseRepository.deleteById(id);
            diseaseRepository.deleteAll(deleteList);
            // 删除处方
            return true;
        } else {
            return false;
        }
    }
}
