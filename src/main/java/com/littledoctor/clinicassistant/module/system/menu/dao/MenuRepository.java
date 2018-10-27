package com.littledoctor.clinicassistant.module.system.menu.dao;

import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Auther: 周俊林
 * @Date: 2018/10/16 20:34
 * @Description: 系统管理--菜单管理 dao
 */
public interface MenuRepository extends JpaRepository<Menu,Long> {
}
