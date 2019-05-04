package com.littledoctor.clinicassistant.module.pharmacy.order.entity;

import javax.persistence.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 16:18
 * @Description: 药房管理 -> 药材，器材，医疗用品，其他
 */
@Entity
@Table(name = "MEDICINAL")
public class OrderItem {

    /** 主键ID */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MEDICINAL_ID", nullable = false)
    private Integer medicinalId;

}
