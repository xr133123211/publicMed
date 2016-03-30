package com.pubmed.medicine.telmodel;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 获取客户端获取号码的数据结构
 * User: kuang
 * Date: 13-9-20
 * Time: 下午5:19
 */
@XmlRootElement(name = "info")
public class GetPhoneResult implements XmlResult {

    private int extId;
    private String phone;
    private String hostNumber;

    public GetPhoneResult() {}

    public GetPhoneResult(int extId, String phone, String hostNumber) {
        this.extId = extId;
        this.phone = phone;
        this.hostNumber = hostNumber;
    }

    public int getExtId() {
        return extId;
    }

    public void setExtId(int extId) {
        this.extId = extId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHostNumber() {
        return hostNumber;
    }

    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }
}
