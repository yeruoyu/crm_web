package com.lodge.crm.web.dto;

import java.io.Serializable;

public class ContactInfoDto implements Serializable {

	private static final long serialVersionUID = 8131498550367416414L;

	private Long contactId;

	private String contactLocal;

	private String contactName;
	
	private String contactAddress;

	private String contactZip;

	private String contactPhone;

	private String contactMobile;

	private String contactEmail;

	private String contactQq;

	private String contactWebchat;

	private String customerCode;

	private Integer contactStatus;
	
	public Long getContactId() {
		return contactId;
	}

	public void setContactId(Long contactId) {
		this.contactId = contactId;
	}

	public String getContactLocal() {
		return contactLocal;
	}

	public void setContactLocal(String contactLocal) {
		this.contactLocal = contactLocal;
	}

	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	public String getContactZip() {
		return contactZip;
	}

	public void setContactZip(String contactZip) {
		this.contactZip = contactZip;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactMobile() {
		return contactMobile;
	}

	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactQq() {
		return contactQq;
	}

	public void setContactQq(String contactQq) {
		this.contactQq = contactQq;
	}

	public String getContactWebchat() {
		return contactWebchat;
	}

	public void setContactWebchat(String contactWebchat) {
		this.contactWebchat = contactWebchat;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public Integer getContactStatus() {
		return contactStatus;
	}

	public void setContactStatus(Integer contactStatus) {
		this.contactStatus = contactStatus;
	}
}
