package com.littledoctor.clinicassistant.module.pharmacy.medicinelist.controller;

import com.littledoctor.clinicassistant.common.msg.Message;
import com.littledoctor.clinicassistant.common.plugin.layui.LayuiTableEntity;
import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.common.util.ControllerUtils;
import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.entity.MedicineList;
import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.service.MedicineListService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/18 22:31
 * @Description: 药材清单，进货时从此清单中选取
 */
@RestController
@RequestMapping(value = "/pharmacy/medicineList")
public class MedicineListController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MedicineListService medicineListService;

    /**
     * 分页查询
     * @param keywords 查询条件 药品名称/全拼/简拼/条形码
     * @param page
     * @return
     */
    @RequestMapping(value = "/queryPage")
    public LayuiTableEntity<MedicineList> queryPage(String keywords, Pageable page) {
        try {
            if (page.getPageNumber() != 0) page = PageRequest.of(page.getPageNumber() - 1, page.getPageSize());
            Page<MedicineList> result = medicineListService.queryPage(keywords,page);
            return new LayuiTableEntity<MedicineList>(result);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return new LayuiTableEntity<>();
    }

    /**
     * 保存
     * @param medicineList
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public MedicineList save(@RequestBody MedicineList medicineList) {
        try {
            Assert.notNull(medicineList, Message.PARAMETER_IS_NULL);
            return medicineListService.save(medicineList);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 根据ID删除
     * @param medicineListId
     * @return
     */
    @RequestMapping(value = "/delete/{medicineListId}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable(value = "medicineListId") String medicineListId) {
        try {
            Assert.hasLength(medicineListId, Message.PARAMETER_IS_NULL);
            return medicineListService.delete(medicineListId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 根据ID查询
     * @param medicineListId
     * @return
     */
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public MedicineList getById(@RequestParam String medicineListId) {
        try {
//            Assert.hasLength(medicineListId, Message.PARAMETER_IS_NULL);
            return medicineListService.getById(medicineListId);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 判断条形码是否不重复，是否不存在
     * @param midicineListId
     * @param barcode
     * @return true 不存在  false 已存在，默认false
     */
    @RequestMapping(value = "/notRepeatBarcode", method = RequestMethod.GET)
    public boolean notRepeatBarcode(String medicineListId, @RequestParam String barcode) {
        try {
//            Assert.hasLength(barcode, Message.PARAMETER_IS_NULL);
            return medicineListService.notRepeatBarcode(medicineListId, barcode);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 判断药品名称是否不重复，是否不存在
     * @param midicineListId
     * @param midicineName
     * @return true 不存在  false 已存在，默认false
     */
    @RequestMapping(value = "/notRepeatName", method = RequestMethod.GET)
    public boolean notRepeatName(String medicineListId, @RequestParam String medicineName) {
        try {
//            Assert.hasLength(midicineName, Message.PARAMETER_IS_NULL);
            return medicineListService.notRepeatName(medicineListId, medicineName);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return false;
    }

    /**
     * 根据名称查询药品清单
     * @param name 可以是药品名称，药品全拼，药品简拼
     * @return
     */
    @RequestMapping(value = "/queryByName", method = RequestMethod.GET)
    public List<MedicineList> queryByName(@RequestParam String name) {
        try {
//            Assert.hasLength(name, Message.PARAMETER_IS_NULL);
            return medicineListService.queryByName(name);
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
            return medicineListService.getSelectOption();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return new ArrayList<>();
    }
}
