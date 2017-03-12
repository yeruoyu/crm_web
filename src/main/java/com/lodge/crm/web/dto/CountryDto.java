package com.lodge.crm.web.dto;

import java.io.Serializable;

public class CountryDto implements Serializable{
	
	private static final long serialVersionUID = 8710584814362163364L;
	
	private String countryCode;
	private String countryName;
	
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
}
