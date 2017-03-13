package com.lodge.crm.web.dto;

import java.io.Serializable;

public class CustomerDto  implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 客户代码，主键 */
	private String customerCode;
	/** 客户姓名 */
	private String customerName;
	/** 客户英文名/昵称 */
	private String customerEName;
	/** 客户性别 */
	private Integer customerSex;
	/** 身份证 */
	private String customerCredit;
	/** 出生年月 */
	private String customerBirthday;
	/** 目前所在学校  */
	private String customerSchool;
	/** 现在年级  */
	private String customerGrade;
	/** 现在专业  */
	private String customerMajor;
	/** 意向专业  */
	private String intentionMajor;
	/** 意向国家  */
	private String intentionContry;
	/** 意向状态 */
	private String intentionStatus;
	/** 负责人 Code*/
	private String principalCode;
	/** 负责人 姓名*/
	private String principalName;
	/** 客户对应渠道代码 */
	private String channelCode;
	/** 客户对应渠道名称 */
	private String channelName;
	
	private String customerPhone1;
	
	private String customerPhone2;
	
	/** 客户默认手机 ,作为客户唯一性验证*/
	private String customerMobile1;
	
	private String customerMobile2;
	/** E-Mail */
	private String customerEmail;
	/** QQ */
	private String customerQq;
	/** 微信 */
	private String customerWeiChat;
	/** 省  */
	private String customerProvince;
	/** 市 */
	private String customerCity;
	/** 邮编 */
	private String customerZipcode;
	/** 地址 */
	private String customerAddress;
	/** 锁定状态 */
	private Integer customerLocked;
	/** 客户备注 */
	private String customerComments;
	/** 客户级别 */
	private Integer customerLevel;
	/** 客户状态(未报名:0 | 顾问退回:-1 | 市场退回:-2 -> 已报名:1 -> 合同签定:2-> 已付款:3-> 开始上课:4 -> 课程结束:9) */
	private Integer customerStatus;
	/** 结算状态(未结算:0 -> 已结算:1 -> 已退回:-2) */
	private Integer accountStatus;
	
	private String customerGroupCode;
	
	private String customerGroupName;
	/** 最后联系时间 */
	private String lastContactTime;
	/** 创建人代码 */
	private String createUserCode;
	/** 创建人名称 */
	private String createUserName;
	/** 创建时间 */
	private String createTime;
	/** 修改标识 0-不能修改;1-仅修改客户基本部分;2-可修改客户信息和联系信息 */
	private Integer editFlag;
	
	/** 上门情况 0-未上门;1-已上门 */
	private Integer visitStatus;
	
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
	public String getCustomerEName() {
		return customerEName;
	}
	public void setCustomerEName(String customerEName) {
		this.customerEName = customerEName;
	}
	public Integer getCustomerSex() {
		return customerSex;
	}
	public void setCustomerSex(Integer customerSex) {
		this.customerSex = customerSex;
	}
	public String getCustomerCredit() {
		return customerCredit;
	}
	public void setCustomerCredit(String customerCredit) {
		this.customerCredit = customerCredit;
	}
	public String getCustomerBirthday() {
		return customerBirthday;
	}
	public void setCustomerBirthday(String customerBirthday) {
		this.customerBirthday = customerBirthday;
	}
	public String getCustomerSchool() {
		return customerSchool;
	}
	public void setCustomerSchool(String customerSchool) {
		this.customerSchool = customerSchool;
	}
	public String getCustomerGrade() {
		return customerGrade;
	}
	public void setCustomerGrade(String customerGrade) {
		this.customerGrade = customerGrade;
	}
	public String getCustomerMajor() {
		return customerMajor;
	}
	public void setCustomerMajor(String customerMajor) {
		this.customerMajor = customerMajor;
	}
	public String getIntentionMajor() {
		return intentionMajor;
	}
	public void setIntentionMajor(String intentionMajor) {
		this.intentionMajor = intentionMajor;
	}
	public String getIntentionContry() {
		return intentionContry;
	}
	public void setIntentionContry(String intentionContry) {
		this.intentionContry = intentionContry;
	}
	public String getIntentionStatus() {
		return intentionStatus;
	}
	public void setIntentionStatus(String intentionStatus) {
		this.intentionStatus = intentionStatus;
	}
	public String getPrincipalCode() {
		return principalCode;
	}
	public void setPrincipalCode(String principalCode) {
		this.principalCode = principalCode;
	}
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}

	public String getCustomerPhone1() {
		return customerPhone1;
	}
	public void setCustomerPhone1(String customerPhone1) {
		this.customerPhone1 = customerPhone1;
	}
	public String getCustomerPhone2() {
		return customerPhone2;
	}
	public void setCustomerPhone2(String customerPhone2) {
		this.customerPhone2 = customerPhone2;
	}
	public String getCustomerMobile1() {
		return customerMobile1;
	}
	public void setCustomerMobile1(String customerMobile1) {
		this.customerMobile1 = customerMobile1;
	}
	public String getCustomerMobile2() {
		return customerMobile2;
	}
	public void setCustomerMobile2(String customerMobile2) {
		this.customerMobile2 = customerMobile2;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerQq() {
		return customerQq;
	}
	public void setCustomerQq(String customerQq) {
		this.customerQq = customerQq;
	}
	public String getCustomerWeiChat() {
		return customerWeiChat;
	}
	public void setCustomerWeiChat(String customerWeiChat) {
		this.customerWeiChat = customerWeiChat;
	}
	public String getCustomerProvince() {
		return customerProvince;
	}
	public void setCustomerProvince(String customerProvince) {
		this.customerProvince = customerProvince;
	}
	public String getCustomerCity() {
		return customerCity;
	}
	public void setCustomerCity(String customerCity) {
		this.customerCity = customerCity;
	}
	public String getCustomerZipcode() {
		return customerZipcode;
	}
	public void setCustomerZipcode(String customerZipcode) {
		this.customerZipcode = customerZipcode;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
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
	public Integer getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(Integer accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getPrincipalName() {
		return principalName;
	}
	public void setPrincipalName(String principalName) {
		this.principalName = principalName;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getCustomerGroupCode() {
		return customerGroupCode;
	}
	public void setCustomerGroupCode(String customerGroupCode) {
		this.customerGroupCode = customerGroupCode;
	}
	public String getCustomerGroupName() {
		return customerGroupName;
	}
	public void setCustomerGroupName(String customerGroupName) {
		this.customerGroupName = customerGroupName;
	}
	public String getLastContactTime() {
		return lastContactTime;
	}
	public void setLastContactTime(String lastContactTime) {
		this.lastContactTime = lastContactTime;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUserCode() {
		return createUserCode;
	}
	public void setCreateUserCode(String createUserCode) {
		this.createUserCode = createUserCode;
	}
	public Integer getEditFlag() {
		return editFlag;
	}
	public void setEditFlag(Integer editFlag) {
		this.editFlag = editFlag;
	}
	public Integer getVisitStatus() {
		return visitStatus;
	}
	public void setVisitStatus(Integer visitStatus) {
		this.visitStatus = visitStatus;
	}
	
	
}
