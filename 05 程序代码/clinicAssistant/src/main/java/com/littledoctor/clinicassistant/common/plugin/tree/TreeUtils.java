package com.littledoctor.clinicassistant.common.plugin.tree;

import com.littledoctor.clinicassistant.common.constant.Constant;
import com.littledoctor.clinicassistant.module.system.menu.entity.Menu;
import org.springframework.util.CollectionUtils;

import javax.validation.constraints.Max;
import java.util.ArrayList;
import java.util.List;

/**
 * @业务信息:
 * @Filename: TreeUtils.java
 * @Description:
 * @Create Message:
 * Date         Author   Version   Description
 * ------------------------------------------------------------------
 * 2019-04-04   周俊林
 * @Modification History:
 * Date         Author   Version   Description
 * ------------------------------------------------------------------
 * 2019-04-04   周俊林
 */
public class TreeUtils {

    /**
     *
     * @param source
     * @return
     */
    public static List<TreeEntity> listToTree(List<TreeEntity> source) {
        List<TreeEntity> result = new ArrayList<>();
        if (!CollectionUtils.isEmpty(source)) {
            for (TreeEntity treeEntity : source) {
                if (treeEntity.getpId() == Constant.ROOT_NODE_ID) {// 根节点
                    result.add(treeEntity);
                }
                // 找每个节点的子节点
                for (TreeEntity it : source) {
                    /*1. Integer 类型的值在[-128,127] 期间,Integer 用 “==”是可以的   ， Integer  与 int 类型比较（==）比较的是值。
                      2. 如果要比较Integer的值，比较靠谱的是通过Integer.intValue();这样出来的就是int值，就可以直接比较了；或者equals()比较*/
                    if (it.getpId().equals(treeEntity.getId())) {
                        if (treeEntity.getChildren() == null) {
                            treeEntity.setChildren(new ArrayList<>());
                        }
                        treeEntity.getChildren().add(it);
                    }
                }
            }
        }
        return result;
    }
}
