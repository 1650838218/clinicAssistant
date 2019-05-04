package com.littledoctor.clinicassistant.module.pharmacy.order.dao;

import com.littledoctor.clinicassistant.module.pharmacy.order.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:44
 * @Description: 药房管理，订单
 */
public interface OrderRepository extends JpaRepository<Order, Integer>, JpaSpecificationExecutor<Order> {
}
