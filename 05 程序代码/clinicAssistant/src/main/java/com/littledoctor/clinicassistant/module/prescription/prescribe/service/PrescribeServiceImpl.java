package com.littledoctor.clinicassistant.module.prescription.prescribe.service;

import com.littledoctor.clinicassistant.module.prescription.prescribe.dao.PrescribeRepository;
import com.littledoctor.clinicassistant.module.prescription.prescribe.entity.Prescribe;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/1 17:58
 * @Description: 处方管理--处方
 */
@Service
public class PrescribeServiceImpl implements PrescribeService {

    private Logger log = LoggerFactory.getLogger(PrescribeServiceImpl.class);

    @Autowired
    private PrescribeRepository prescribeRepository;

    /**
     * 保存
     * @param prescribe
     * @return
     */
    @Override
    public Prescribe save(Prescribe prescribe) {
        return prescribeRepository.saveAndFlush(prescribe);
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public boolean delete(Integer id) {
        if (id != null) {
            prescribeRepository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }
}
