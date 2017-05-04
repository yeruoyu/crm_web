package com.lodge.crm.web.dto;

import java.io.Serializable;

public class CourseDto implements Serializable{

	private static final long serialVersionUID = -6496949591683874091L;

	/** 课程代码,主键 */
	private String courseCode;
	
	/** 课程名称 */
	private String courseName;
	
	/** 课程内容 */
	private String courseContent;
	
	/** 课程备注 */
	private String courseRemark;
	
	/** 课程课时数 */
	private String courseHour;
	
	/** 课程价格 */
	private String coursePrice;

	/** 课程状态 */
	private String courseStatus;

	/** 创建用户代码 */
	private String creatUserCode;
	
	/** 创建用户姓名 */
	private String creatUserName;

	/** 创建时间 */
	private String createTime;
	
	/** 修改用户代码 */
	private String updateUserCode;
	
	/** 修改用户名称 */
	private String updateUserName;
	
	/** 修改时间 */
	private String updateTime;
	
	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getCourseRemark() {
		return courseRemark;
	}

	public void setCourseRemark(String courseRemark) {
		this.courseRemark = courseRemark;
	}

	public String getCourseHour() {
		return courseHour;
	}

	public void setCourseHour(String courseHour) {
		this.courseHour = courseHour;
	}

	public String getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(String coursePrice) {
		this.coursePrice = coursePrice;
	}

	public String getCourseStatus() {
		return courseStatus;
	}

	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}

	public String getCreatUserCode() {
		return creatUserCode;
	}

	public void setCreatUserCode(String creatUserCode) {
		this.creatUserCode = creatUserCode;
	}

	public String getCreatUserName() {
		return creatUserName;
	}

	public void setCreatUserName(String creatUserName) {
		this.creatUserName = creatUserName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUserCode() {
		return updateUserCode;
	}

	public void setUpdateUserCode(String updateUserCode) {
		this.updateUserCode = updateUserCode;
	}

	public String getUpdateUserName() {
		return updateUserName;
	}

	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
}
