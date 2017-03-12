package com.lodge.crm.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lodge.crm.core.service.RoleService;
import com.lodge.crm.web.dto.RoleDto;
import com.lodge.crm.web.dto.RoleMapper;

@Controller
@RequestMapping("/system")
public class SystemController {

	@Autowired
	RoleService roleService;
	
	@RequestMapping(value="roleList")
	public String gotoRoleList(){
		return "/system/roleList";
	}
	
	@RequestMapping(value = "/get", produces = "application/json")
	public String get(HttpServletRequest request,HttpServletResponse response,@RequestParam String roleCode) {
		RoleDto roleDto = RoleMapper.map(roleService.findOne(roleCode));
		request.setAttribute("roleDto", roleDto);
		return "/system/roleDetail";
	}
}
