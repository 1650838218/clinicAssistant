package com.littledoctor.clinicassistant.module.pharmacy.medicinelist.dao;

import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.entity.MedicineList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/19 20:34
 * @Description: 药材清单，进货时从此清单中选取
 */
public interface MedicineListRepository extends JpaRepository<MedicineList,Integer>, JpaSpecificationExecutor<MedicineList> {
}
