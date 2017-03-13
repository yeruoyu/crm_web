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

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerContract;
import com.lodge.crm.core.service.CustomerContractService;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.web.dto.CustContractDto;
import com.lodge.crm.web.dto.CustContractMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping(value="/custContract")
public class CustomerContractController {
	@Autowired
	CustomerContractService customerContractService;
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/custContracts", produces = "application/json")
	public @ResponseBody JqgridResponse<CustContractDto> recRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord,
			@RequestParam(value = "customerCode", required = false) String customerCode) {

		Pageable pageRequest = null;
		Sort sort = null;
		if (sidx != null && !sidx.equals("")) {
			if (sord.equals("desc")) {
				sort = new Sort(Sort.Direction.DESC, sidx);
			} else {
				sort = new Sort(Sort.Direction.ASC, sidx);
			}
			pageRequest = new PageRequest(page - 1, rows, sort);
		} else {
			pageRequest = new PageRequest(page - 1, rows);
		}

		Page<CustomerContract> custContracts = customerContractService.findByCustomerCode(customerCode, pageRequest);
		List<CustContractDto> custContractDtos = CustContractMapper.map(custContracts);
		JqgridResponse<CustContractDto> response = new JqgridResponse<CustContractDto>();
		response.setRows(custContractDtos);
		response.setRecords(Long.valueOf(custContracts.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(custContracts.getTotalPages()).toString());
		response.setPage(Integer.valueOf(custContracts.getNumber() + 1).toString());
		return response;
	}
	
	@RequestMapping(value="/create", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String custCode,
			@RequestParam String customerCode,
			@RequestParam String contractCode,
			@RequestParam String signedTime,
			@RequestParam String comments) {
		
		Customer customer = new Customer();
		customer.setCustomerCode(custCode);
		CustomerContract custContract = new CustomerContract();
		custContract.setComments(comments);
		custContract.setContractCode(contractCode);
		custContract.setCustomer(customer);
		custContract.setSignedTime(DateUtils.parseTimestamp(signedTime));
		Boolean result = customerContractService.create(custContract);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value="/update", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam Long ccId,
			@RequestParam String customerCode,
			@RequestParam String contractCode,
			@RequestParam String signedTime,
			@RequestParam String comments) {
		
		Customer customer = this.customerService.findOne(customerCode);
		CustomerContract custContract = new CustomerContract();
		custContract.setCcId(ccId);
		custContract.setComments(comments);
		custContract.setContractCode(contractCode);
		custContract.setCustomer(customer);
		custContract.setSignedTime(DateUtils.parseTimestamp(signedTime));
		
		Boolean result = customerContractService.update(custContract);
		return new StatusResponse(result);
	}
	
	@RequestMapping(value="/delete", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse delete(
			@RequestParam Long ccId) {

		CustomerContract custContract = new CustomerContract();
		custContract.setCcId(ccId);
		Boolean result = true;
		try{
			customerContractService.delete(custContract);
		}catch(Exception e){
			result = false;
		}
		return new StatusResponse(result);
	}
}
