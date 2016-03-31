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
        return votePoint;
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
}
