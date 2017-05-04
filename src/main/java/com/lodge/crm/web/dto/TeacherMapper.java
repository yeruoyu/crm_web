package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Teacher;
import com.lodge.crm.core.util.DateUtils;

public class TeacherMapper {
	public static TeacherDto map(Teacher teacher) {
		TeacherDto dto = new TeacherDto();
		dto.setTeacherCode(teacher.getTeacherCode());
		dto.setTeacherName(teacher.getTeacherName());
		dto.setTeacherStatus(teacher.getTeacherStatus());
		
		dto.setCreateTime(DateUtils.formatDate(teacher.getCreateTime()));
		dto.setUpdateTime(DateUtils.formatDate(teacher.getUpdateTime()));
		return dto;
	}
	
	public static List<TeacherDto> map(Page<Teacher> teachers) {
		List<TeacherDto> dtos = new ArrayList<TeacherDto>();
		for (Teacher teacher : teachers) {
			dtos.add(map(teacher));
		}
		return dtos;
	}
	
	public static List<TeacherDto> map(List<Teacher> teachers) {
		List<TeacherDto> dtos = new ArrayList<TeacherDto>();
		for (Teacher teacher : teachers) {
			dtos.add(map(teacher));
		}
		return dtos;
	}
}
