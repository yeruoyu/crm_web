package com.lodge.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.common.Constants;
import com.lodge.crm.core.entity.hibernate.Menu;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.MenuService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.web.dto.UserDto;

@Controller
@RequestMapping
public class LoginController {
	@Autowired
	UserService userService;
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="login")
	public String gotoUserList(){
		return "/login";
	}

	@RequestMapping(value="checkUser")
	public @ResponseBody boolean checkUser(@ModelAttribute UserDto userDto,
			HttpServletRequest request,HttpServletResponse response){
		User user = (User)request.getSession().getAttribute("user");
		boolean accessGranted = false;
		if(user!=null){

			accessGranted = true;
			return accessGranted;
		}

		user = userService.findOne(userDto.getUserCode().toUpperCase());
		if(user==null){
			user = userService.findbyEmailAccount(userDto.getUserCode()+"@%");
		}
		if(user!=null 
				&& user.getUserStatus().equals(Constants._ACTIVE) 
				&& userDto.getUserPassword().equals(user.getUserPassword())){
			//List<Menu> menuList = menuService.findByMenuType("menu");
			List<Menu> menuList = menuService.findByRoleCode(user.getUserRole().getRoleCode(), "menu");

			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("menuList", menuList);
			accessGranted = true;
		}else{
			accessGranted = false;
		}
		
		
		return accessGranted;
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("user");
		return "/login";
	}
}
