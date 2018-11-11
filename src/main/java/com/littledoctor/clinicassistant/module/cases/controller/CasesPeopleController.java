package com.littledoctor.clinicassistant.module.cases.controller;

import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.cases.entity.CasesPeople;
import com.littledoctor.clinicassistant.module.cases.service.CasesPeopleService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/9
 * @Description: 病历--患者
 */
@RestController
@RequestMapping(value = "/casesPeople")
public class CasesPeopleController{

    private Logger log = LoggerFactory.getLogger(CasesPeopleController.class);

    @Autowired
    private CasesPeopleService casesPeopleService;

    /**
     * 保存
     * @param entity
     * @return
     */
    @RequestMapping(name = "/save", method = RequestMethod.POST)
    public CasesPeople save(CasesPeople entity) {
        try {
            Assert.notNull(entity,"被保存的实体不能为空");
            return casesPeopleService.save(entity);
        } catch (Exception e) {
            log.info(e.getMessage(),e);
            return null;
        }
    }

    /**
     * 分页查询
     * @param name 查询条件
     * @param page
     * @return
     */
    @RequestMapping(value = "/queryPage", method = RequestMethod.GET)
    public JSONObject queryPage(String name, Pageable page) {
        try {
            Page<CasesPeople> result = casesPeopleService.queryPage(name,page);
            return ControllerUtils.pageToJSON(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            return ControllerUtils.errorJSON();
        }
    }
}
