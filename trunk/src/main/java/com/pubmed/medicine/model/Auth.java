package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;


public class Auth implements Serializable {


    private long id;
    private long user_id;
    private long org_id;
    private Date trustDate;
    private int  weight;
    private int  status;
    private int  type;
    private int tempStatus;
    private Date tempDate;


    private String categoryName;
    private String orgName;
    private String userName;
    private String authStatus;
    private String voteType;
    private float shold;


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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getAuthStatus() {
        if(status==0) return "未获取审批";
        else if(status==1&&weight==0) return "用户不允许";
        else if(status==1&&weight>0) return"可访问";
        else if(status==2) return "临时访问";
        else return "不可访问";
    }

    public void setAuthStatus(String authStatus) {
        this.authStatus = authStatus;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getVoteType() {
        if(getTempStatus()==1) return "申请通过";
        else if(getTempStatus()==3) return "申请过期";
        else if(getTempStatus()==2) return "申请拒绝";
        else return "申请中";

    }

    public void setVoteType(String voteType) {
        this.voteType = voteType;
    }

    public float getShold() {
        return shold;
    }

    public void setShold(float shold) {
        this.shold = shold;
    }

    public int getTempStatus() {
        Calendar lastDate = Calendar.getInstance();
        lastDate.add(Calendar.DAY_OF_MONTH,-1);
        Date lastDay = lastDate.getTime();
        if(tempDate!=null&&tempDate.before(lastDay)&&tempStatus==1) return 3;//-1未申请 0:申请中 1:申请通过 2:申请拒绝 3:申请过期
        else return tempStatus;
    }

    public void setTempStatus(int tempStatus) {
        this.tempStatus = tempStatus;
    }

    public Date getTempDate() {
        return tempDate;
    }

    public void setTempDate(Date tempDate) {
        this.tempDate = tempDate;
    }
}
