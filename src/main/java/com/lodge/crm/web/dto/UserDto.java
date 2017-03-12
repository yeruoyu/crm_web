package com.lodge.crm.web.dto;

import java.io.Serializable;
import java.util.List;

public class UserDto implements Serializable {

	private static final long serialVersionUID = -8933391664993430978L;
	
	private String userCode;
	
	private String userName;
	
	private String userPassword;
	
	private String userPhone;
	
	private String userMobile;
	
	private String userAddress;
	
	private String userEmail;
	
	private String userQq;
	
	private String userWebchat;
	
	private Integer userStatus;
	
	private Integer subScheduleFlag;
	
	private List<SchoolDto> schoolList;
	
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

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public String getUserWebchat() {
		return userWebchat;
	}

	public void setUserWebchat(String userWebchat) {
		this.userWebchat = userWebchat;
	}

	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	public List<SchoolDto> getSchoolList() {
		return schoolList;
	}

	public void setSchoolList(List<SchoolDto> schoolList) {
		this.schoolList = schoolList;
	}

	public Integer getSubScheduleFlag() {
		return subScheduleFlag;
	}

	public void setSubScheduleFlag(Integer subScheduleFlag) {
		this.subScheduleFlag = subScheduleFlag;
	}
}
