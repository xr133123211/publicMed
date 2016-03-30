package com.pubmed.medicine.model;

import com.pubmed.common.util.DateUtil;
import com.pubmed.medicine.telmodel.TicketRequest;
import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by PC-S510 on 2014/7/7.
 */
@Alias("callBill")
public class CallBill implements Serializable {

    private static final long serialVersionUID = 3768565395396915934L;

    private int id; //主键标识
    private int extId;	//分机号	系统号码标识
    private String hostNumber; //主机号
    private String phoneCome;	//来电（主叫）
    private String phoneGo;	//去电（被叫）
    private Date startTime;//	通话开始时间
    private Date finishTime;	//通话结束时间
    private int keepTime;	//通话时长
    private int isReceive;	//是否接通
    private String recordFile;	//录音文件名	分机号_时间精确到毫秒.wav




	private Integer userCode;   //经纪人工号

    /**
     * 获取 主键标识
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     * 设置 主键标识
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * 获取 分机号
     * @return
     */
    public int getExtId() {
        return extId;
    }

    /**
     * 设置 分机号
     * @param extId
     */
    public void setExtId(int extId) {
        this.extId = extId;
    }

    /**
     * 获取 主机号
     * @return
     */
    public String getHostNumber() {
        return hostNumber;
    }

    /**
     * 设置 分机号
     * @param hostNumber
     */
    public void setHostNumber(String hostNumber) {
        this.hostNumber = hostNumber;
    }

    /**
     * 获取 来电（主叫）
     * @return
     */
    public String getPhoneCome() {
        return phoneCome;
    }

    /**
     * 设置 来电（主叫）
     * @param phoneCome
     */
    public void setPhoneCome(String phoneCome) {
        this.phoneCome = phoneCome;
    }

    /**
     * 获取 去电（被叫）
     * @return
     */
    public String getPhoneGo() {
        return phoneGo;
    }

    /**
     * 设置 去电（被叫）
     * @param phoneGo
     */
    public void setPhoneGo(String phoneGo) {
        this.phoneGo = phoneGo;
    }

    /**
     * 获取 通话开始时间
     * @return
     */
    public Date getStartTime() {
        return startTime;
    }

    /**
     * 设置 通话开始时间
     * @param startTime
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取 通话结束时间
     * @return
     */
    public Date getFinishTime() {
        return finishTime;
    }

    /**
     * 设置 通话结束时间
     * @param finishTime
     */
    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    /**
     * 获取 通话时长
     * @return
     */
    public int getKeepTime() {
        return keepTime;
    }

    /**
     * 设置 通话时长
     * @param keepTime
     */
    public void setKeepTime(int keepTime) {
        this.keepTime = keepTime;
    }

    /**
     * 获取 是否接通
     * @return
     */
    public int getIsReceive() {
        return isReceive;
    }

    /**
     * 设置 是否接通
     * @param isReceive
     */
    public void setIsReceive(int isReceive) {
        this.isReceive = isReceive;
    }

    /**
     * 获取 录音文件名
     * @return
     */
    public String getRecordFile() {
        return recordFile;
    }

    /**
     * 设置 录音文件名
     * @param recordFile
     */
    public void setRecordFile(String recordFile) {
        this.recordFile = recordFile;
    }

    public CallBill(TicketRequest ticketRequest){
        this.extId = Integer.parseInt(ticketRequest.getExtId());
        this.hostNumber = ticketRequest.getHostNumber();
        this.phoneCome = ticketRequest.getPhoneCome();
        this.phoneGo = ticketRequest.getPhoneGo();
        this.startTime = DateUtil.parse(ticketRequest.getStartTime()).toDate();
        this.finishTime = DateUtil.parse(ticketRequest.getFinishTime()).toDate();
        this.keepTime = Integer.parseInt(ticketRequest.getKeepTime());
        this.isReceive = Integer.parseInt(ticketRequest.getIsReceive());
        this.recordFile = ticketRequest.getRecordFile();
    }

	public Integer getUserCode() {
		return userCode;
	}

	public void setUserCode(Integer userCode) {
		this.userCode = userCode;
	}

	public CallBill() {
	}

	@Override
    public String toString() {
        return "CallBill{" +
                "extId=" + extId +
                ", houseNumber=" + hostNumber +
                ", phoneCome='" + phoneCome + '\'' +
                ", phoneGo='" + phoneGo + '\'' +
                ", startTime=" + startTime +
                ", finishTime=" + finishTime +
                ", keepTime=" + keepTime +
                ", isReceive=" + isReceive +
                ", recordFile='" + recordFile + '\'' +
                '}';
    }
}
