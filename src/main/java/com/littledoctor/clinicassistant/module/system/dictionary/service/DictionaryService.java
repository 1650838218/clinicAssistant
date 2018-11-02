package com.littledoctor.clinicassistant.module.system.dictionary.service;

import com.littledoctor.clinicassistant.module.prescription.medicine.entity.Medicine;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.Dictionary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/2
 * @Description: 数据字典
 */
public interface DictionaryService {
    /**
     * 分页查询
     * @param code
     * @param text
     * @param page
     * @return
     */
    Page<Dictionary> queryPage(String code, String text, Pageable page);

    /**
     * 保存数据字典
     * @param dictionary
     * @return
     */
    Dictionary save(Dictionary dictionary);

    /**
     * 删除数据字典
     * @param id
     * @return
     */
    boolean delete(Integer id);
}
