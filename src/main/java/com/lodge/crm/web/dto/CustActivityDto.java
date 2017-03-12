package com.lodge.crm.web.dto;

import java.io.Serializable;


public class CustActivityDto implements Serializable {

	private static final long serialVersionUID = -7987732853114456789L;

	private Long caId;

	private Integer AttendStatus;

	private String comments;
	
	private String customerCode;
	
	private String customerName;

	private String activityCode;
	
	private String activityTitle;
	
	private String activityAddress;
	
	private String activityStartDate;

	private String activityStopDate;

	private int activityStatus;

	public Long getCaId() {
		return caId;
	}

	public void setCaId(Long caId) {
		this.caId = caId;
	}

	public Integer getAttendStatus() {
		return AttendStatus;
	}

	public void setAttendStatus(Integer attendStatus) {
		AttendStatus = attendStatus;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


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

	public int getActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(int activityStatus) {
		this.activityStatus = activityStatus;
	}
}
