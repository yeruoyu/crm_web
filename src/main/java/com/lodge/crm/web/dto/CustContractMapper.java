package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerContract;
import com.lodge.crm.core.util.DateUtils;

public class CustContractMapper {
	public static CustContractDto map(CustomerContract cc) {
		CustContractDto dto = new CustContractDto();
		
		dto.setCcId(cc.getCcId());
		dto.setComments(cc.getComments());
		dto.setContractCode(cc.getContractCode());
		dto.setSignedTime(DateUtils.formatDateByDeatail(cc.getSignedTime()));
		
		Customer cust = cc.getCustomer();
		if(cust!=null){
			dto.setCustomerCode(cust.getCustomerCode());
			dto.setCustomerName(cust.getCustomerName());
		}
		return dto;
	}
	
	public static List<CustContractDto> map(Page<CustomerContract> ccs) {
		List<CustContractDto> dtos = new ArrayList<CustContractDto>();
		for (CustomerContract cc : ccs) {
			dtos.add(map(cc));
		}
		return dtos;
	}
	
	public static List<CustContractDto> map(List<CustomerContract> ccs) {
		List<CustContractDto> dtos = new ArrayList<CustContractDto>();
		for (CustomerContract cc : ccs) {
			dtos.add(map(cc));
		}
		return dtos;
	}
}
