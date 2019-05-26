package com.littledoctor.clinicassistant.module.pharmacy.supplier.controller;

import com.littledoctor.clinicassistant.common.msg.Message;
import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.module.pharmacy.supplier.entity.Supplier;
import com.littledoctor.clinicassistant.module.pharmacy.supplier.service.SupplierService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 12:56
 * @Description: 供应商
 */
@RestController
@RequestMapping(value = "/pharmacy/supplier")
public class SupplierController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SupplierService supplierService;

    /**
     * 查询所有的供货商
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public LayuiTableEntity<Supplier> findAll() {
        try {
            return new LayuiTableEntity<Supplier>(supplierService.findAll());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 保存供货商
     * @param supplier
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Supplier save(@RequestBody Supplier supplier) {
        try {
            Assert.notNull(supplier, Message.PARAMETER_IS_NULL);
            return supplierService.save(supplier);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 删除供应商
     * @param supplierId
     * @return
     */
    @RequestMapping(value = "/delete/{supplierId}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable("supplierId") String supplierId) {
        try {
            Assert.notNull(supplierId, Message.PARAMETER_IS_NULL);
            return supplierService.delete(supplierId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 根据ID查询供应商
     * @param supplierId
     * @return
     */
    @RequestMapping(value = "/findById", method = RequestMethod.GET)
    public Supplier findById(String supplierId) {
        try {
            Assert.notNull(supplierId, Message.PARAMETER_IS_NULL);
            return supplierService.findById(supplierId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 获取下拉框的option list
     * @return
     */
    @RequestMapping(value = "/getSelectOption", method = RequestMethod.GET)
    public List<SelectOption> getSelectOption() {
        try {
            return supplierService.getSelectOption();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }
}
