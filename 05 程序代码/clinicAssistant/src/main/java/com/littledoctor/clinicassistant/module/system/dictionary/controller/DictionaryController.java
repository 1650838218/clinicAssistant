package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.common.msg.Message;
import com.littledoctor.clinicassistant.common.plugin.tree.TreeEntity;
import com.littledoctor.clinicassistant.common.plugin.tree.TreeUtils;
import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryItem;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryType;
import com.littledoctor.clinicassistant.module.system.dictionary.service.DictionaryService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/2
 * @Description: 数据字典
 */
@RestController
@RequestMapping(value = "/system/dictionary/oneLevel")
public class DictionaryController {

    private Logger log = LoggerFactory.getLogger(DictionaryController.class);

    @Autowired
    private DictionaryService dictionaryService;

    /**
     * 获取字典树
     * @return
     */
    @RequestMapping(value = "/queryTree", method = RequestMethod.GET)
    public Map<String, Object> queryTree() {
        Map<String, Object> map = new HashMap<>();
        try {
            List<TreeEntity> data = dictionaryService.findTreeEntity();
            map.put("code", "200");
            map.put("data", TreeUtils.listToTree(data));
            return map;
        } catch (Exception e) {
            map.put("code", "500");
            map.put("data", null);
            log.error(e.getMessage(), e);
        }
        return map;
    }

    /**
     * 分页查询
     * @param code
     * @param text
     * @param page
     * @return
     */
    @RequestMapping(value = "/queryPage")
    public JSONObject queryPage(String code, String text, Pageable page) {
        try {
            Page<DictionaryType> result = dictionaryService.queryPage(code,text,page);
            return ControllerUtils.pageToJSON(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return ControllerUtils.errorJSON();
        }
    }

    /**
     * 保存数据字典
     * @param dictionaryType
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public DictionaryType save(@RequestBody DictionaryType dictionaryType) {
        try {
            Assert.notNull(dictionaryType,"保存数据字典时实体不能为空");
            return dictionaryService.save(dictionaryType);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return null;
        }
    }

    /**
     * 删除数据字典
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable("id") Integer id) {
        try {
            Assert.notNull(id,"删除数据字典时id不能为空");
            return dictionaryService.delete(id);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return false;
        }
    }

    /**
     * 根据ID查询字典
     * @param dictionaryId
     * @return
     */
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public DictionaryType getById(Integer dictionaryId) {
        try {
            Assert.notNull(dictionaryId, Message.PARAMETER_IS_NULL);
            return dictionaryService.getById(dictionaryId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 根据字典键查询字典，常用于下拉框
     * @param dictTypeKey
     * @return
     */
    @RequestMapping(value = "/getByKey", method = RequestMethod.GET)
    public DictionaryType getByKey(@RequestParam String dictTypeKey) {
        try {
//            Assert.notNull(dictionaryId, Message.PARAMETER_IS_NULL);
            return dictionaryService.getByKey(dictTypeKey);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 根据字典键查询字典，常用于下拉框
     * @param dictTypeKey
     * @return
     */
    @RequestMapping(value = "/getItemByKey", method = RequestMethod.GET)
    public List<DictionaryItem> getItemByKey(@RequestParam String dictTypeKey) {
        try {
            return dictionaryService.getByKey(dictTypeKey).getDictItem();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return new ArrayList<>();
    }

    /**
     * 检查字典名称是否重复
     * @param dictTypeId
     * @param dictTypeName
     * @return false 重复 true 不重复
     */
    @RequestMapping(value = "/repeatTypeName", method = RequestMethod.GET)
    public boolean repeatTypeName(String dictTypeId, String dictTypeName) {
        try {
            Assert.notNull(dictTypeName, Message.PARAMETER_IS_NULL);
            return dictionaryService.repeatTypeName(dictTypeId, dictTypeName);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 检查字典键是否重复
     * @param dictTypeId
     * @param dictTypeKey
     * @return false 重复 true 不重复
     */
    @RequestMapping(value = "/repeatTypeKey", method = RequestMethod.GET)
    public boolean repeatTypeKey(String dictTypeId, String dictTypeKey) {
        try {
            Assert.notNull(dictTypeKey, Message.PARAMETER_IS_NULL);
            return dictionaryService.repeatTypeKey(dictTypeId, dictTypeKey);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }
}
