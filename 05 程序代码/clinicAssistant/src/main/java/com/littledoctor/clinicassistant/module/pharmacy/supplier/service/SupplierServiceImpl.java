package com.littledoctor.clinicassistant.module.pharmacy.supplier.service;

import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.module.pharmacy.supplier.dao.SupplierRepository;
import com.littledoctor.clinicassistant.module.pharmacy.supplier.entity.Supplier;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 12:58
 * @Description: 供应商
 */
@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    /**
     * 查询所有供应商
     * @return
     */
    @Override
    public List<Supplier> findAll() throws Exception {
        return supplierRepository.findAll();
    }

    /**
     * 保存供应商
     * @param supplier
     * @return
     */
    @Override
    public Supplier save(Supplier supplier) throws Exception {
        return supplierRepository.saveAndFlush(supplier);
    }

    /**
     * 删除供应商
     * @param supplierId
     * @return
     */
    @Override
    public boolean delete(String supplierId) throws Exception {
        if (StringUtils.isNotBlank(supplierId)) {
            supplierRepository.deleteById(Integer.parseInt(supplierId));
            return true;
        }
        return false;
    }

    /**
     * 获取select option list
     * @return
     */
    @Override
    public List<SelectOption> getSelectOption() throws Exception {
        return supplierRepository.getSelectOption();
    }

    /**
     * 根据ID查询供应商
     * @return
     * @throws Exception
     * @param supplierId
     */
    @Override
    public Supplier findById(String supplierId) throws Exception {
        if (StringUtils.isNotBlank(supplierId)) {
            return supplierRepository.findById(Integer.parseInt(supplierId)).get();
        }
        return null;
    }
}
