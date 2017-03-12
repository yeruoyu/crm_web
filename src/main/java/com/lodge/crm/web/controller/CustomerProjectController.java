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

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerProject;
import com.lodge.crm.core.entity.hibernate.Project;
import com.lodge.crm.core.service.CustomerProjectService;
import com.lodge.crm.web.dto.CustProjectDto;
import com.lodge.crm.web.dto.CustProjectMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping(value = "/custProject")
public class CustomerProjectController {

	@Autowired
	CustomerProjectService customerProjectService;

	@RequestMapping(value = "/custProjects", produces = "application/json")
	public @ResponseBody JqgridResponse<CustProjectDto> recRecords(@RequestParam("_search") Boolean search,
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

		Page<CustomerProject> custProjects = customerProjectService.findByCustomerCode(customerCode, pageRequest);
		List<CustProjectDto> custProjectDtos = CustProjectMapper.map(custProjects);
		JqgridResponse<CustProjectDto> response = new JqgridResponse<CustProjectDto>();
		response.setRows(custProjectDtos);
		response.setRecords(Long.valueOf(custProjects.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(custProjects.getTotalPages()).toString());
		response.setPage(Integer.valueOf(custProjects.getNumber() + 1).toString());
		return response;
	}

	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(HttpServletRequest request, @RequestParam String custCode,
			@RequestParam String customerCode, @RequestParam String projectCode, @RequestParam String comments) {
		CustomerProject entity = new CustomerProject();
		Customer customer = new Customer();
		customer.setCustomerCode(custCode);

		Project project = new Project();
		project.setProjectCode(projectCode);

		entity.setProject(project);
		entity.setCustomer(customer);
		entity.setComments(comments);

		Boolean result = customerProjectService.create(entity);

		return new StatusResponse(result);

	}

	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(HttpServletRequest request, @RequestParam Long cpId,
			@RequestParam String customerCode, @RequestParam String projectCode, @RequestParam String comments) {

		CustomerProject entity = new CustomerProject();
		Customer customer = new Customer();
		customer.setCustomerCode(customerCode);

		Project project = new Project();
		project.setProjectCode(projectCode);

		entity.setCpId(cpId);
		entity.setProject(project);
		entity.setCustomer(customer);
		entity.setComments(comments);

		Boolean result = customerProjectService.create(entity);

		return new StatusResponse(result);
	}
}
