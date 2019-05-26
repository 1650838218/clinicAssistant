package com.littledoctor.clinicassistant.module.pharmacy.purchasebill.service;

import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.entity.PurchaseBill;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:42
 * @Description: 采购单
 */
public interface PurchaseBillService {

    /**
     * 分页查询订单
     * @param page
     * @param dateRange
     * @param supplierId
     * @param orderType
     * @return
     */
    Page<PurchaseBill> queryPage(Pageable page, String dateRange, String supplierId, String orderType) throws Exception;
}
