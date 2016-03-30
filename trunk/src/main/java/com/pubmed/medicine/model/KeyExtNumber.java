package com.pubmed.medicine.model;

/**
 * Created by guofei on 16/1/21.
 */
public class KeyExtNumber extends EmpExtNumber {

    private Integer id;
    private int hostId;  //转接号id
    private String key;     //对应key
    private String model;   //模块

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getHostId() {
        return hostId;
    }

    public void setHostId(int hostId) {
        this.hostId = hostId;
    }
}
