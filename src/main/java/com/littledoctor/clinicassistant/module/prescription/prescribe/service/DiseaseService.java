package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Disease;

import java.util.List;

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
     * 查询疾病
     * @param name 疾病名称
     * @return
     */
    public List<Disease> queryTree(String name);

    /**
     * 删除疾病及其下所有处方
     * @param id
     * @return
     */
    public boolean delete(Integer id);
}
