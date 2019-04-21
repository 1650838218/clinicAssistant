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
}
