package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryItem;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryType;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class DictionaryControllerTest {

    @Autowired
    private MockMvc mockMvc;

    private String root = "/system/dictionary";

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Test
    public void queryTree() {
    }

    @Test
    public void queryPage() {
    }

    @Test
    public void save() {
        try {
            DictionaryType dt = new DictionaryType();
            dt.setMenuName("菜单管理");
            dt.setMenuId(1);
            dt.setDictTypeKey("CDGL");
            dt.setDictTypeName("测试数据");
            dt.setDictTypeId(97);

            DictionaryItem di1 = new DictionaryItem();
            di1.setDictItemName("aaa");
            di1.setDictItemValue("2");
            di1.setIsUse(1);
            di1.setDictItemId(101);

            DictionaryItem di2 = new DictionaryItem();
            di2.setDictItemName("bbba");
            di2.setDictItemValue("3");
            di2.setIsUse(1);
            di2.setDictItemId(102);

            DictionaryItem di3 = new DictionaryItem();
            di3.setDictItemName("ccc");
            di3.setDictItemValue("4");
            di3.setIsUse(1);
//            di3.setDictItemId(103);

            List<DictionaryItem> diList = new ArrayList<>();
//            diList.add(di1);
            diList.add(di2);
            diList.add(di3);

            dt.setDictItem(diList);

            String result = mockMvc.perform(MockMvcRequestBuilders.post(root + "/save")     //伪造的mvc执行get请求
                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
                    .content(JSONObject.fromObject(dt).toString()))
                    .andExpect(MockMvcResultMatchers.status().isOk())    //执行了get请求后，期望返回的状态码
                    //.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3))       //期望发挥的数据长度(jsonpath)
                    .andReturn().getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void delete() {
    }

    @Test
    public void getById() {
        try {
            String result = mockMvc.perform(MockMvcRequestBuilders.get(root + "/getById")     //伪造的mvc执行get请求
//                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
                    .param("dictionaryId", "63"))
                    .andExpect(MockMvcResultMatchers.status().isOk())    //执行了get请求后，期望返回的状态码
                    //.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3))       //期望发挥的数据长度(jsonpath)
                    .andReturn().getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}