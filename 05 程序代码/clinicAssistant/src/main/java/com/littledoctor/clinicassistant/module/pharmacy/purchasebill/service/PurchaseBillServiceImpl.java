package com.littledoctor.clinicassistant.module.pharmacy.purchasebill.service;

import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.dao.PurchaseBillRepository;
import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.entity.PurchaseBill;
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
 * @Date: 2019-05-04 16:42
 * @Description: 采购单
 */
@Service
public class PurchaseBillServiceImpl implements PurchaseBillService {

    @Autowired
    private PurchaseBillRepository purchaseBillRepository;

    /**
     * 分页查询订单
     * @param page
     * @param dateRange
     * @param supplierId
     * @param orderType
     * @return
     * @throws Exception
     */
    @Override
    public Page<PurchaseBill> queryPage(Pageable page, String dateRange, String supplierId, String orderType) throws Exception {
        return purchaseBillRepository.findAll(new Specification<PurchaseBill>() {
            @Override
            public Predicate toPredicate(Root<PurchaseBill> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicateList = new ArrayList<>();
                if (StringUtils.isNotBlank(dateRange)) {
                    String[] dates = dateRange.split(" - ");
                    if (dates != null && dates.length == 2) {
                        predicateList.add(criteriaBuilder.between(root.get("orderDate"), dates[0], dates[1]));
                    }
                }
                if (StringUtils.isNotBlank(supplierId)) {
                    predicateList.add(criteriaBuilder.equal(root.get("supplierId"), supplierId));
                }
                if (StringUtils.isNotBlank(orderType)) {
                    predicateList.add(criteriaBuilder.equal(root.get("orderType"), orderType));
                }
                return criteriaBuilder.and(predicateList.toArray(new Predicate[predicateList.size()]));
            }
        }, page);
    }
}
