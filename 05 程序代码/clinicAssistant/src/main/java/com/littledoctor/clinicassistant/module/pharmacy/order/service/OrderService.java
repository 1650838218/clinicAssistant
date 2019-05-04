package com.littledoctor.clinicassistant.module.pharmacy.order.service;

import com.littledoctor.clinicassistant.module.pharmacy.order.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:42
 * @Description: 药房管理 订单
 */
public interface OrderService {

    /**
     * 分页查询订单
     * @param page
     * @param dateRange
     * @param supplierId
     * @param orderType
     * @return
     */
    Page<Order> queryPage(Pageable page, String dateRange, String supplierId, String orderType) throws Exception;
}
