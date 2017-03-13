package com.lodge.crm.web.dto;

import java.io.Serializable;

public class AreaDto implements Serializable{

	private static final long serialVersionUID = -5838741885774463520L;

	private String areaCode;

	private String areaName;

	private String cityName;	

	private String countryName;

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
}
