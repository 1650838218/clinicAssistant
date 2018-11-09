package com.littledoctor.clinicassistant.module.cases.controller;

import com.littledoctor.clinicassistant.module.base.Entity.Operator;
import com.littledoctor.clinicassistant.module.base.Entity.QueryParam;
import com.littledoctor.clinicassistant.module.base.controller.BaseController;
import com.littledoctor.clinicassistant.module.cases.entity.CasesPeople;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/9
 * @Description: 病历--患者
 */
@RestController
@RequestMapping(value = "/casesPeople")
public class CasesPeopleController extends BaseController<CasesPeople> {

    @Override
    protected List<QueryParam> toQueryParam(Map<String, Object> queryParamMap) {
        if (queryParamMap == null || queryParamMap.size() == 0) return null;
        List<QueryParam> queryParamList = new ArrayList<>();
        for (Map.Entry entry: queryParamMap.entrySet()) {
            if (!StringUtils.isEmpty(entry.getKey())) {
                QueryParam queryParam = new QueryParam();
                queryParam.setKey(entry.getKey().toString());
                queryParam.setValue(entry.getValue().toString());
                queryParam.setOperator(Operator.LIKE);
                queryParamList.add(queryParam);
            }
        }
        return queryParamList;
    }
}
