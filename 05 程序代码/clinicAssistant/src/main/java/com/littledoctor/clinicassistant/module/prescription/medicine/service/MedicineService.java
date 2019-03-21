package com.littledoctor.clinicassistant.module.prescription.medicine.service;

import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/19 22:48
 * @Description: 药材管理
 */
public interface MedicineService {
    /**
     * 分页查询
     * @param name 药材名称
     * @param page
     * @return
     */
    Page<Medicine> queryPage(String name, Pageable page);
}
