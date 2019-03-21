package com.littledoctor.clinicassistant.module.system.menu.service;

import com.littledoctor.clinicassistant.module.system.menu.dao.MenuRepository;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 20:36
 * @Description:  系统管理--菜单管理
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public void save(Menu menu) {
        menuRepository.saveAndFlush(menu);
    }

    @Override
    public List<Menu> queryTree() {
        return menuRepository.findAll(Sort.by("sort"));
    }
}
