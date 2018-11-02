package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.system.dictionary.controller.DictionaryController;
import com.littledoctor.clinicassistant.module.system.dictionary.dao.DictionaryRepository;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.Dictionary;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryKey;
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
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/2
 * @Description: 数据字典
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {

    private Logger log = LoggerFactory.getLogger(DictionaryServiceImpl.class);

    @Autowired
    private DictionaryRepository dictionaryRepository;

    /**
     * 分页查询
     * @param code
     * @param text
     * @param page
     * @return
     */
    @Override
    public Page<Dictionary> queryPage(String code, String text, Pageable page) {
        return dictionaryRepository.findAll(new Specification<Dictionary>() {
            @Override
            public Predicate toPredicate(Root<Dictionary> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                if (!StringUtils.isEmpty(code)) {
                    list.add(criteriaBuilder.like(root.get("key").get("code"), "%" + code + "%"));
                }
                if (!StringUtils.isEmpty(text)) {
                    list.add(criteriaBuilder.like(root.get("text"), "%" + text + "%"));
                }
                return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
            }
        }, page);
    }

    /**
     * 保存数据字典
     * @param dictionary
     * @return
     */
    @Override
    public Dictionary save(Dictionary dictionary) {
        return dictionaryRepository.saveAndFlush(dictionary);
    }

    /**
     * 删除数据字典
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
