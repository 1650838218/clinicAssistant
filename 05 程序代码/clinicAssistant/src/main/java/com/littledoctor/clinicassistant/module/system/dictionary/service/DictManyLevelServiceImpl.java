package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.module.system.dictionary.dao.DictManyLevelRepository;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
 * @Date: 2019-04-21 20:31
 * @Description: 多级字典
 */
@Service
public class DictManyLevelServiceImpl implements DictManyLevelService {

    @Autowired
    private DictManyLevelRepository dictManyLevelRepository;

    @Override
    public List<DictManyLevelType> selectAllLazy() throws Exception{
        return dictManyLevelRepository.selectAllLazy();
    }

    /**
     * 保存多级字典
     * @param dictManyLevelType
     * @return
     */
    @Override
    public DictManyLevelType save(DictManyLevelType dictManyLevelType) throws Exception {
        if (dictManyLevelType != null) {
            dictManyLevelType.setDictTypeKey(dictManyLevelType.getDictTypeKey().trim());
            dictManyLevelType.setDictTypeName(dictManyLevelType.getDictTypeName().trim());
            return dictManyLevelRepository.saveAndFlush(dictManyLevelType);
        }
        return null;
    }

    /**
     * 删除多级字典
     * @param dictTypeId
     * @return
     */
    @Override
    public boolean delete(String dictTypeId) throws Exception {
        if (StringUtils.isNotBlank(dictTypeId)) {
            dictManyLevelRepository.deleteById(Integer.parseInt(dictTypeId));
            return true;
        }
        return false;
    }

    /**
     * 根据ID查询多级菜单
     * @param dictTypeId
     * @return
     */
    @Override
    public DictManyLevelType getById(String dictTypeId) throws Exception {
        if (StringUtils.isNotBlank(dictTypeId)) {
            return dictManyLevelRepository.findById(Integer.parseInt(dictTypeId)).get();
        }
        return null;
    }

    /**
     * 检查多级字典名称是否重复
     * @param dictTypeId
     * @param dictTypeName
     * @return false 重复 true 不重复
     */
    @Override
    public boolean repeatTypeName(String dictTypeId, String dictTypeName) {
        if (StringUtils.isNotBlank(dictTypeName)) {
            return dictManyLevelRepository.count(new Specification<DictManyLevelType>() {
                @Override
                public Predicate toPredicate(Root<DictManyLevelType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                    List<Predicate> list = new ArrayList<>();
                    list.add(criteriaBuilder.equal(root.get("dictTypeName"), dictTypeName));
                    if (StringUtils.isNotBlank(dictTypeId)) {
                        list.add(criteriaBuilder.notEqual(root.get("dictTypeId"), dictTypeId));
                    }
                    return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
                }
            }) <= 0;
        }
        return false;
    }

    /**
     * 检查多级字典键是否重复
     * @param dictTypeId
     * @param dictTypeKey
     * @return false 重复 true 不重复
     */
    @Override
    public boolean repeatTypeKey(String dictTypeId, String dictTypeKey) {
        if (StringUtils.isNotBlank(dictTypeKey)) {
            return dictManyLevelRepository.count(new Specification<DictManyLevelType>() {
                @Override
                public Predicate toPredicate(Root<DictManyLevelType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                    List<Predicate> list = new ArrayList<>();
                    list.add(criteriaBuilder.equal(root.get("dictTypeKey"), dictTypeKey));
                    if (StringUtils.isNotBlank(dictTypeId)) {
                        list.add(criteriaBuilder.notEqual(root.get("dictTypeId"), dictTypeId));
                    }
                    return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
                }
            }) <= 0;
        }
        return false;
    }
}
