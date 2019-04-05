package com.littledoctor.clinicassistant.common.util;

import com.littledoctor.clinicassistant.common.constant.Constant;
import org.apache.tomcat.util.bcel.Const;

import java.util.List;

/**
 * @业务信息:
 * @Filename: StringUtils.java
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
public class StringUtils extends org.apache.commons.lang.StringUtils {

    /**
     * 拼接sql in 条件
     * @param ids 数字字符串，以 regex 分隔；eg： 1,2,3
     * @param regex 字符串分隔符，默认，
     * @return
     */
/*    public static String sqlIn(String ids, String regex) {
        if (isBlank(ids)) return "";
        if (isBlank(regex)) regex = Constant.SPLIT_STR;
        String[] id = ids.split(regex);
    }*/
}
