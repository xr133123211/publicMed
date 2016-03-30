package com.pubmed.medicine.telmodel;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 错误结果对象
 * User: kuang
 * Date: 13-9-20
 * Time: 下午5:33
 */
@XmlRootElement(name = "error")
public class ErrorResult implements XmlResult {

    private int code;
    private String extId;
    private String msg;
    private String hostNumber;

    public ErrorResult() {
    }

    public ErrorResult(String extId, String hostNumber, ExceptionEnum ex) {
        this.code = ex.getValue();
        this.extId = extId;
        this.hostNumber = hostNumber;
        this.msg = ex.getReasonPhrase();
    }

    public ErrorResult(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getExtId() {
        return extId;
    }

    public void setExtId(String extId) {
        this.extId = extId;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getHostNumber() {
        return hostNumber;
    }

    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }
}
