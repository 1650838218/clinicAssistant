package com.littledoctor.clinicassistant.module.prescription.medicine.controller;

import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.prescription.medicine.service.MedicineService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/18 22:31
 * @Description: 药材字典
 */
@RestController
@RequestMapping(value = "/medicine")
public class MedicineController {

    private Logger log = LoggerFactory.getLogger(MedicineController.class);

    @Autowired
    private MedicineService service;

    /**
     * 分页查询
     * @param name 药材名称
     * @param page
     * @return
     */
    @RequestMapping(value = "/queryPage")
    public JSONObject queryPage(String name, Pageable page) {
        try {
            Page<Medicine> result = service.queryPage(name,page);
            return ControllerUtils.pageToJSON(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return ControllerUtils.errorJSON();
        }

    }
}
