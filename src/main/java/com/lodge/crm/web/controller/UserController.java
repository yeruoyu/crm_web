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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerRecord;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.RecordService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.dto.CustomerMapper;
import com.lodge.crm.web.dto.RecordDto;
import com.lodge.crm.web.dto.RecordMapper;
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
	CustomerService customerService;
	
	@Autowired
	RecordService recordService;
	
	@Autowired
	TableKeyService tableKeyService;
	
	/**
	 * 跳转到用户信息列表页面
	 * @return
	 */
	@RequestMapping(value="userList")
	public String gotoUserList(){
		return "/user/userList";
	}
	
	public String gotoMyCustomerList(){
		return "/customer/myCustomerList";
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

	
	@RequestMapping(value = "/get", produces = "application/json")
	public String get(HttpServletRequest request,HttpServletResponse response,@RequestParam String userCode) {
		UserDto userDto = UserMapper.map(userService.findOne(userCode));
		request.setAttribute("userDto", userDto);
		return "/user/userDetail";
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
}
