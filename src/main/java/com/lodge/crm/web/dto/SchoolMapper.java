package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.School;

public class SchoolMapper {
	public static SchoolDto map(School school) {
		SchoolDto dto = new SchoolDto();
		dto.setSchoolCode(school.getSchoolCode());
		dto.setSchoolName(school.getSchoolName());
		dto.setSchoolComments(school.getSchoolComments());
		dto.setSchoolStatus(school.getSchoolStatus());
		dto.setSchoolKeyword(school.getSchoolKeyword());
		return dto;
	}
	
	public static List<SchoolDto> map(Page<School> schools) {
		List<SchoolDto> dtos = new ArrayList<SchoolDto>();
		for (School school : schools) {
			dtos.add(map(school));
		}
		return dtos;
	}
	
	public static List<SchoolDto> map(List<School> schools) {
		List<SchoolDto> dtos = new ArrayList<SchoolDto>();
		for (School school : schools) {
			dtos.add(map(school));
		}
		return dtos;
	}
}
