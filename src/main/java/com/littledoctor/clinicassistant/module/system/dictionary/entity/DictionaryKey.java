package com.littledoctor.clinicassistant.module.system.dictionary.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * @Auther: 周俊林
 * @Date: 2018/11/2
 * @Description: 数据字典  联合主键
 */
@Embeddable
public class DictionaryKey implements Serializable {

    /** 类型编码 eg：sex */
    @Column(name = "CODE", nullable = false, length = 20)
    private String code;

    /** 字典值 */
    @Column(name = "VALUE", nullable = false, length = 10)
    private String value;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj){
            return true;
        }
        if(obj == null){
            return false;
        }
        if(getClass() != obj.getClass()){
            return false;
        }

        final DictionaryKey other = (DictionaryKey)obj;
        if(code == null){
            if(other.code != null){
                return false;
            }
        }else if(!code.equals(other.code)){
            return false;
        }
        if(value == null){
            if(other.value != null){
                return false;
            }
        }else if(!value.equals(other.value)){
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((code == null) ? 0 : code.hashCode());
        result = PRIME * result + ((value == null) ? 0 : value.hashCode());
        return result;
    }
}
