package com.lodge.crm.web.dto;

import java.io.Serializable;

public class TeacherDto implements Serializable{

	private static final long serialVersionUID = -6691666470581328553L;

	/** 教师代码,主键 */
	private String teacherCode;
	
	/** 教师姓名 */
	private String teacherName;
	
	/** 教师性别 */
	private Integer sex;
	
	/** 教师学历 */
	private String education;
	
	/** 毕业学校 */
	private String schoolName;
	
	/** 教师专业 */
	private String major;
	
	/** 授课形式(兼职/全职) */
	private Integer teachingForm;
	
	/** 对应课程代码 */
	private String courseCode;
	
	/** 对应课程名称 */
	private String courseName;
	
	/** 教师简介 */
	private String teacherIntroduce;

	/** 教师状态 */
	private Integer teacherStatus;
	
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

	public String getTeacherCode() {
		return teacherCode;
	}

	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Integer getTeachingForm() {
		return teachingForm;
	}

	public void setTeachingForm(Integer teachingForm) {
		this.teachingForm = teachingForm;
	}

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

	public String getTeacherIntroduce() {
		return teacherIntroduce;
	}

	public void setTeacherIntroduce(String teacherIntroduce) {
		this.teacherIntroduce = teacherIntroduce;
	}

	public Integer getTeacherStatus() {
		return teacherStatus;
	}

	public void setTeacherStatus(Integer teacherStatus) {
		this.teacherStatus = teacherStatus;
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
