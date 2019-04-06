package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
import com.littledoctor.clinicassistant.module.system.dictionary.dao.DictionaryRepository;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryType;
import com.littledoctor.clinicassistant.module.system.menu.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
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

    @Autowired
    private MenuService menuService;

    /**
     * 分页查询
     * @param code
     * @param text
     * @param page
     * @return
     */
    @Override
    public Page<DictionaryType> queryPage(String code, String text, Pageable page) {
        return dictionaryRepository.findAll(new Specification<DictionaryType>() {
            @Override
            public Predicate toPredicate(Root<DictionaryType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
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
     * @param dictionaryType
     * @return
     */
    @Override
    public DictionaryType save(DictionaryType dictionaryType) {
        return dictionaryRepository.saveAndFlush(dictionaryType);
    }

    /**
     * 删除数据字典
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        dictionaryRepository.deleteById(id);
        return false;
    }

    /**
     * 获取字典树
     * @return
     */
    @Override
    public List<TreeEntity> findTreeEntity() throws Exception {
        List<TreeEntity> result = new ArrayList<>();
        // 查询菜单
        List<TreeEntity> menuList = menuService.findTreeEntity();
        if (!CollectionUtils.isEmpty(menuList)) result.addAll(menuList);
        // 查询字典类型
        List<TreeEntity> dictionaryList = dictionaryRepository.findTreeEntity();
        if (!CollectionUtils.isEmpty(dictionaryList)) result.addAll(dictionaryList);
        return result;
    }
}
