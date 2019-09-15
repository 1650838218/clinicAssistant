package com.littledoctor.clinicassistant.module.pharmacy.medicinelist.service;

import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.dao.MedicineListRepository;
import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.entity.MedicineList;
import org.apache.commons.lang.StringUtils;
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
 * @Date: 2018/10/19 22:48
 * @Description: 药材清单，进货时从此清单中选取
 */
@Service
public class MedicineListServiceImpl implements MedicineListService {

    @Autowired
    private MedicineListRepository medicineListRepository;

    /**
     * 分页查询
     * @param keywords 查询条件 药品名称/全拼/简拼/条形码
     * @param page
     * @return
     */
    @Override
    public Page<MedicineList> queryPage(String keywords, Pageable page) {
        return medicineListRepository.findAll(new Specification<MedicineList>() {
            @Override
            public Predicate toPredicate(Root<MedicineList> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                if (StringUtils.isNotBlank(keywords)) {
                    list.add(criteriaBuilder.equal(root.get("barcode"), keywords));
                    list.add(criteriaBuilder.like(root.get("medicineName"), "%" + keywords + "%"));
                    list.add(criteriaBuilder.like(root.get("abbreviation"), keywords.toUpperCase() + "%"));
                    list.add(criteriaBuilder.like(root.get("fullPinyin"), keywords.toLowerCase() + "%"));
                }
                if (list.size() > 0) {
                    return criteriaBuilder.or(list.toArray(new Predicate[list.size()]));
                }
                return null;
            }
        }, page);
    }

    /**
     * 保存
     * @param medicineList
     * @return
     */
    @Override
    public MedicineList save(MedicineList medicineList) {
        if (medicineList != null) {
            return medicineListRepository.saveAndFlush(medicineList);
        }
        return null;
    }

    /**
     * 根据ID删除
     * @param medicineListId
     * @return
     */
    @Override
    public boolean delete(String medicineListId) {
        if (StringUtils.isNotBlank(medicineListId)) {
            medicineListRepository.deleteById(Integer.parseInt(medicineListId));
            return true;
        }
        return false;
    }

    /**
     * 根据ID查询
     * @param medicineListId
     * @return
     */
    @Override
    public MedicineList getById(String medicineListId) {
        if (StringUtils.isNotBlank(medicineListId)) {
            return medicineListRepository.findById(Integer.parseInt(medicineListId)).get();
        }
        return null;
    }

    /**
     * 判断条形码是否不重复，是否不存在
     * @param midicineListId
     * @param barcode
     * @return true 不存在  false 已存在，默认false
     */
    @Override
    public boolean notRepeatBarcode(String midicineListId, String barcode) {
        if (StringUtils.isNotBlank(barcode)) {
            return medicineListRepository.count(new Specification<MedicineList>() {
                @Override
                public Predicate toPredicate(Root<MedicineList> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                    List<Predicate> list = new ArrayList<>();
                    list.add(criteriaBuilder.equal(root.get("barcode"), barcode));
                    if (StringUtils.isNotBlank(midicineListId)) {
                        list.add(criteriaBuilder.notEqual(root.get("midicineListId"), midicineListId));
                    }
                    return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
                }
            }) <= 0;
        }
        return false;
    }

    /**
     * 判断药品名称是否不重复，是否不存在
     *
     * @param midicineListId
     * @param midicineName
     * @return true 不存在  false 已存在，默认false
     */
    @Override
    public boolean notRepeatName(String midicineListId, String midicineName) {
        if (StringUtils.isNotBlank(midicineName)) {
            return medicineListRepository.count(new Specification<MedicineList>() {
                @Override
                public Predicate toPredicate(Root<MedicineList> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                    List<Predicate> list = new ArrayList<>();
                    list.add(criteriaBuilder.equal(root.get("medicineName"), midicineName));
                    if (StringUtils.isNotBlank(midicineListId)) {
                        list.add(criteriaBuilder.notEqual(root.get("midicineListId"), midicineListId));
                    }
                    return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
                }
            }) <= 0;
        }
        return false;
    }

    /**
     * 根据名称查询药品清单
     * @param name 可以是药品名称，药品全拼，药品简拼
     * @return
     */
    @Override
    public List<MedicineList> queryByName(String name) {
        if (StringUtils.isNotBlank(name)) {
            return medicineListRepository.findAll(new Specification<MedicineList>() {
                @Override
                public Predicate toPredicate(Root<MedicineList> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                    List<Predicate> list = new ArrayList<>();
                    list.add(criteriaBuilder.like(root.get("medicineName"), "%" + name + "%"));
                    list.add(criteriaBuilder.like(root.get("abbreviation"), name + "%"));
                    list.add(criteriaBuilder.like(root.get("fullPinyin"), name + "%"));
                    return criteriaBuilder.or(list.toArray(new Predicate[list.size()]));
                }
            });
        }
        return null;
    }

    /**
     * 获取下拉框的option list
     * @return
     */
    @Override
    public List<SelectOption> getSelectOption() throws Exception {
        return medicineListRepository.getSelectOption();
    }
}
