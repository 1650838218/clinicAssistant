package com.littledoctor.clinicassistant.module.cases.dao;

import com.littledoctor.clinicassistant.module.cases.entity.CasesPeople;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 患者基本信息
 */
public interface CasesPeopleRepository extends JpaRepository<CasesPeople,Integer>, JpaSpecificationExecutor<CasesPeople> {
}
