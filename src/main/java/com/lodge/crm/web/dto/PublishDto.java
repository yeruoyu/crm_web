package com.lodge.crm.web.dto;

import java.io.Serializable;

public class PublishDto implements Serializable{

	private static final long serialVersionUID = -9094455152541450644L;
	/** 日程ID 主键 */
	private Integer publishId;
	
	/** 日程标题 */
	private String publishTitle;
	
	/** 日程详细信息 */
	private String publishDetail;
	
	/** 日程状态 */
	private Integer publishStatus;
	
	/** 日程对应员工Code */
	private String publishCUserCode;
	
	/** 日程对应员工姓名 */
	private String publishCUserName;
	
	/** 日程对应员工Code */
	private String publishUUserCode;
	
	/** 日程对应员工姓名 */
	private String publishUUserName;
	
	/** 日程开始时间 */
	private String publishCTime;
	
	/** 日程结束时间 */
	private String publishUTime;

	public Integer getPublishId() {
		return publishId;
	}

	public void setPublishId(Integer publishId) {
		this.publishId = publishId;
	}

	public String getPublishTitle() {
		return publishTitle;
	}

	public void setPublishTitle(String publishTitle) {
		this.publishTitle = publishTitle;
	}

	public String getPublishDetail() {
		return publishDetail;
	}

	public void setPublishDetail(String publishDetail) {
		this.publishDetail = publishDetail;
	}

	public Integer getPublishStatus() {
		return publishStatus;
	}

	public void setPublishStatus(Integer publishStatus) {
		this.publishStatus = publishStatus;
	}

	public String getPublishCUserCode() {
		return publishCUserCode;
	}

	public void setPublishCUserCode(String publishCUserCode) {
		this.publishCUserCode = publishCUserCode;
	}

	public String getPublishCUserName() {
		return publishCUserName;
	}

	public void setPublishCUserName(String publishCUserName) {
		this.publishCUserName = publishCUserName;
	}

	public String getPublishUUserCode() {
		return publishUUserCode;
	}

	public void setPublishUUserCode(String publishUUserCode) {
		this.publishUUserCode = publishUUserCode;
	}

	public String getPublishUUserName() {
		return publishUUserName;
	}

	public void setPublishUUserName(String publishUUserName) {
		this.publishUUserName = publishUUserName;
	}

	public String getPublishCTime() {
		return publishCTime;
	}

	public void setPublishCTime(String publishCTime) {
		this.publishCTime = publishCTime;
	}

	public String getPublishUTime() {
		return publishUTime;
	}

	public void setPublishUTime(String publishUTime) {
		this.publishUTime = publishUTime;
	}
}
