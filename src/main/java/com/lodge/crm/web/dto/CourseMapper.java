package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Course;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.util.DateUtils;

public class CourseMapper {
	public static CourseDto map(Course course) {
		CourseDto dto = new CourseDto();
		dto.setCourseCode(course.getCourseCode());
		dto.setCourseName(course.getCourseName());
		dto.setCourseHour(course.getCourseHour().toString());
		dto.setCourseContent(course.getCourseContent());
		dto.setCourseRemark(course.getCourseRemark());
		dto.setCoursePrice(course.getCoursePrice());
		dto.setCourseStatus(course.getCourseStatus().toString());
		
		if(course.getCreatUser()!=null){
			User createUser= course.getCreatUser();
			dto.setCreatUserCode(createUser.getUserCode());
			dto.setCreatUserName(createUser.getUserName());
		}
		
		if(course.getUpdateUser()!=null){
			User updateUser= course.getUpdateUser();
			dto.setUpdateUserCode(updateUser.getUserCode());
			dto.setUpdateUserName(updateUser.getUserName());
		}
		
		dto.setCreateTime(DateUtils.formatDate(course.getCreateTime()));
		dto.setUpdateTime(DateUtils.formatDate(course.getUpdateTime()));
		return dto;
	}
	
	public static List<CourseDto> map(Page<Course> courses) {
		List<CourseDto> dtos = new ArrayList<CourseDto>();
		for (Course course : courses) {
			dtos.add(map(course));
		}
		return dtos;
	}
	
	public static List<CourseDto> map(List<Course> courses) {
		List<CourseDto> dtos = new ArrayList<CourseDto>();
		for (Course course : courses) {
			dtos.add(map(course));
		}
		return dtos;
	}
}
