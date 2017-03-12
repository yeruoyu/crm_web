package com.lodge.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lodge.crm.core.service.PublishService;
import com.lodge.crm.core.service.UserService;

@Controller
@RequestMapping("/publish")
public class PublishController {

	@Autowired
	UserService userService;
	
	@Autowired
	PublishService publishService;
	
	
}
