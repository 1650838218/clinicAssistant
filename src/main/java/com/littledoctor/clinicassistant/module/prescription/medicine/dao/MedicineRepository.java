package com.littledoctor.clinicassistant.module.prescription.medicine.dao;

import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/19 20:34
 * @Description: 药材管理
 */
public interface MedicineRepository extends JpaRepository<Medicine,Long>, JpaSpecificationExecutor<Medicine> {
}
