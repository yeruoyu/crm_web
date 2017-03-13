package com.lodge.crm.web.dto;

import java.io.Serializable;
import java.util.List;

public class RoleDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3739262404259422803L;

	/** 角色代码 */
	private String roleCode;
	
	/** 角色名称 */
	private String roleName;
	
	/** 角色状态 */
	private Integer roleStatus;
	
	/** 角色所对应的菜单 */
	private List<MenuDto> menuList;
	
	private String selMenus;

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(Integer roleStatus) {
		this.roleStatus = roleStatus;
	}

	public List<MenuDto> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MenuDto> menuList) {
		this.menuList = menuList;
	}

	public String getSelMenus() {
		return selMenus;
	}

	public void setSelMenus(String selMenus) {
		this.selMenus = selMenus;
	}
}
