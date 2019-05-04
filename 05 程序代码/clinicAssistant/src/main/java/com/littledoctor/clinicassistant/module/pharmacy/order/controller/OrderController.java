package com.littledoctor.clinicassistant.module.pharmacy.order.controller;

import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.module.pharmacy.order.entity.Order;
import com.littledoctor.clinicassistant.module.pharmacy.order.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:11
 * @Description: 药房管理 -> 药材，器材，医疗用品，其他
 */
@RestController
@RequestMapping(value = "/pharmacy/medicinal")
public class OrderController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrderService orderService;

    /**
     * 分页查询订单
     * @return
     */
    public LayuiTableEntity<Order> queryPage(Pageable page, String dateRange, String supplierId, String orderType) {
        try {
            return new LayuiTableEntity<Order>(orderService.queryPage(page, dateRange, supplierId, orderType));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }
}
