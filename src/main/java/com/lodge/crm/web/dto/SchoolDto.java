package com.lodge.crm.web.dto;

import java.io.Serializable;

public class SchoolDto implements Serializable{

	private static final long serialVersionUID = 2350693882833767451L;

	/** 学校Code */
	private String schoolCode;
	/** 学校名称 */
	private String schoolName;
	/** 学校简介 */
	private String schoolComments;
	
	private String schoolKeyword;
	
	/** 学校状态 */
	private Integer schoolStatus;

	public String getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolComments() {
		return schoolComments;
	}
	public void setSchoolComments(String schoolComments) {
		this.schoolComments = schoolComments;
	}
	public Integer getSchoolStatus() {
		return schoolStatus;
	}
	public void setSchoolStatus(Integer schoolStatus) {
		this.schoolStatus = schoolStatus;
	}
	public String getSchoolKeyword() {
		return schoolKeyword;
	}
	public void setSchoolKeyword(String schoolKeyword) {
		this.schoolKeyword = schoolKeyword;
	}
	
}
