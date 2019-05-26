package com.littledoctor.clinicassistant.module.system.dictionary.dao;

import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 21:19
 * @Description:
 */
public interface DictionaryRepository extends JpaRepository<DictionaryType, Integer>, JpaSpecificationExecutor<DictionaryType> {
    /**
     * 查询菜单树
     * @return
     */
    @Query(value = "select new com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity(t.dictTypeName , t.dictTypeId, t.menuId) from DictionaryType t")
    List<TreeEntity> findTreeEntity();

    /**
     * 根据字典键查询字典
     * @param dictTypeKey
     * @return
     */
    @Query(value = "select t from DictionaryType t where t.dictTypeKey = ?1")
    DictionaryType getByKey(String dictTypeKey);
}
