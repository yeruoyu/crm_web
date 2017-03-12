package com.lodge.crm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.entity.hibernate.Menu;
import com.lodge.crm.core.service.MenuService;
import com.lodge.crm.web.dto.MenuDto;
import com.lodge.crm.web.dto.MenuMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	/**
	 * 跳转到项目信息列表页面
	 * @return
	 */
	@RequestMapping(value="menuList")
	public String gotoProjectList(){
		return "/menu/menuList";
	}
	
	@RequestMapping(value="/records", produces="application/json")
	public @ResponseBody JqgridResponse<MenuDto> records(
    		@RequestParam("_search") Boolean search,
    		@RequestParam(value="filters", required=false) String filters,
    		@RequestParam(value="page", required=false) Integer page,
    		@RequestParam(value="rows", required=false) Integer rows,
    		@RequestParam(value="sidx", required=false) String sidx,
    		@RequestParam(value="sord", required=false) String sord) {
		
		Pageable pageRequest =null;
		if(sidx != null && !sidx.equals("")){
			Sort sort = null;
			if(sord.equals("desc")){
				sort = new Sort(Sort.Direction.DESC, sidx);
			}else{
				sort = new Sort(Sort.Direction.ASC, sidx);
			}	
			pageRequest= new PageRequest(page-1, rows, sort);
		}else{
			pageRequest= new PageRequest(page-1, rows);
		}
		
		Page<Menu> menus = menuService.findAll(pageRequest);
		
		List<MenuDto> menuDtos = MenuMapper.map(menus);
		
		JqgridResponse<MenuDto> response = new JqgridResponse<MenuDto>();
		response.setRows(menuDtos);
		response.setRecords(Long.valueOf(menus.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(menus.getTotalPages()).toString());
		response.setPage(Integer.valueOf(menus.getNumber()+1).toString());
		
		return response;
	}
	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String menuName,
			@RequestParam Integer menuLevel,
			@RequestParam String menuCss,
			@RequestParam String menuIcon,
			@RequestParam Integer menuSort,
			@RequestParam Integer menuStatus,
			@RequestParam String menuType,
			@RequestParam String menuUrl,
			@RequestParam String parentMenuCode) {

		Menu newMenu = new Menu();
		newMenu.setMenuName(menuName);
		newMenu.setMenuLevel(menuLevel);
		newMenu.setMenuCss(menuCss);
		newMenu.setMenuSort(menuSort);
		newMenu.setMenuIcon(menuIcon);
		newMenu.setMenuStatus(menuStatus);
		newMenu.setMenuType(menuType);
		newMenu.setMenuUrl(menuUrl);
		
		if(parentMenuCode !=null){
			Menu parentMenu = menuService.findOne(parentMenuCode);
			if(parentMenu!=null){
				newMenu.setParentMenu(parentMenu);
			}
		}
		Boolean result = menuService.create(newMenu);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String menuCode,
			@RequestParam String menuName,
			@RequestParam Integer menuLevel,
			@RequestParam String menuCss,
			@RequestParam String menuIcon,
			@RequestParam Integer menuSort,
			@RequestParam Integer menuStatus,
			@RequestParam String menuType,
			@RequestParam String menuUrl,
			@RequestParam String parentMenuCode) {

		Menu exisiMenu = new Menu();
		exisiMenu.setMenuCode(menuCode);
		exisiMenu.setMenuName(menuName);
		exisiMenu.setMenuLevel(menuLevel);
		exisiMenu.setMenuCss(menuCss);
		exisiMenu.setMenuIcon(menuIcon);
		exisiMenu.setMenuSort(menuSort);
		exisiMenu.setMenuStatus(menuStatus);
		exisiMenu.setMenuType(menuType);
		exisiMenu.setMenuUrl(menuUrl);
		
		if(parentMenuCode !=null){
			Menu parentMenu = menuService.findOne(parentMenuCode);
			if(parentMenu!=null){
				exisiMenu.setParentMenu(parentMenu);
			}
		}
		Boolean result = menuService.update(exisiMenu);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String menuCode) {

		Menu exisitMenu = new Menu();
		exisitMenu.setMenuCode(menuCode);
		Boolean result = true;
		try {
			menuService.delete(exisitMenu);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
}
