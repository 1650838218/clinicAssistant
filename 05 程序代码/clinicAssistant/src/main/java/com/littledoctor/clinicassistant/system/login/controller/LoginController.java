package com.littledoctor.clinicassistant.system.login.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/7 18:32
 * @Description: 登录 注销 控制类
 */
@RestController
public class LoginController {

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/gotoLogin", method = RequestMethod.GET)
    public ModelAndView gotoLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    /**
     * 登录方法
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }

    /**
     * 跳转到主页的方法
     * @return
     */
    @RequestMapping(value = "/gotoIndex", method = RequestMethod.GET)
    public ModelAndView gotoIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }
}
