package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.User;

public class UserMapper {

	public static UserDto map(User user) {
		UserDto dto = new UserDto();
		dto.setUserCode(user.getUserCode());
		dto.setUserName(user.getUserName());
		dto.setUserAddress(user.getUserAddress());
		dto.setUserEmail(user.getUserEmail());
		dto.setUserPhone(user.getUserPhone());
		dto.setUserMobile(user.getUserMobile());
		dto.setUserQq(user.getUserQq());
		dto.setUserWebchat(user.getUserWebchat());
		dto.setUserStatus(user.getUserStatus());
		dto.setUserPassword(user.getUserPassword());
		dto.setUserLevel(user.getUserLevel());
		dto.setUserMax(user.getUserMax());
		
		if(user.getParentUser()!=null){
			dto.setpUserCode(user.getParentUser().getUserCode());
			dto.setpUserName(user.getParentUser().getUserName());
		}
		
		if(user.getUserRole()!=null){
			dto.setRoleCode(user.getUserRole().getRoleCode());
			dto.setRoleName(user.getUserRole().getRoleName());
		}
		
		if(user.getUserGroup()!=null){
			dto.setGroupCode(user.getUserGroup().getGroupCode());
			dto.setGroupName(user.getUserGroup().getGroupName());
		}
		
		// 用户所对应的学校
		if(user.getSchoolList() !=null && user.getSchoolList().size()>0){
			dto.setSchoolList(SchoolMapper.map(user.getSchoolList()));
		}
		
		return dto;
	}
	
	public static List<UserDto> map(Page<User> users) {
		List<UserDto> dtos = new ArrayList<UserDto>();
		for (User user : users) {
			dtos.add(map(user));
		}
		return dtos;
	}
	
	public static List<UserDto> map(List<User> users) {
		List<UserDto> dtos = new ArrayList<UserDto>();
		for (User user : users) {
			dtos.add(map(user));
		}
		return dtos;
	}
}
