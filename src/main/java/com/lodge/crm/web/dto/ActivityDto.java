package com.lodge.crm.web.dto;

import java.io.Serializable;

public class ActivityDto implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String activityCode;
	
	private String activityTitle;
	
	private String activityDesc;
	
	private String activityAddress;
	
	private String activityStartDate;
	
	private String activityStopDate;
	
	private String activityStartTime;
	
	private String activityStopTime;
	
	private int activityAccount;
	
	private int activityStatus;

	public String getActivityCode() {
		return activityCode;
	}

	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}

	public String getActivityTitle() {
		return activityTitle;
	}

	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}

	public String getActivityDesc() {
		return activityDesc;
	}

	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}

	public String getActivityAddress() {
		return activityAddress;
	}

	public void setActivityAddress(String activityAddress) {
		this.activityAddress = activityAddress;
	}

	public String getActivityStartDate() {
		return activityStartDate;
	}

	public void setActivityStartDate(String activityStartDate) {
		this.activityStartDate = activityStartDate;
	}

	public String getActivityStopDate() {
		return activityStopDate;
	}

	public void setActivityStopDate(String activityStopDate) {
		this.activityStopDate = activityStopDate;
	}

	public String getActivityStartTime() {
		return activityStartTime;
	}

	public void setActivityStartTime(String activityStartTime) {
		this.activityStartTime = activityStartTime;
	}

	public String getActivityStopTime() {
		return activityStopTime;
	}

	public void setActivityStopTime(String activityStopTime) {
		this.activityStopTime = activityStopTime;
	}

	public int getActivityAccount() {
		return activityAccount;
	}

	public void setActivityAccount(int activityAccount) {
		this.activityAccount = activityAccount;
	}

	public int getActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(int activityStatus) {
		this.activityStatus = activityStatus;
	}
}
