package com.lodge.crm.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.Schedule;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.PublishService;
import com.lodge.crm.core.service.ScheduleService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.dto.CustomerMapper;
import com.lodge.crm.web.dto.ScheduleDto;
import com.lodge.crm.web.dto.ScheduleMapper;
import com.lodge.crm.web.response.JqgridResponse;

@Controller
@RequestMapping
public class HomeController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	PublishService publishService;
	
	@RequestMapping(value = "/index")
	public String gotoIndexPage() {
		return "index";
	}
	
	/**
	 * 获取未指定客户的信息
	 * @param search
	 * @param filters
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<CustomerDto> records(
			HttpServletRequest request,
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

		User user = (User)request.getSession().getAttribute("user");
		
		Page<Customer> customers = customerService.findUnlockCustomer(user.getUserCode(), pageRequest);
		List<CustomerDto> customerDtos = CustomerMapper.map(customers);

		JqgridResponse<CustomerDto> response = new JqgridResponse<CustomerDto>();
		response.setRows(customerDtos);
		response.setRecords(Long.valueOf(customers.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(customers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(customers.getNumber() + 1).toString());

		return response;
	}
	
	@RequestMapping(value = "/scheduleRecords", produces = "application/json")
	public @ResponseBody List<ScheduleDto> scheduleRecords(HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");

		JqgridFilter jqgridFilter = new JqgridFilter();;
		jqgridFilter.setGroupOp("AND");
		jqgridFilter.setRules(new ArrayList<JqgridFilter.Rule>());
		JqgridFilter.Rule rule = new JqgridFilter.Rule();
		rule.setField("scheduleUser");
		rule.setOp("eq");
		rule.setData(user.getUserCode());
		List<JqgridFilter.Rule> rules = jqgridFilter.getRules();
		rules.add(rule);
		
		List<ScheduleDto> scheduleDto = ScheduleMapper.map(scheduleService.findAll(jqgridFilter));

		return scheduleDto;
	}
	
	/**
	 * 查询信息
	 */
	public JqgridResponse<CustomerDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

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

}
