package com.lodge.crm.web.dto;

import java.io.Serializable;

public class ProjectDto  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String projectCode;
	private String projectName;
	private String projectDesc;
	private Double projectPrice;
	private Integer projectStatus;
	private String stopDate;
	private String startDate;
	private String countryName;
	private String schoolName;
	private String schoolCode;

	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public Double getProjectPrice() {
		return projectPrice;
	}
	public void setProjectPrice(Double projectPrice) {
		this.projectPrice = projectPrice;
	}
	public String getStopDate() {
		return stopDate;
	}
	public void setStopDate(String stopDate) {
		this.stopDate = stopDate;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getProjectDesc() {
		return projectDesc;
	}
	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}
	public Integer getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(Integer projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
}
