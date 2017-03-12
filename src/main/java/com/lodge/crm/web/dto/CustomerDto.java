package com.lodge.crm.web.dto;

import java.io.Serializable;

public class CustomerDto  implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String customerCode;
	
	private String customerName;
	
	private Integer customerLevel;

	private Integer customerStatus;
	
	private String customerMobile;
	
	private String customerComments;
	
	private String channelCode;
	
	private String groupCode;
	
	private String userCode;
	
	private String userName;
	
	private String phone;
	
	private String mobile;
	
	private Integer customerLocked;
	
	private Integer customerCourse;


	public String getCustomerMobile() {
		return customerMobile;
	}

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
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

	public Integer getCustomerLevel() {
		return customerLevel;
	}

	public void setCustomerLevel(Integer customerLevel) {
		this.customerLevel = customerLevel;
	}

	public Integer getCustomerStatus() {
		return customerStatus;
	}

	public void setCustomerStatus(Integer customerStatus) {
		this.customerStatus = customerStatus;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getChannelCode() {
		return channelCode;
	}

	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public Integer getCustomerLocked() {
		return customerLocked;
	}

	public void setCustomerLocked(Integer customerLocked) {
		this.customerLocked = customerLocked;
	}

	public String getCustomerComments() {
		return customerComments;
	}

	public void setCustomerComments(String customerComments) {
		this.customerComments = customerComments;
	}

	public Integer getCustomerCourse() {
		return customerCourse;
	}

	public void setCustomerCourse(Integer customerCourse) {
		this.customerCourse = customerCourse;
	}
}
