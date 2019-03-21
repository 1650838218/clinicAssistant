package com.littledoctor.clinicassistant.module.prescription.prescribe.controller;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;
import com.littledoctor.clinicassistant.module.prescription.prescribe.service.PrescribeService;
import net.sf.json.JSONObject;
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
 * @Date: 2018/11/1 17:58
 * @Description: 处方管理--处方
 */
@RestController
@RequestMapping(value = "/prescription/prescribe")
public class PrescribeController {

    private Logger log = LoggerFactory.getLogger(PrescribeController.class);

    @Autowired
    private PrescribeService prescribeService;

    /**
     * 保存
     * @param prescribe
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Prescribe save(Prescribe prescribe) {
        try {
            Assert.notNull(prescribe,"处方实体不能为空");
            return prescribeService.save(prescribe);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return null;
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
            return prescribeService.delete(id);
        } catch (Exception e){
            log.error(e.getMessage(),e);
            return false;
        }
    }
}
