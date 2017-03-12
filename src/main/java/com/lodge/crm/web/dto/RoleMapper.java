package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Role;

public class RoleMapper {
	public static RoleDto map(Role role) {
		RoleDto dto = new RoleDto();
		dto.setRoleCode(role.getRoleCode());
		dto.setRoleName(role.getRoleName());
		dto.setRoleStatus(role.getRoleStatus());
		
		if(role.getMenuList() !=null && role.getMenuList().size()>0){
			dto.setMenuList(MenuMapper.map(role.getMenuList()));
		}
	
		return dto;
	}
	
	public static List<RoleDto> map(Page<Role> roles) {
		List<RoleDto> dtos = new ArrayList<RoleDto>();
		for (Role role : roles) {
			dtos.add(map(role));
		}
		return dtos;
	}
	
	public static List<RoleDto> map(List<Role> roles) {
		List<RoleDto> dtos = new ArrayList<RoleDto>();
		for (Role role : roles) {
			dtos.add(map(role));
		}
		return dtos;
	}
}
