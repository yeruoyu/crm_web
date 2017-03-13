package com.lodge.crm.web.dto;

import java.io.Serializable;

public class GroupDto implements Serializable{

	private static final long serialVersionUID = 2208457373444508311L;

	private String groupCode;
	
	private String groupName;
	
	private Integer groupStatus;

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(Integer groupStatus) {
		this.groupStatus = groupStatus;
	}
}
