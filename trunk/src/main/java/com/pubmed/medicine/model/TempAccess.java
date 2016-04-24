package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;


public class TempAccess implements Serializable {

    private long id;
    private String name;
    private long access_id;
    private Date authDate;
    private int  type;
    private String phone;
    private int status;
    private String detail;

    public TempAccess() {
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getAccess_id() {
        return access_id;
    }

    public void setAccess_id(long access_id) {
        this.access_id = access_id;
    }

    public Date getAuthDate() {
        return authDate;
    }

    public void setAuthDate(Date authDate) {
        this.authDate = authDate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        Calendar lastDate = Calendar.getInstance();
        lastDate.add(Calendar.DAY_OF_MONTH,-1);
        Date lastDay = lastDate.getTime();
        if(authDate.before(lastDay)&&status==1) return 3;//-1未申请 0:申请中 1:申请通过 2:申请拒绝 3:申请过期
        else return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
