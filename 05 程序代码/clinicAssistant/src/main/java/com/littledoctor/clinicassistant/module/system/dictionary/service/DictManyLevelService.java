package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:31
 * @Description: 多级字典
 */
public interface DictManyLevelService {

    /**
     * 查询多级字典列表
     * @return
     */
    List<DictManyLevelType> selectAllLazy() throws Exception;

    /**
     * 保存多级字典
     * @param dictManyLevelType
     * @return
     */
    DictManyLevelType save(DictManyLevelType dictManyLevelType) throws Exception;

    /**
     * 删除 多级字典
     * @param dictTypeId
     * @return
     */
    boolean delete(String dictTypeId) throws Exception;

    /**
     * 根据ID查询多级字典
     * @param dictTypeId
     * @return
     */
    DictManyLevelType getById(String dictTypeId) throws Exception;

    /**
     * 检查多级字典名称是否重复
     * @param dictTypeId
     * @param dictTypeName
     * @return
     */
    boolean repeatTypeName(String dictTypeId, String dictTypeName);

    /**
     * 检查多级字典键是否重复
     * @param dictTypeId
     * @param dictTypeKey
     * @return
     */
    boolean repeatTypeKey(String dictTypeId, String dictTypeKey);
}
