package com.littledoctor.clinicassistant.module.pharmacy.supplier.service;

import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.module.pharmacy.supplier.entity.Supplier;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 12:58
 * @Description: 供应商
 */
public interface SupplierService {
    /**
     * 查询所有供应商
     * @return
     */
    List<Supplier> findAll() throws Exception;

    /**
     * 保存供应商
     * @param supplier
     * @return
     */
    Supplier save(Supplier supplier) throws Exception;

    /**
     * 删除供应商
     * @param supplierId
     * @return
     */
    boolean delete(String supplierId) throws Exception;

    /**
     * 获取select option list
     * @return
     */
    List<SelectOption> getSelectOption() throws Exception;

    /**
     * 根据ID查询供应商
     * @return
     * @param supplierId
     */
    Supplier findById(String supplierId) throws Exception;
}
