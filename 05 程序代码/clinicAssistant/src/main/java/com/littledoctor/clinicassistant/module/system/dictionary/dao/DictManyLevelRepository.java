package com.littledoctor.clinicassistant.module.system.dictionary.dao;

import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:39
 * @Description:
 */
public interface DictManyLevelRepository extends JpaRepository<DictManyLevelType, Integer>, JpaSpecificationExecutor<DictManyLevelType> {

    @Query(value = "select new DictManyLevelType (t.dictTypeId, t.dictTypeName, t.dictTypeKey) from DictManyLevelType t")
    List<DictManyLevelType> selectAllLazy();
}
