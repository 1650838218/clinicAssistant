package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import com.littledoctor.clinicassistant.module.system.dictionary.service.DictManyLevelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:22
 * @Description: 多级字典
 */
@RestController
@RequestMapping(value = "/system/dictionary/manyLevel")
public class DictManyLevelController {

    @Autowired
    private DictManyLevelService dictManyLevelService;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * 多级字典
     * @return
     */
    @RequestMapping(value = "/selectAllLazy", method = RequestMethod.GET)
    public LayuiTableEntity selectAllLazy() {
        try {
            List<DictManyLevelType> result = dictManyLevelService.selectAllLazy();
            return new LayuiTableEntity(result);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return new LayuiTableEntity();
    }
}
