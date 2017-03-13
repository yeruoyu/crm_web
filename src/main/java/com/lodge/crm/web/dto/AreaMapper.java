package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Area;

public class AreaMapper {
	public static AreaDto map(Area area) {
		AreaDto dto = new AreaDto();
		
		dto.setAreaCode(area.getAreaCode());
		dto.setAreaName(area.getAreaName());
		dto.setCityName(area.getCityName());
		dto.setCountryName(area.getCountryName());
		
		return dto;
	}
	
	public static List<AreaDto> map(List<Area> areas) {
		List<AreaDto> dtos = new ArrayList<AreaDto>();
		for (Area area : areas) {
			dtos.add(map(area));
		}
		return dtos;
	}
	
	public static List<AreaDto> map(Page<Area> areas) {
		List<AreaDto> dtos = new ArrayList<AreaDto>();
		for (Area area : areas) {
			dtos.add(map(area));
		}
		return dtos;
	}

}
