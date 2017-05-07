package com.bxj.model;

/**
 * Created by dukang on 2016/1/12.
 */
public class ValueObject {

    private Object id;
    private Object value;

    private Object result;

    public Object getId() {
        return id;
    }

    public void setId(Object id) {
        this.id = id;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
