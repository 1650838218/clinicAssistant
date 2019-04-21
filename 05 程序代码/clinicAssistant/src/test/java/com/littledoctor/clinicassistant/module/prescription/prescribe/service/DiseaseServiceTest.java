package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import net.sf.json.JSONArray;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-20 15:08
 * @Description:
 */
public class DiseaseServiceTest {

    @Autowired
    private DiseaseService diseaseService;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Test
    public void loadTree() {
        JSONArray tree = diseaseService.loadTree();
        log.info(tree.toString());
    }
}