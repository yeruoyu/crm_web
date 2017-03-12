package com.lodge.crm.web.dto;

import java.io.Serializable;

public class RecordDto implements Serializable{

	private static final long serialVersionUID = -4021636211051294502L;

	private Long recordId;
	
	private String recordType;
	
	private String recordTime;
	
	private String recordResult;
	
	private String recordComment;
	
	private String recordPhone;
	
	private String recordAddress;
	
	private String customerCode;
	
	private String customerName;
	
	private String recordName;
	
	private String userCode;
	
	private String userName;

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public String getRecordType() {
		return recordType;
	}

	public void setRecordType(String recordType) {
		this.recordType = recordType;
	}

	public String getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

	public String getRecordResult() {
		return recordResult;
	}

	public void setRecordResult(String recordResult) {
		this.recordResult = recordResult;
	}

	public String getRecordComment() {
		return recordComment;
	}

	public void setRecordComment(String recordComment) {
		this.recordComment = recordComment;
	}

	public String getRecordPhone() {
		return recordPhone;
	}

	public void setRecordPhone(String recordPhone) {
		this.recordPhone = recordPhone;
	}

	public String getRecordAddress() {
		return recordAddress;
	}

	public void setRecordAddress(String recordAddress) {
		this.recordAddress = recordAddress;
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

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRecordName() {
		return recordName;
	}

	public void setRecordName(String recordName) {
		this.recordName = recordName;
	}
	
	
}
