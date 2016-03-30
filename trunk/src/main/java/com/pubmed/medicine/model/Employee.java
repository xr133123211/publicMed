package com.pubmed.medicine.model;

public class Employee {

	private int userCode;
	private String userName;
	private String userTitle;
	private String joinDate;
	private String newJoinDate;
	private String positionName;
	private Integer positionId;
	private Integer orgId;
	private String orgName;
	private String mobilePhone;
	private String customizedPhone;   //定制机
	private String status;
	private String orgClass;
	
	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgClass() {
		return orgClass;
	}

	public void setOrgClass(String orgClass) {
		this.orgClass = orgClass;
	}

	public int getUserCode() {
		return userCode;
	}
	
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserTitle() {
		return userTitle;
	}
	
	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
	
	public String getJoinDate() {
		return joinDate;
	}
	
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	public String getNewJoinDate() {
		return newJoinDate;
	}
	
	public void setNewJoinDate(String newJoinDate) {
		this.newJoinDate = newJoinDate;
	}
	
	public String getPositionName() {
		return positionName;
	}
	
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	public Integer getPositionId() {
		return positionId;
	}
	
	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}
	
	public String getMobilePhone() {
		return mobilePhone;
	}
	
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	
	public String getCustomizedPhone() {
		return customizedPhone;
	}
	
	public void setCustomizedPhone(String customizedPhone) {
		this.customizedPhone = customizedPhone;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
}
