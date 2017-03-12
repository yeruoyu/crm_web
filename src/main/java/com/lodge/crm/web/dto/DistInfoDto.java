package com.lodge.crm.web.dto;

import java.io.Serializable;

public class DistInfoDto  implements Serializable{

	private static final long serialVersionUID = 1683904812883778449L;
	
	private Integer distId;
	
	private String distType;
	
	private String distCode;
	
	private String distValue;
	
	private String distRemark;

	public Integer getDistId() {
		return distId;
	}

	public void setDistId(Integer distId) {
		this.distId = distId;
	}

	public String getDistType() {
		return distType;
	}

	public void setDistType(String distType) {
		this.distType = distType;
	}

	public String getDistValue() {
		return distValue;
	}

	public void setDistValue(String distValue) {
		this.distValue = distValue;
	}

	public String getDistRemark() {
		return distRemark;
	}

	public void setDistRemark(String distRemark) {
		this.distRemark = distRemark;
	}

	public String getDistCode() {
		return distCode;
	}

	public void setDistCode(String distCode) {
		this.distCode = distCode;
	}
}
