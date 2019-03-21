package com.littledoctor.clinicassistant.module.prescription.medicine.service;

import com.littledoctor.clinicassistant.module.prescription.medicine.dao.MedicineRepository;
import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
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
 * @Date: 2018/10/19 22:48
 * @Description:
 */
@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineRepository repository;

    /**
     * 分页查询
     * @param name 药材名称
     * @param page
     * @return
     */
    @Override
    public Page<Medicine> queryPage(String name, Pageable page) {
        return repository.findAll(new Specification<Medicine>() {
            @Override
            public Predicate toPredicate(Root<Medicine> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                if (!StringUtils.isEmpty(name)) {
                    return criteriaBuilder.like(root.get("name"), name);
                }
                return null;
            }
        }, page);
    }
}
