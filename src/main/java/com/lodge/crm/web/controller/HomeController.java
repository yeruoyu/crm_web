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
import com.lodge.crm.core.entity.hibernate.CustomerRecord;
import com.lodge.crm.core.entity.hibernate.Publish;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.PublishService;
import com.lodge.crm.core.service.RecordService;
import com.lodge.crm.core.service.ScheduleService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.dto.CustomerMapper;
import com.lodge.crm.web.dto.PublishDto;
import com.lodge.crm.web.dto.PublishMapper;
import com.lodge.crm.web.dto.RecordDto;
import com.lodge.crm.web.dto.RecordMapper;
import com.lodge.crm.web.dto.ScheduleDto;
import com.lodge.crm.web.dto.ScheduleMapper;
import com.lodge.crm.web.response.JqgridResponse;

@Controller
@RequestMapping
public class HomeController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	RecordService recordService;
	
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
	public @ResponseBody JqgridResponse<RecordDto> records(
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
		
		Page<CustomerRecord> records = recordService.findByUserCode(user.getUserCode(), pageRequest);
		List<RecordDto> recordDtos = RecordMapper.map(records);

		JqgridResponse<RecordDto> response = new JqgridResponse<RecordDto>();
		response.setRows(recordDtos);
		response.setRecords(Long.valueOf(records.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(records.getTotalPages()).toString());
		response.setPage(Integer.valueOf(records.getNumber() + 1).toString());

		return response;
	}
	
	
	
	
	@RequestMapping(value = "/publishRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<PublishDto> publishRecords(HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows) {

		Pageable pageRequest = null;
		pageRequest = new PageRequest(page - 1, rows);
		
		Page<Publish> publishs = publishService.findAllActive(pageRequest);
		List<PublishDto> publishDtos = PublishMapper.map(publishs);

		JqgridResponse<PublishDto> response = new JqgridResponse<PublishDto>();
		response.setRows(publishDtos);
		response.setRecords(Long.valueOf(publishs.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(publishs.getTotalPages()).toString());
		response.setPage(Integer.valueOf(publishs.getNumber() + 1).toString());

		return response;
	}
	
	@RequestMapping(value = "/scheduleRecords", produces = "application/json")
	public @ResponseBody List<ScheduleDto> scheduleRecords(HttpServletRequest request,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate) {
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
