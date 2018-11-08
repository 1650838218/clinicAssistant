package com.littledoctor.clinicassistant.module.base.service;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 基本服务接口
 */
public interface BaseService<T> {
    /**
     * 保存
     * @param t
     * @return
     */
    public T save(T t);
}
