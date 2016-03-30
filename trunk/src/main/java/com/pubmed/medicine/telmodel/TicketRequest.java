package com.pubmed.medicine.telmodel;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by IntelliJ IDEA.
 * User: kuang
 * Date: 13-9-21
 * Time: 下午5:13
 */
@XmlRootElement(name = "info")
public class TicketRequest implements XmlResult{
    private String extId;
    private String hostNumber;
    private String phoneCome;
    private String phoneGo;
    private String startTime;
    private String finishTime;
    private String keepTime;
    private String isReceive;
    private String recordFile;

    public String getExtId() {
        return extId;
    }

    public void setExtId(String extId) {
        this.extId = extId;
    }

    public String getHostNumber() {
        return hostNumber;
    }

    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }

    public String getPhoneCome() {
        return phoneCome;
    }

    public void setPhoneCome(String phoneCome) {
        this.phoneCome = phoneCome;
    }

    public String getPhoneGo() {
        return phoneGo;
    }

    public void setPhoneGo(String phoneGo) {
        this.phoneGo = phoneGo;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public String getKeepTime() {
        return keepTime;
    }

    public void setKeepTime(String keepTime) {
        this.keepTime = keepTime;
    }

    public String getIsReceive() {
        return isReceive;
    }

    public void setIsReceive(String receive) {
        isReceive = receive;
    }

    public String getRecordFile() {
        return recordFile;
    }

    public void setRecordFile(String recordFile) {
        this.recordFile = recordFile;
    }

    @Override
    public String toString() {
        return "TicketRequest{" +
                "extId='" + extId + '\'' +
                ", hostNumber='" + hostNumber + '\'' +
                ", phoneCome='" + phoneCome + '\'' +
                ", phoneGo='" + phoneGo + '\'' +
                ", startTime='" + startTime + '\'' +
                ", finishTime='" + finishTime + '\'' +
                ", keepTime='" + keepTime + '\'' +
                ", isReceive='" + isReceive + '\'' +
                ", recordFile='" + recordFile + '\'' +
                '}';
    }
}
