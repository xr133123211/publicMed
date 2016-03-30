package com.pubmed.medicine.telmodel;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 成功数据结构
 * User: kuang
 * Date: 13-9-21
 * Time: 下午2:14
 */
@XmlRootElement(name = "info")
public class OkResult implements XmlResult {

    private String extId;
    private String hostNumber;
    private String msg;

    public OkResult() {}

    public OkResult(String extId, String hostNumber, SuccessEnum su) {
        this.extId = extId;
        this.hostNumber = hostNumber;
        this.msg = su.getMsg();
    }

    public String getExtId() {
        return extId;
    }

    public void setExtId(String extId) {
        this.extId = extId;
    }

    public String getHostNumber() {
        return hostNumber;
    }

    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
