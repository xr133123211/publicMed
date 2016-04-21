package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Date;


public class TempAccess implements Serializable {

    private long id;
    private String name;
    private long access_id;
    private Date authDate;
    private int  type;
    private String phone;

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
}
