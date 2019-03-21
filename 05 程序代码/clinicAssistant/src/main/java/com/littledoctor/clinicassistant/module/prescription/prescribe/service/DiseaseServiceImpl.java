package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.dao.DiseaseRepository;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/28 17:57
 * @Description: 处方管理--疾病
 */
@Service
public class DiseaseServiceImpl implements DiseaseService{

    private Logger log = LoggerFactory.getLogger(DiseaseServiceImpl.class);

    @Autowired
    private DiseaseRepository diseaseRepository;

    @Override
    public Disease save(Disease disease) {
        return diseaseRepository.saveAndFlush(disease);
    }

    /**
     * 加载疾病处方树
     * @return
     */
    @Override
    public JSONArray loadTree() {
        List<Disease> diseaseList = diseaseRepository.findAll();
        JSONArray jsonArray = new JSONArray();
        for (Disease disease: diseaseList) {
            jsonArray.add(disease.toJSON());
            List<Prescribe> prescribeList = disease.getPrescribeList();
            if (prescribeList != null && prescribeList.size() > 0) {
                for (Prescribe prescribe : prescribeList) {
                    jsonArray.add(prescribe.toJSON(disease.getId()));
                }
            }
        }
        return jsonArray;
    }

    @Override
    @Transactional
    public boolean delete(Integer id) {
        if (id != null) {
            diseaseRepository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }
}
