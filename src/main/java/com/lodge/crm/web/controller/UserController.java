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

import com.lodge.crm.core.common.Constants;
import com.lodge.crm.core.entity.hibernate.Channel;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerRecord;
import com.lodge.crm.core.entity.hibernate.Group;
import com.lodge.crm.core.entity.hibernate.Role;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.DistInfoService;
import com.lodge.crm.core.service.GroupService;
import com.lodge.crm.core.service.RecordService;
import com.lodge.crm.core.service.RoleService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.ChannelDto;
import com.lodge.crm.web.dto.ChannelMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.dto.CustomerMapper;
import com.lodge.crm.web.dto.DistInfoDto;
import com.lodge.crm.web.dto.DistInfoMapper;
import com.lodge.crm.web.dto.GroupDto;
import com.lodge.crm.web.dto.GroupMapper;
import com.lodge.crm.web.dto.RecordDto;
import com.lodge.crm.web.dto.RecordMapper;
import com.lodge.crm.web.dto.RoleDto;
import com.lodge.crm.web.dto.RoleMapper;
import com.lodge.crm.web.dto.UserDto;
import com.lodge.crm.web.dto.UserMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	DistInfoService distInfoService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	RecordService recordService;
	
	@Autowired
	TableKeyService tableKeyService;
	
	@Autowired
	GroupService groupService;
	
	/**
	 * 跳转到用户信息列表页面
	 * @return
	 */
	@RequestMapping(value="userList")
	public String gotoUserList(){
		return "/user/userList";
	}
	
	@RequestMapping(value="addUser")
	public String gotoAddUser(HttpServletRequest request, HttpServletResponse response){
		
		User currUser = (User)request.getSession().getAttribute("user");
		List<UserDto> userList = UserMapper.map(userService.findAll());
		List<UserDto> parentList = new ArrayList<UserDto>();
		for(UserDto user:userList){
			if(user.getUserLevel()>currUser.getUserLevel()){
				parentList.add(user);
			}
		}
		List<RoleDto> roleList = RoleMapper.map(roleService.findAll());
		
		List<GroupDto> groupList = GroupMapper.map(groupService.findAll());
		
		List<DistInfoDto> levelList = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DiST_TYPE_USER_LEVEL));
		
		request.setAttribute("roleList", roleList); // 角色选择
		
		request.setAttribute("levelList", levelList); // 级别选择
		
		request.setAttribute("parentList", parentList); // 上级选择列表

		request.setAttribute("groupList", groupList); // 团队列表
		
		return "user/newUser";
	}
	
	@RequestMapping(value="/allUser", produces="application/json")
	public @ResponseBody List<UserDto> allUser(){
		List<User> channels = userService.findAll();
		List<UserDto> userDtos = UserMapper.map(channels);
		return userDtos;
	}
	
	@RequestMapping(value="editUser")
	public String gotoEditUser(HttpServletRequest request, HttpServletResponse response,@RequestParam String userCode){
		
		User currUser = (User)request.getSession().getAttribute("user");
		List<UserDto> userList = UserMapper.map(userService.findAll());
		List<UserDto> parentList = new ArrayList<UserDto>();
		for(UserDto user:userList){
			if(user.getUserLevel()>currUser.getUserLevel()){
				parentList.add(user);
			}
		}
		List<RoleDto> roleList = RoleMapper.map(roleService.findAll());
		
		List<DistInfoDto> levelList = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DiST_TYPE_USER_LEVEL));
		
		List<GroupDto> groupList = GroupMapper.map(groupService.findAll());
		
		User selUser = userService.findOne(userCode);
		
		UserDto userDto=UserMapper.map(selUser);
		
		request.setAttribute("userDto", userDto); // 选中用户

		request.setAttribute("roleList", roleList); // 角色选择
		
		request.setAttribute("groupList", groupList); // 团队列表
		
		request.setAttribute("levelList", levelList); // 级别选择
		
		request.setAttribute("parentList", parentList); // 上级选择列表

		return "user/editUser";
	}
	
	@RequestMapping(value = "/userDetail", produces = "application/json")
	public String userDetail(HttpServletRequest request,HttpServletResponse response,@RequestParam String userCode) {
		User currUser = (User)request.getSession().getAttribute("user");
		
		UserDto userDto = UserMapper.map(userService.findOne(userCode));
		
		List<UserDto> userList = UserMapper.map(userService.findAll());
		List<UserDto> parentList = new ArrayList<UserDto>();
		for(UserDto user:userList){
			if(user.getUserLevel()>currUser.getUserLevel()){
				parentList.add(user);
			}
		}
		List<RoleDto> roleList = RoleMapper.map(roleService.findAll());
		
		List<GroupDto> groupList = GroupMapper.map(groupService.findAll());
		
		List<DistInfoDto> levelList = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DiST_TYPE_USER_LEVEL));
		
		Integer showDetailFlag =0;
		
		if(currUser.getUserCode().equals(userDto.getUserCode())
				|| currUser.getUserCode().equals(userDto.getpUserCode())
				){
			showDetailFlag=1;
		}
		
		request.setAttribute("showDetailFlag", showDetailFlag);
		request.setAttribute("userDto", userDto);
		
		request.setAttribute("roleList", roleList); // 角色选择
		
		request.setAttribute("levelList", levelList); // 级别选择
		
		request.setAttribute("parentList", parentList); // 上级选择列表
		
		request.setAttribute("groupList", groupList); // 团队列表
		
		return "/user/userDetail";
	}
	
	
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	public @ResponseBody StatusResponse resetPassword(@RequestBody UserDto userDto,HttpServletRequest request) {
		StatusResponse result = new StatusResponse();
		User user = userService.findOne(userDto.getUserCode());
		
		user.setUserPassword("123456");
		userService.update(user);
		
		result.setSuccess(true);
		
		return result;
	}
	
	@RequestMapping(value = "/saveNewUser",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveNewUser(@RequestBody UserDto userDto,HttpServletRequest request) {
		StatusResponse result = checkUser(userDto);
		
		if(result.getSuccess()){
			try{
				User user = new User();
				user.setUserCode(userDto.getUserCode());
				user.setUserName(userDto.getUserName());
				user.setUserPassword(userDto.getUserPassword());
				user.setUserMobile(userDto.getUserMobile());
				user.setUserPhone(userDto.getUserPhone());
				user.setUserEmail(userDto.getUserEmail());
				user.setUserAddress(userDto.getUserAddress());
				user.setUserQq(userDto.getUserQq());
				user.setUserWebchat(userDto.getUserWebchat());

				Role role = new Role();
				if(userDto.getRoleCode()!=null && !userDto.getRoleCode().isEmpty()){
					role = roleService.findOne(userDto.getRoleCode());
					user.setUserRole(role);
				}

				User parentUser = new User();
				if(userDto.getpUserCode()!=null && !userDto.getpUserCode().isEmpty()){
					parentUser=userService.findOne(userDto.getpUserCode());
					user.setParentUser(parentUser);
				}
				
				Group group = new Group();
				if(userDto.getGroupCode()!=null && !userDto.getGroupCode().isEmpty()){
					group=groupService.findOne(userDto.getGroupCode());
					user.setUserGroup(group);
				}
				
				user.setUserStatus(userDto.getUserStatus());
				user.setUserSaleFlag(userDto.getSalesFlag());
				user.setUserMax(userDto.getUserMax());
				user.setUserLevel(userDto.getUserLevel());
				if(userService.create(user)){
					result.setSuccess(true);
				}else{
					result.setSuccess(false);
				}
			}catch(Exception ex){
				ex.printStackTrace();
				result.setSuccess(false);
				result.setMessage(ex.getMessage());
			}
		}

		return result;
	}
	
	@RequestMapping(value = "/saveUser",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveUser(@RequestBody UserDto userDto,HttpServletRequest request) {
		StatusResponse result = checkUser(userDto);
		
		if(result.getSuccess()){
			try{
				User user = userService.findOne(userDto.getUserCode());
				user.setUserName(userDto.getUserName());
				user.setUserPassword(userDto.getUserPassword());
				user.setUserMobile(userDto.getUserMobile());
				user.setUserPhone(userDto.getUserPhone());
				user.setUserEmail(userDto.getUserEmail());
				user.setUserAddress(userDto.getUserAddress());
				user.setUserQq(userDto.getUserQq());
				user.setUserWebchat(userDto.getUserWebchat());

				Role role = new Role();
				if(userDto.getRoleCode()!=null && !userDto.getRoleCode().isEmpty()){
					role = roleService.findOne(userDto.getRoleCode());
					user.setUserRole(role);
				}

				User parentUser = new User();
				if(userDto.getpUserCode()!=null && !userDto.getpUserCode().isEmpty()){
					parentUser=userService.findOne(userDto.getpUserCode());
					user.setParentUser(parentUser);
				}
				
				Group group = new Group();
				if(userDto.getGroupCode()!=null && !userDto.getGroupCode().isEmpty()){
					group=groupService.findOne(userDto.getGroupCode());
					user.setUserGroup(group);
				}
				
				user.setUserStatus(userDto.getUserStatus());
				user.setUserSaleFlag(userDto.getSalesFlag());
				user.setUserMax(userDto.getUserMax());
				user.setUserLevel(userDto.getUserLevel());
				if(userService.create(user)){
					result.setSuccess(true);
				}else{
					result.setSuccess(false);
				}
			}catch(Exception ex){
				ex.printStackTrace();
				result.setSuccess(false);
				result.setMessage(ex.getMessage());
			}
		}

		return result;
	}
	
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<UserDto> records(
			@RequestParam("_search") Boolean search,
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

		Page<User> users = userService.findAll(pageRequest);
		List<UserDto> userDtos = UserMapper.map(users);

		JqgridResponse<UserDto> response = new JqgridResponse<UserDto>();
		response.setRows(userDtos);
		response.setRecords(Long.valueOf(users.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
		response.setPage(Integer.valueOf(users.getNumber() + 1).toString());

		return response;
	}

	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<UserDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<User> users = userService.findAll(jqgridFilter,
				pageRequest);

		List<UserDto> userDtos = UserMapper.map(users);
		JqgridResponse<UserDto> response = new JqgridResponse<UserDto>();
		response.setRows(userDtos);
		response.setRecords(Long.valueOf(users.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(users.getTotalPages()).toString());
		response.setPage(Integer.valueOf(users.getNumber() + 1).toString());
		return response;
	}

	

	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String userCode,
			@RequestParam String userName,
			@RequestParam String userPassword,
			@RequestParam String userAddress,
			@RequestParam String userPhone,
			@RequestParam String userMobile,
			@RequestParam String userEmail,
			@RequestParam String userQq,
			@RequestParam String userWebchat,
			@RequestParam int userStatus) {

		User newUser = new User();
		
		// 获取User Code
		String code =  tableKeyService.getNewCode("U");
		
		newUser.setUserCode(code);
		newUser.setUserName(userName);
		newUser.setUserPassword(userPassword);
		newUser.setUserAddress(userAddress);
		newUser.setUserEmail(userEmail);
		newUser.setUserPhone(userPhone);
		newUser.setUserMobile(userMobile);
		newUser.setUserQq(userQq);
		newUser.setUserWebchat(userWebchat);
		newUser.setUserStatus(userStatus);

		Boolean result = userService.create(newUser);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String userCode,
			@RequestParam String userName,
			@RequestParam String userPassword,
			@RequestParam String userAddress,
			@RequestParam String userPhone,
			@RequestParam String userMobile,
			@RequestParam String userEmail,
			@RequestParam String userQq,
			@RequestParam String userWebchat,
			@RequestParam int userStatus) {

		User exisitUser = new User();
		exisitUser.setUserCode(userCode);
		exisitUser.setUserName(userName);
		exisitUser.setUserPassword(userPassword);
		exisitUser.setUserAddress(userAddress);
		exisitUser.setUserEmail(userEmail);
		exisitUser.setUserPhone(userPhone);
		exisitUser.setUserMobile(userMobile);
		exisitUser.setUserQq(userQq);
		exisitUser.setUserWebchat(userWebchat);
		exisitUser.setUserStatus(userStatus);

		Boolean result = userService.update(exisitUser);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String userCode) {

		User exisitUser = new User();
		exisitUser.setUserCode(userCode);
		Boolean result = true;
		try {
			userService.delete(exisitUser);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
	
	/**
	 * 获取员工对应的客户信息
	 * @param search
	 * @param filters
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@RequestMapping(value = "/custRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<CustomerDto> custRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord,
			@RequestParam(value = "userCode", required = false) String userCode) {

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
		
		return getFilteredCustRecords(filters, pageRequest,userCode);
	}
	
	/**
	 * 跳转到修改密码页面
	 * @param request
	 * @param response
	 * @param userCode
	 * @return
	 */
	@RequestMapping(value="changePwd")
	public String gotoChangPassword(HttpServletRequest request, HttpServletResponse response){
		User currUser = (User)request.getSession().getAttribute("user");

		UserDto userDto=UserMapper.map(currUser);
		
		request.setAttribute("userDto", userDto); // 选中用户

		return "/user/changePwd";
	}
	
	/**
	 * 修改密码
	 * @param userCode
	 * @param userPassword
	 * @param userNewPassword
	 * @return
	 */
	@RequestMapping(value = "/savePwd", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse execChangePassword(
			@RequestBody UserDto userDto,HttpServletRequest request){

		Boolean result = true;
		List<String> messages = new ArrayList<String>();
		try {
			User exisitUser = userService.findOne(userDto.getUserCode());
			if(!exisitUser.getUserPassword().equals(userDto.getUserPassword())){
				throw new Exception("原密码不一致，请重新输入。");
			}else{
				exisitUser.setUserPassword(userDto.getUserNewPassword());
				if(userService.update(exisitUser)){
					result=true;
					messages.add("密码修改成功。");
				}else{
					result=false;
					messages.add("密码修改失败。");
				}
			}
		} catch (Exception e) {
			result = false;
			messages.add(e.getMessage());
		}
		return new StatusResponse(result,messages);
	}

	
	public JqgridResponse<CustomerDto> getFilteredCustRecords(String filters,
			Pageable pageRequest,String userCode) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		if(jqgridFilter==null){
			jqgridFilter = new JqgridFilter();
			jqgridFilter.setGroupOp("AND");
			jqgridFilter.setRules(new ArrayList<JqgridFilter.Rule>());
		}
		JqgridFilter.Rule rule = new JqgridFilter.Rule();
		rule.setField("userCode");
		rule.setOp("eq");
		rule.setData(userCode);
		List<JqgridFilter.Rule> rules = jqgridFilter.getRules();
		rules.add(rule);
		Page<Customer> customers = customerService.findAll(jqgridFilter,
				pageRequest);

		List<CustomerDto> customerDtos = CustomerMapper.map(customers);
		JqgridResponse<CustomerDto> response = new JqgridResponse<CustomerDto>();
		response.setRows(customerDtos);
		response.setRecords(Long.valueOf(customers.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(customers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(customers.getNumber() + 1).toString());
		return response;
	}
	
	
	@RequestMapping(value = "/recRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<RecordDto> recRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord,
			@RequestParam(value = "userCode", required = false) String userCode) {

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
		
		return getFilteredRcRecords(filters, pageRequest,userCode);
	}
	
	public JqgridResponse<RecordDto> getFilteredRcRecords(String filters,
			Pageable pageRequest,String userCode) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		if(jqgridFilter==null){
			jqgridFilter = new JqgridFilter();
			jqgridFilter.setGroupOp("AND");
			jqgridFilter.setRules(new ArrayList<JqgridFilter.Rule>());
		}
		JqgridFilter.Rule rule = new JqgridFilter.Rule();
		rule.setField("userCode");
		rule.setOp("eq");
		rule.setData(userCode);
		List<JqgridFilter.Rule> rules = jqgridFilter.getRules();
		rules.add(rule);
		Page<CustomerRecord> records = recordService.findAll(jqgridFilter,
				pageRequest);

		List<RecordDto> recordDtos = RecordMapper.map(records);
		JqgridResponse<RecordDto> response = new JqgridResponse<RecordDto>();
		response.setRows(recordDtos);
		response.setRecords(Long.valueOf(records.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(records.getTotalPages()).toString());
		response.setPage(Integer.valueOf(records.getNumber() + 1).toString());
		return response;
	}
	
	private StatusResponse checkUser(UserDto userDto){
		StatusResponse result = new StatusResponse();
		result.setSuccess(true);

		return result;
	}
}
