package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Project;
import com.lodge.crm.core.util.DateUtils;

public class ProjectMapper {
	public static ProjectDto map(Project project) {
		ProjectDto dto = new ProjectDto();
		dto.setProjectCode(project.getProjectCode());
		dto.setProjectName(project.getProjectName());
		dto.setProjectDesc(project.getProjectDesc());
		dto.setProjectPrice(project.getProjectPrice());
		dto.setStopDate(DateUtils.formatDate(project.getStopDate()));
		dto.setStartDate(DateUtils.formatDate(project.getStartDate()));
		dto.setCountryName(project.getCountryName());
		dto.setProjectStatus(project.getProjectStatus());
		
		if (project.getSchool() != null) {
			dto.setSchoolCode(project.getSchool().getSchoolCode());
			dto.setSchoolName(project.getSchool().getSchoolName());
		}

		return dto;
	}

	public static List<ProjectDto> map(Page<Project> projects) {
		List<ProjectDto> dtos = new ArrayList<ProjectDto>();
		for (Project project : projects) {
			dtos.add(map(project));
		}
		return dtos;
	}
	
	public static List<ProjectDto> map(List<Project> projects) {
		List<ProjectDto> dtos = new ArrayList<ProjectDto>();
		for (Project project : projects) {
			dtos.add(map(project));
		}
		return dtos;
	}
}
