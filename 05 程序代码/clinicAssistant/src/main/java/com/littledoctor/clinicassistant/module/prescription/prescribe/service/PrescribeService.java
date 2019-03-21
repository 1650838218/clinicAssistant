package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 17:58
 * @Description: 处方管理--处方
 */
public interface PrescribeService {

    /**
     * 保存
     * @param prescribe
     * @return
     */
    Prescribe save(Prescribe prescribe);

    /**
     * 删除
     * @param id
     * @return
     */
    boolean delete(Integer id);
}
