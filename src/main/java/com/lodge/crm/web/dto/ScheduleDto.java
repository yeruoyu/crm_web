package com.lodge.crm.web.dto;

import java.io.Serializable;
import java.util.Date;

public class ScheduleDto implements Serializable{

	private static final long serialVersionUID = -9094455152541450644L;
	/** 日程ID 主键 */
	private Integer scheduleId;
	
	/** 日程对应员工Code */
	private String scheduleUserCode;
	/** 日程对应员工姓名 */
	private String scheduleUserName;
	
	/** 日程类型 */
	private String scheduleType;
	
	/** 日程标题 */
	private String scheduleTitle;
	
	/** 日程详细信息 */
	private String scheduleDetail;
	
	/** 日程开始时间 */
	private String scheduleStartTime;
	
	/** 日程结束时间 */
	private String scheduleEndTime;
	
	/** 日程状态 */
	private Integer scheduleStatus;

	/** 创建员工Code */
	private String creatorCode;
	
	/** 创建员工姓名 */
	private String creatorName;
	
	/** 创建时间 */
	private Date createTime;
	
	private String userList;
	
	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String getScheduleType() {
		return scheduleType;
	}

	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getScheduleDetail() {
		return scheduleDetail;
	}

	public void setScheduleDetail(String scheduleDetail) {
		this.scheduleDetail = scheduleDetail;
	}

	public String getScheduleStartTime() {
		return scheduleStartTime;
	}

	public void setScheduleStartTime(String scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}

	public String getScheduleEndTime() {
		return scheduleEndTime;
	}

	public void setScheduleEndTime(String scheduleEndTime) {
		this.scheduleEndTime = scheduleEndTime;
	}

	public Integer getScheduleStatus() {
		return scheduleStatus;
	}

	public void setScheduleStatus(Integer scheduleStatus) {
		this.scheduleStatus = scheduleStatus;
	}

	public String getScheduleUserCode() {
		return scheduleUserCode;
	}

	public void setScheduleUserCode(String scheduleUserCode) {
		this.scheduleUserCode = scheduleUserCode;
	}

	public String getScheduleUserName() {
		return scheduleUserName;
	}

	public void setScheduleUserName(String scheduleUserName) {
		this.scheduleUserName = scheduleUserName;
	}

	public String getCreatorCode() {
		return creatorCode;
	}

	public void setCreatorCode(String creatorCode) {
		this.creatorCode = creatorCode;
	}

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUserList() {
		return userList;
	}

	public void setUserList(String userList) {
		this.userList = userList;
	}
}
