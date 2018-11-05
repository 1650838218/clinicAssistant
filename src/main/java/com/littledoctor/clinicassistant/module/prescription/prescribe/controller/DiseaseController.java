package com.littledoctor.clinicassistant.module.prescription.prescribe.controller;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import com.littledoctor.clinicassistant.module.prescription.prescribe.service.DiseaseService;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/28 17:58
 * @Description: 处方管理--疾病
 */
@RestController
@RequestMapping(value = "/prescription/disease")
public class DiseaseController {

    private Logger log = LoggerFactory.getLogger(DiseaseController.class);

    @Autowired
    private DiseaseService diseaseService;

    /**
     * 保存
     * @param disease
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Disease save(Disease disease) {
        try {
            log.debug(disease.toString());
            Assert.notNull(disease,"被保存的实体不能为空");
            return disease = diseaseService.save(disease);// 保存
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return null;
        }

    }

    /**
     * 加载疾病，处方目录树
     * @return
     */
    @RequestMapping(value = "/loadTree", method = RequestMethod.GET)
    public JSONArray queryTree() {
        try {
            return diseaseService.loadTree();
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return new JSONArray();
        }
    }

    /**
     * 删除疾病
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable("id") Integer id) {
        try {
            Assert.notNull(id,"ID不能为空");
            return diseaseService.delete(id);
        } catch (Exception e){
            log.error(e.getMessage(),e);
            return false;
        }
    }
}
