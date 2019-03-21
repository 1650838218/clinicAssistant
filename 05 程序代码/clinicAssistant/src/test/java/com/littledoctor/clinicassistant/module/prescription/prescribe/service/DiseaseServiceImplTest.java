package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.ClinicassistantApplicationTests;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/5
 * @Description:
 */
public class DiseaseServiceImplTest extends ClinicassistantApplicationTests {

    @Autowired
    DiseaseService diseaseService;

    @Test
    public void save() {
        Disease disease = new Disease();
        disease.setName("心疼");
        disease.setpId(-1);
        diseaseService.save(disease);
    }

    @Test
    public void loadTree() {
    }

    @Test
    public void delete() {
    }
}