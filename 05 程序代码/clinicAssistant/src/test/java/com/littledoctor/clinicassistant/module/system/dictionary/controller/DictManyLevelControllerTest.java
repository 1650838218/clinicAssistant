package com.littledoctor.clinicassistant.module.system.dictionary.controller;

import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelItem;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictManyLevelType;
import com.littledoctor.clinicassistant.module.system.dictionary.entity.DictionaryItem;
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

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2019-04-21 20:47
 * @Description:
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class DictManyLevelControllerTest {

    @Autowired
    private MockMvc mockMvc;

    private String root = "/system/dictionary/manyLevel";

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Test
    public void selectAllLazy() {
        try {
            String result = mockMvc.perform(MockMvcRequestBuilders.get(root + "/selectAllLazy"))     //伪造的mvc执行get请求
//                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
//                    .param("dictionaryId", "63"))
                    .andExpect(MockMvcResultMatchers.status().isOk())    //执行了get请求后，期望返回的状态码
                    //.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3))       //期望发挥的数据长度(jsonpath)
                    .andReturn().getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void save() {
        try {
            DictManyLevelType dmlt = new DictManyLevelType();
//            dmlt.setDictTypeId(117);
            dmlt.setDictTypeKey("FJLX");
            dmlt.setDictTypeName("方剂类型");
            dmlt.setManyLevelNodeList(new ArrayList<>());

            DictManyLevelItem dmln1 = new DictManyLevelItem();
//            dmln1.setDictItemId(118);
            dmln1.setNodeId("1|");
            dmln1.setNodeName("解表剂");
            dmln1.setParentNodeId("0");
            dmln1.setSequenceNumber(1);

            DictManyLevelItem dmln2 = new DictManyLevelItem();
//            dmln2.setDictItemId(119);
            dmln2.setNodeId("1|1|");
            dmln2.setNodeName("辛温解表");
            dmln2.setParentNodeId("1|");
            dmln2.setSequenceNumber(1);

            DictManyLevelItem dmln3 = new DictManyLevelItem();
//            dmln3.setDictItemId(120);
            dmln3.setNodeId("1|2|");
            dmln3.setNodeName("辛凉解表");
            dmln3.setParentNodeId("1|");
            dmln3.setSequenceNumber(2);

            DictManyLevelItem dmln4 = new DictManyLevelItem();
//            dmln4.setDictItemId(127);
            dmln4.setNodeId("1|3|");
            dmln4.setNodeName("扶正解表");
            dmln4.setParentNodeId("1|");
            dmln4.setSequenceNumber(3);

            dmlt.getManyLevelNodeList().add(dmln1);
            dmlt.getManyLevelNodeList().add(dmln2);
            dmlt.getManyLevelNodeList().add(dmln3);
            dmlt.getManyLevelNodeList().add(dmln4);
            String result = mockMvc.perform(MockMvcRequestBuilders.post(root + "/save")     //伪造的mvc执行get请求
                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
                    .content(JSONObject.fromObject(dmlt).toString()))
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
        try {
            String result = mockMvc.perform(MockMvcRequestBuilders.delete(root + "/delete/117"))     //伪造的mvc执行get请求
//                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
//                    .content(JSONObject.fromObject(dmlt).toString())
//                    .param("dictTypeId","117"))
                    .andExpect(MockMvcResultMatchers.status().isOk())    //执行了get请求后，期望返回的状态码
                    //.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3))       //期望发挥的数据长度(jsonpath)
                    .andReturn().getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getById() {
        try {
            String result = mockMvc.perform(MockMvcRequestBuilders.get(root + "/getById")    //伪造的mvc执行get请求
//                    .contentType(MediaType.APPLICATION_JSON_UTF8)//Restful风格添加contentType
//                    .content(JSONObject.fromObject(dmlt).toString())
                    .param("dictTypeId","129"))
                    .andExpect(MockMvcResultMatchers.status().isOk())    //执行了get请求后，期望返回的状态码
                    //.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3))       //期望发挥的数据长度(jsonpath)
                    .andReturn().getResponse().getContentAsString();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}