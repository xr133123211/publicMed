package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by guofei on 16/1/21.
 */
public class EmpExtNumber implements Serializable {

    private int extNumber;      //分机号
    private int userCode;       //工号
    private int status;

    private String phone;       //实际号码

	private Date updateTime;

    public int getExtNumber() {
        return extNumber;
    }

    public void setExtNumber(int extNumber) {
        this.extNumber = extNumber;
    }

    public int getUserCode() {
        return userCode;
    }

    public void setUserCode(int userCode) {
        this.userCode = userCode;
    }
    
    public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
