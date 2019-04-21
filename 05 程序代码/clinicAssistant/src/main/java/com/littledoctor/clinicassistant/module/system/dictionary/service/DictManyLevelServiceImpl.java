package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.module.system.dictionary.dao.DictManyLevelRepository;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:31
 * @Description: 多级字典
 */
@Service
public class DictManyLevelServiceImpl implements DictManyLevelService {

    @Autowired
    private DictManyLevelRepository dictManyLevelRepository;

    @Override
    public List<DictManyLevelType> selectAllLazy() throws Exception{
        return dictManyLevelRepository.selectAllLazy();
    }
}
