package com.littledoctor.clinicassistant.module.pharmacy.purchasebill.dao;

import com.littledoctor.clinicassistant.module.pharmacy.purchasebill.entity.PurchaseBill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:44
 * @Description: 采购单
 */
public interface PurchaseBillRepository extends JpaRepository<PurchaseBill, Integer>, JpaSpecificationExecutor<PurchaseBill> {
}
