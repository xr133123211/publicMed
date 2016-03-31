package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Date;


public class Auth implements Serializable {

    private long id;
    private long user_id;
    private long org_id;
    private Date trustDate;
    private int  weight;
    private int  status;
    private int  type;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public long getOrg_id() {
        return org_id;
    }

    public void setOrg_id(long org_id) {
        this.org_id = org_id;
    }

    public Date getTrustDate() {
        return trustDate;
    }

    public void setTrustDate(Date trustDate) {
        this.trustDate = trustDate;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
