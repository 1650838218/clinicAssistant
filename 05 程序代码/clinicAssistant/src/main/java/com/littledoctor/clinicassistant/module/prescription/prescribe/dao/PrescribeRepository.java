package com.littledoctor.clinicassistant.module.prescription.prescribe.dao;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 17:58
 * @Description: 处方管理--处方
 */
public interface PrescribeRepository extends JpaRepository<Prescribe,Integer>, JpaSpecificationExecutor<Prescribe> {
}
