package com.pubmed.medicine.model;

import java.util.Date;

/**
 * Created by guofei on 16/1/21.
 */
public class Vote  {
    private int id;
    private long accessId;
    private long userId;
    private int votePoint;
    private int status;
    private Date authDate;

    private String voteName;
    private String orgName;
    private String userName;
    private String categoryName;
    private String voteStatus;
    private int voteMax;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getAuthDate() {
        return authDate;
    }

    public void setAuthDate(Date authDate) {
        this.authDate = authDate;
    }

    public int getVotePoint() {
        if(status==0) return 0;
        else return votePoint;
    }

    public void setVotePoint(int votePoint) {
        this.votePoint = votePoint;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getAccessId() {
        return accessId;
    }

    public void setAccessId(long accessId) {
        this.accessId = accessId;
    }

    public String getVoteName() {
        return voteName;
    }

    public void setVoteName(String voteName) {
        this.voteName = voteName;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVoteMax() {
        return voteMax;
    }

    public void setVoteMax(int voteMax) {
        this.voteMax = voteMax;
    }

    public String getVoteStatus() {
        if(status==0) return "未投票";
        else return "已投票";
    }

    public void setVoteStatus(String voteStatus) {
        this.voteStatus = voteStatus;
    }
}
