package com.pubmed.medicine.model;

import java.io.Serializable;

/**
 * Created by guofei on 16/1/21.
 */
public class HostNumber implements Serializable {

    private int id;
    private String hostNumber;//转接号
    private String realNumber;
    private int type;  //类型
    private String model;   //所属模块
    private int status;  //状态
    private String remark;   //来源

	public String getHostNumber() {
        return hostNumber;
    }

    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
    
    public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRealNumber() {
        return realNumber;
    }

    public void setRealNumber(String realNumber) {
        this.realNumber = realNumber;
    }
}
