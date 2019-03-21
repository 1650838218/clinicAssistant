package com.littledoctor.clinicassistant.module.system.dictionary.dao;

import com.littledoctor.clinicassistant.module.system.dictionary.entity.Dictionary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:19
 * @Description:
 */
public interface DictionaryRepository extends JpaRepository<Dictionary, Integer>, JpaSpecificationExecutor<Dictionary> {
}
