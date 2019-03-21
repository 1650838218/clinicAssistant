package com.littledoctor.clinicassistant.index.controller;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/13 20:48
 * @Description: 导航栏控制类
 */
@RestController
@RequestMapping(value = "/index")
public class IndexController {

    /**
     * 根据传递的url进行页面跳转
     * @param url
     * @return
     */
    @RequestMapping(value = "/goto", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView gotoUrl(String url) {
        ModelAndView mv = new ModelAndView();
        if (!StringUtils.isEmpty(url.trim())) {
            mv.setViewName("/module/" + url + ".html");
        }
        return mv;
    }
}
