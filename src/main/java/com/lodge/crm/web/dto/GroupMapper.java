package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Group;

public class GroupMapper {
	public static GroupDto map(Group group) {
		GroupDto dto = new GroupDto();
		
		dto.setGroupCode(group.getGroupCode());
		dto.setGroupName(group.getGroupName());
		dto.setGroupStatus(group.getGroupStatus());
		
		return dto;
	}

	public static List<GroupDto> map(Page<Group> groups) {
		List<GroupDto> dtos = new ArrayList<GroupDto>();
		for (Group group : groups) {
			dtos.add(map(group));
		}
		return dtos;
	}
	
	public static List<GroupDto> map(List<Group> groups) {
		List<GroupDto> dtos = new ArrayList<GroupDto>();
		for (Group group : groups) {
			dtos.add(map(group));
		}
		return dtos;
	}
}
