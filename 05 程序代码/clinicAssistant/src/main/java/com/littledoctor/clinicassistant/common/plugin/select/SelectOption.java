package com.littledoctor.clinicassistant.common.plugin.select;

/**
 * @Auther: 周俊林
 * @Date: 2019-05-04 13:50
 * @Description:
 */
public class SelectOption {

    private Object realValue;

    private String displayValue;

    public SelectOption() {
    }

    public SelectOption(Object realValue, String displayValue) {
        this.realValue = realValue;
        this.displayValue = displayValue;
    }

    public Object getRealValue() {
        return realValue;
    }

    public void setRealValue(Object realValue) {
        this.realValue = realValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }

    public void setDisplayValue(String displayValue) {
        this.displayValue = displayValue;
    }
}
