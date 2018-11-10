package com.littledoctor.clinicassistant.module.base.service;

import com.littledoctor.clinicassistant.module.base.Entity.QueryParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/8
 * @Description: 基本服务接口
 */
public interface BaseService<E, ID> {
    /**
     * 保存
     * @param entity
     * @return
     */
    public E save(E entity);

    /**
     * 分页查询
     * @param queryParams
     * @param page
     * @return
     */
    public Page<E> queryPage(List<QueryParam> queryParams, Pageable page);
}
