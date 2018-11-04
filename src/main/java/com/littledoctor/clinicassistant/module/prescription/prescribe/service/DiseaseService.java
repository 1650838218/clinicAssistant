package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;
import net.sf.json.JSONArray;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/28 17:57
 * @Description: 处方管理--疾病
 */
public interface DiseaseService {
    /**
     * 保存
     * @param disease
     * @return
     */
    public Disease save(Disease disease);

    /**
     * 加载疾病处方树
     * @return
     */
    public JSONArray loadTree();

    /**
     * 删除疾病及其下所有处方
     * @param id
     * @return
     */
    public boolean delete(Integer id);
}
