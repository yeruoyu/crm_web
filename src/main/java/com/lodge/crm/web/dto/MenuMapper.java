package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Menu;

public class MenuMapper {
	
	public static MenuDto map(Menu menu) {
		MenuDto dto = new MenuDto();
		
		dto.setMenuCode(menu.getMenuCode());
		dto.setMenuName(menu.getMenuName());
		dto.setMenuIcon(menu.getMenuIcon());
		dto.setMenuCss(menu.getMenuCss());
		dto.setMenuLevel(menu.getMenuLevel());
		dto.setMenuSort(menu.getMenuSort());
		dto.setMenuStatus(menu.getMenuStatus());
		dto.setMenuType(menu.getMenuType());
		dto.setMenuUrl(menu.getMenuUrl());
		
		if(menu.getParentMenu()!=null){
			dto.setParentMenuCode(menu.getParentMenu().getMenuCode());
		}
		
		return dto;
	}

	public static List<MenuDto> map(Page<Menu> menus) {
		List<MenuDto> dtos = new ArrayList<MenuDto>();
		for (Menu menu : menus) {
			dtos.add(map(menu));
		}
		return dtos;
	}
	
	public static List<MenuDto> map(List<Menu> menus) {
		List<MenuDto> dtos = new ArrayList<MenuDto>();
		for (Menu menu : menus) {
			dtos.add(map(menu));
		}
		return dtos;
	}
}
