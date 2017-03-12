package com.lodge.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.lodge.crm.core.entity.hibernate.Activity;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerActivity;
import com.lodge.crm.core.service.CustomerActivityService;
import com.lodge.crm.web.dto.CustActivityDto;
import com.lodge.crm.web.dto.CustActivityMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping(value="/custActivity")
public class CustomerActivityController {
	
	@Autowired
	CustomerActivityService customerActivityService;
	
	@RequestMapping(value = "/custActivitys", produces = "application/json")
	public @ResponseBody JqgridResponse<CustActivityDto> recRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord,
			@RequestParam(value = "customerCode", required = false) String customerCode) {

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

		Page<CustomerActivity> custActivitys = customerActivityService.findByCustomerCode(customerCode, pageRequest);
		List<CustActivityDto> custActivityDtos = CustActivityMapper.map(custActivitys);
		JqgridResponse<CustActivityDto> response = new JqgridResponse<CustActivityDto>();
		response.setRows(custActivityDtos);
		response.setRecords(Long.valueOf(custActivitys.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(custActivitys.getTotalPages()).toString());
		response.setPage(Integer.valueOf(custActivitys.getNumber() + 1).toString());
		return response;
	}
	

	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(HttpServletRequest request, @RequestParam String custCode,
			@RequestParam String customerCode, @RequestParam String activityCode, @RequestParam String comments) {
		CustomerActivity entity = new CustomerActivity();
		Customer customer = new Customer();
		customer.setCustomerCode(custCode);

		Activity activity = new Activity();
		activity.setActivityCode(activityCode);

		entity.setActivity(activity);
		entity.setCustomer(customer);
		entity.setComments(comments);

		Boolean result = customerActivityService.create(entity);

		return new StatusResponse(result);

	}

	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(@RequestParam Long caId,
			@RequestParam String customerCode, @RequestParam String activityCode, @RequestParam String comments) {

		CustomerActivity entity = new CustomerActivity();
		Customer customer = new Customer();
		customer.setCustomerCode(customerCode);

		Activity activity = new Activity();
		activity.setActivityCode(activityCode);

		entity.setCaId(caId);
		entity.setActivity(activity);
		entity.setCustomer(customer);
		entity.setComments(comments);

		Boolean result = customerActivityService.update(entity);

		return new StatusResponse(result);
	}
}
