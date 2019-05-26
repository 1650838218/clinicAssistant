package com.littledoctor.clinicassistant.module.pharmacy.purchasebill.controller;

import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.entity.PurchaseBill;
import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.service.PurchaseBillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:11
 * @Description: 采购单
 */
@RestController
@RequestMapping(value = "/pharmacy/purchasebill")
public class PurchaseBillController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PurchaseBillService purchaseBillService;

    /**
     * 分页查询订单
     * @return
     */
    public LayuiTableEntity<PurchaseBill> queryPage(Pageable page, String dateRange, String supplierId, String orderType) {
        try {
            return new LayuiTableEntity<PurchaseBill>(purchaseBillService.queryPage(page, dateRange, supplierId, orderType));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }
}
