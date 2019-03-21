package com.littledoctor.clinicassistant.module.prescription.prescribe.controller;

import com.littledoctor.clinicassistant.ClinicassistantApplicationTests;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/5
 * @Description:
 */
public class PrescribeControllerTest extends ClinicassistantApplicationTests {

    @Test
    public void save() throws Exception {
String str = "{id:4,disease.id: 2,disease.name: '心疼',name: '白头翁',abbreviation: 'BTW',type: 0,details: '人参13g,鹿茸12g,白术4g'}";

        MockHttpServletRequestBuilder mhsrb = MockMvcRequestBuilders.post("/save");
        mhsrb.content(str);
        MvcResult result = mockMvc.perform(mhsrb).andReturn();
        System.out.println(result.getResponse().getContentAsString());
//        MvcResult result = mockMvc.perform(post("/q1?address=合肥")
//                .content(JSONObject.toJSONString(map)))
//                .andExpect(status().isOk())// 模拟向testRest发送get请求
//                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))// 预期返回值的媒体类型text/plain;charset=UTF-8
//                .andReturn();// 返回执行请求的结果
//        System.out.println(result.getResponse().getContentAsString());
    }
}