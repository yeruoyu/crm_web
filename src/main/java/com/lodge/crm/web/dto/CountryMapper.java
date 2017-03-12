package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Country;

public class CountryMapper {
	public static CountryDto map(Country country) {
		CountryDto dto = new CountryDto();
		dto.setCountryCode(country.getCountryCode());
		dto.setCountryName(country.getCountryName());
		return dto;
	}
	
	public static List<CountryDto> map(Page<Country> countrys) {
		List<CountryDto> dtos = new ArrayList<CountryDto>();
		for (Country country : countrys) {
			dtos.add(map(country));
		}
		return dtos;
	}
	
	public static List<CountryDto> map(List<Country> countrys) {
		List<CountryDto> dtos = new ArrayList<CountryDto>();
		for (Country country : countrys) {
			dtos.add(map(country));
		}
		return dtos;
	}
}
