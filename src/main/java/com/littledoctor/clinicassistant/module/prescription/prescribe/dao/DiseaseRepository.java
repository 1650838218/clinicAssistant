package com.littledoctor.clinicassistant.module.prescription.prescribe.dao;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/28 17:54
 * @Description: 处方管理 -> 疾病
 */
public interface DiseaseRepository extends JpaRepository<Disease,Integer>, JpaSpecificationExecutor<Disease> {
}
