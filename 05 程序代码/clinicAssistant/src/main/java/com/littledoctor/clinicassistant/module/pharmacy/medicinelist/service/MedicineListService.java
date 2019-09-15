package com.littledoctor.clinicassistant.module.pharmacy.medicinelist.service;

import com.littledoctor.clinicassistant.common.plugin.select.SelectOption;
import com.littledoctor.clinicassistant.module.pharmacy.medicinelist.entity.MedicineList;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/19 22:48
 * @Description: 药材清单，进货时从此清单中选取
 */
public interface MedicineListService {
    /**
     * 分页查询
     *
     * @param keywords 查询条件 药品名称/全拼/简拼/条形码
     * @param page
     * @return
     */
    Page<MedicineList> queryPage(String keywords, Pageable page);

    /**
     * 保存
     * @param medicineList
     * @return
     */
    MedicineList save(MedicineList medicineList);

    /**
     * 根据ID删除
     * @param medicineListId
     * @return
     */
    boolean delete(String medicineListId);

    /**
     * 根据ID查询
     * @param medicineListId
     * @return
     */
    MedicineList getById(String medicineListId);

    /**
     * 判断条形码是否不重复，是否不存在
     *
     * @param midicineListId
     * @param barcode
     * @return true 不存在  false 已存在，默认false
     */
    boolean notRepeatBarcode(String midicineListId, String barcode);

    /**
     * 判断药品名称是否不重复，是否不存在
     *
     * @param midicineListId
     * @param midicineName
     * @return true 不存在  false 已存在，默认false
     */
    boolean notRepeatName(String midicineListId, String midicineName);

    /**
     * 根据名称查询药品清单
     * @param name 可以是药品名称，药品全拼，药品简拼
     * @return
     */
    List<MedicineList> queryByName(String name);

    /**
     * 获取下拉框的option list
     * @return
     */
    List<SelectOption> getSelectOption() throws Exception;
}
