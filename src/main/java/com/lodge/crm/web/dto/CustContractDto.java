package com.lodge.crm.web.dto;

import java.io.Serializable;

public class CustContractDto implements Serializable{
	
	private static final long serialVersionUID = 2457663123200602465L;

	private Long ccId;
	
	private String customerCode;
	
	private String customerName;

	private String contractCode;

	private String comments;

	private String signedTime;

	public Long getCcId() {
		return ccId;
	}

	public void setCcId(Long ccId) {
		this.ccId = ccId;
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

	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getSignedTime() {
		return signedTime;
	}

	public void setSignedTime(String signedTime) {
		this.signedTime = signedTime;
	}
}
