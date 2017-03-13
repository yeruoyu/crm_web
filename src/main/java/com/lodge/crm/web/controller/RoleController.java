package com.lodge.crm.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.entity.hibernate.Menu;
import com.lodge.crm.core.entity.hibernate.Role;
import com.lodge.crm.core.service.MenuService;
import com.lodge.crm.core.service.RoleService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.MenuDto;
import com.lodge.crm.web.dto.MenuMapper;
import com.lodge.crm.web.dto.RoleDto;
import com.lodge.crm.web.dto.RoleMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	RoleService roleService;
	
	@Autowired
	MenuService menuService;
	
	/** 页面跳转到公告列表  */
	@RequestMapping(value="roleList")
	public String gotoRoleList(){
		return "/role/roleList";
	}
	
	/** 页面跳转到添加公告 */
	@RequestMapping(value="addRole")
	public String gotoAddRole(HttpServletRequest request, HttpServletResponse response){
		
		List<MenuDto> menuDtos = MenuMapper.map(menuService.findByMenuType("menu"));
		
		request.setAttribute("menuDtos", menuDtos);
		
		return "/role/newRole";
	}
	
	/** 跳转到明细页面 */
	@RequestMapping(value="roleDetail")
	public String gotoRoleDetail(HttpServletRequest request, HttpServletResponse response
			,@RequestParam String roleCode){
		RoleDto roleDto = RoleMapper.map(roleService.findOne(roleCode));
		
		List<MenuDto> menuDtos = MenuMapper.map(menuService.findByMenuType("menu"));
		if(roleDto.getMenuList()!=null && roleDto.getMenuList().size()>0){
						
			for(MenuDto menuDto: menuDtos){
				for(MenuDto selMenu : roleDto.getMenuList()){
					if(menuDto.getMenuCode().equals(selMenu.getMenuCode())){
						menuDto.setSelFlag(1);
						break;
					}else{
						menuDto.setSelFlag(0);
					}
				}
			}
		}
		
		request.setAttribute("menuDtos", menuDtos);
		request.setAttribute("roleDto", roleDto);
		
		return "/role/roleDetail";
	}
	
	/** 跳转到编辑页面 */
	@RequestMapping(value="editRole")
	public String gotoEditRole(HttpServletRequest request, HttpServletResponse response
			,@RequestParam String roleCode){
		RoleDto roleDto = RoleMapper.map(roleService.findOne(roleCode));
		
		List<MenuDto> menuDtos = MenuMapper.map(menuService.findByMenuType("menu"));
		if(roleDto.getMenuList()!=null && roleDto.getMenuList().size()>0){
			
			for(MenuDto menuDto: menuDtos){
				for(MenuDto selMenu : roleDto.getMenuList()){
					if(menuDto.getMenuCode().equals(selMenu.getMenuCode())){
						menuDto.setSelFlag(1);
						break;
					}else{
						menuDto.setSelFlag(0);
					}
				}
			}
		}
		
		request.setAttribute("menuDtos", menuDtos);
		request.setAttribute("roleDto", roleDto);
		
		return "/role/editRole";
	}
	
	@RequestMapping(value = "/saveNewRole",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveNewRole(@RequestBody RoleDto roleDto,HttpServletRequest request) {
		StatusResponse result = checkRole(roleDto);

		if(result.getSuccess()){
			Role role = new Role();
			role.setRoleCode(roleDto.getRoleCode());
			role.setRoleName(roleDto.getRoleName());
			role.setRoleStatus(roleDto.getRoleStatus());
			
			String[] menus = roleDto.getSelMenus().split(",");
			if(menus.length>0){
				List<Menu> menuList=new ArrayList<Menu>();
				for(String menuCode:menus){
					Menu menu = new Menu();
					menu.setMenuCode(menuCode);
					menuList.add(menu);
				}
				role.setMenuList(menuList);
			}
			roleService.create(role);
		}
		return result;
	}
	
	@RequestMapping(value = "/saveRole",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveRole(@RequestBody RoleDto roleDto,HttpServletRequest request) {
		StatusResponse result = checkRole(roleDto);
		if(result.getSuccess()){
			Role role = roleService.findOne(roleDto.getRoleCode());
			role.setRoleName(roleDto.getRoleName());
			role.setRoleStatus(roleDto.getRoleStatus());
			
			String[] menus = roleDto.getSelMenus().split(",");
			if(menus.length>0){
				List<Menu> menuList=new ArrayList<Menu>();
				for(String menuCode:menus){
					Menu menu = new Menu();
					menu.setMenuCode(menuCode);
					menuList.add(menu);
				}
				role.setMenuList(menuList);
			}			
			roleService.update(role);
		}
		return result;
	}	
	
	private StatusResponse checkRole(RoleDto roleDto){
		StatusResponse result = new StatusResponse();
		result.setSuccess(true);

		return result;
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<RoleDto> records(@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord) {

		Pageable pageRequest = null;
		if (sidx != null && !sidx.equals("")) {
			Sort sort = null;
			if (sord.equals("desc")) {
				sort = new Sort(Sort.Direction.DESC, sidx);
			} else {
				sort = new Sort(Sort.Direction.ASC, sidx);
			}
			pageRequest = new PageRequest(page - 1, rows, sort);
		} else {
			pageRequest = new PageRequest(page - 1, rows);
		}

		if (search == true) {
			return getFilteredRecords(filters, pageRequest);
		}

		Page<Role> roles = roleService.findAll(pageRequest);
		List<RoleDto> roleDtos = RoleMapper.map(roles);

		JqgridResponse<RoleDto> response = new JqgridResponse<RoleDto>();
		response.setRows(roleDtos);
		response.setRecords(Long.valueOf(roles.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(roles.getTotalPages()).toString());
		response.setPage(Integer.valueOf(roles.getNumber() + 1).toString());

		return response;
	}
	
	public JqgridResponse<RoleDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Role> roles = roleService.findAll(jqgridFilter,
				pageRequest);

		List<RoleDto> roleDtos = RoleMapper.map(roles);
		JqgridResponse<RoleDto> response = new JqgridResponse<RoleDto>();
		response.setRows(roleDtos);
		response.setRecords(Long.valueOf(roles.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(roles.getTotalPages()).toString());
		response.setPage(Integer.valueOf(roles.getNumber() + 1).toString());
		return response;
	}
}
