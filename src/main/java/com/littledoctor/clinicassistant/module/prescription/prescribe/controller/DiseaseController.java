package com.littledoctor.clinicassistant.module.prescription.prescribe.controller;

import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import com.littledoctor.clinicassistant.module.prescription.prescribe.service.DiseaseService;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

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
     * 查询疾病
     * @param name 疾病名
     * @return
     */
    @RequestMapping(value = "/queryTree", method = RequestMethod.GET)
    public List<Disease> queryTree(String name) {
        try {
            return diseaseService.queryTree(name);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return new ArrayList<Disease>();
        }
    }
}
