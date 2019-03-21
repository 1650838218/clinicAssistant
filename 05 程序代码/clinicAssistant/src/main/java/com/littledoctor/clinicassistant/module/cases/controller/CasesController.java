package com.littledoctor.clinicassistant.module.cases.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/6 19:29
 * @Description: 病例
 */
@RestController
@RequestMapping("/cases")
public class CasesController {

    /**
     * 点击病例管理菜单，进入列表页面，列表显示患者的基本信息，以患者姓名为查询条件
     * 单击列表某一行，进入患者病例页面，页面分三部分，上部显示患者个人基本信息，左侧显示就诊日期列表，右侧显示病情，处方，跟踪，以tab页展示
     */
}
