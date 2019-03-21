package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.ClinicassistantApplicationTests;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/4 21:58
 * @Description:
 */
public class PrescribeServiceImplTest extends ClinicassistantApplicationTests {

    @Autowired
    private PrescribeService prescribeService;

    @Test
    public void save() {
        Prescribe prescribe = new Prescribe();
        prescribe.setName("四君子汤");
        prescribe.setType(0);
        prescribe.setAbbreviation("SJZT");
        prescribe.setDetails("人参13g,鹿茸12g,白术4g");
        prescribe.setId(4);
        Disease disease = new Disease();
        disease.setId(2);
        prescribe.setDisease(disease);
        prescribeService.save(prescribe);
    }
}