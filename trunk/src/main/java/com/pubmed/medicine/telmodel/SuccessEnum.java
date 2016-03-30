package com.pubmed.medicine.telmodel;

/**
 * Created by PC-S510 on 2014/7/14.
 */
public enum SuccessEnum {
    BILL_SUCCESS("话单创建成功");

    private final String msg;
    private SuccessEnum(String msg){
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }
}
