package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.common.msg.Message;
import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import com.littledoctor.clinicassistant.module.system.dictionary.service.DictManyLevelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

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
     * 多级字典 查询
     * @return
     */
    @RequestMapping(value = "/selectAllLazy", method = RequestMethod.GET)
    public LayuiTableEntity<DictManyLevelType> selectAllLazy() {
        try {
            List<DictManyLevelType> result = dictManyLevelService.selectAllLazy();
            return new LayuiTableEntity<DictManyLevelType>(result);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 保存多级字典
     * @param dictManyLevelType
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public DictManyLevelType save(@RequestBody DictManyLevelType dictManyLevelType) {
        try {
            Assert.notNull(dictManyLevelType, Message.PARAMETER_IS_NULL);
            return dictManyLevelService.save(dictManyLevelType);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 删除 多级字典
     * @param dictTypeId
     * @return
     */
    @RequestMapping(value = "/delete/{dictTypeId}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable("dictTypeId") String dictTypeId) {
        try {
            Assert.notNull(dictTypeId, Message.PARAMETER_IS_NULL);
            return dictManyLevelService.delete(dictTypeId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 根据ID查询 多级菜单
     * @param dictTypeId
     * @return
     */
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public DictManyLevelType getById(String dictTypeId) {
        try {
            Assert.notNull(dictTypeId, Message.PARAMETER_IS_NULL);
            return dictManyLevelService.getById(dictTypeId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 检查多级字典名称是否重复
     * @param dictTypeId
     * @param dictTypeName
     * @return false 重复 true 不重复
     */
    @RequestMapping(value = "/repeatTypeName", method = RequestMethod.GET)
    public boolean repeatTypeName(String dictTypeId, String dictTypeName) {
        try {
            Assert.notNull(dictTypeName, Message.PARAMETER_IS_NULL);
            return dictManyLevelService.repeatTypeName(dictTypeId, dictTypeName);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 检查多级字典名称是否重复
     * @param dictTypeId
     * @param dictTypeKey
     * @return false 重复 true 不重复
     */
    @RequestMapping(value = "/repeatTypeKey", method = RequestMethod.GET)
    public boolean repeatTypeKey(String dictTypeId, String dictTypeKey) {
        try {
            Assert.notNull(dictTypeKey, Message.PARAMETER_IS_NULL);
            return dictManyLevelService.repeatTypeKey(dictTypeId, dictTypeKey);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }
}
