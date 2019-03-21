package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.Dictionary;
import com.littledoctor.clinicassistant.module.system.dictionary.service.DictionaryService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/2
 * @Description: 数据字典
 */
@RestController
@RequestMapping(value = "/dictionary")
public class DictionaryController {

    private Logger log = LoggerFactory.getLogger(DictionaryController.class);

    @Autowired
    private DictionaryService dictionaryService;

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
            Page<Dictionary> result = dictionaryService.queryPage(code,text,page);
            return ControllerUtils.pageToJSON(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return ControllerUtils.errorJSON();
        }
    }

    /**
     * 保存数据字典
     * @param dictionary
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Dictionary save(Dictionary dictionary) {
        try {
            Assert.notNull(dictionary,"保存数据字典时实体不能为空");
            return dictionaryService.save(dictionary);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return null;
        }
    }

    /**
     * 保存数据字典
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
}
