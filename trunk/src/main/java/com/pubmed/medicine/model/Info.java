package com.pubmed.medicine.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by guofei on 16/1/21.
 */
public class Info implements Serializable {


    private long id;
    private long userId;
    private Integer typeId;
    private String title;
    private String content;
    private Date updateTime;

    //ext
    private String categoryName;
    private String username;
    private int categoryId;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return categoryName+"病历";
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getCategoryId() {
        return typeId;
    }

    public void setCategoryId(int categoryId) {
        this.typeId = categoryId;
    }
}
