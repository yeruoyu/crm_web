package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Activity;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerActivity;
import com.lodge.crm.core.util.DateUtils;

public class CustActivityMapper {
	public static CustActivityDto map(CustomerActivity ca) {
		CustActivityDto dto = new CustActivityDto();
		
		dto.setCaId(ca.getCaId());
		dto.setComments(ca.getComments());
		dto.setAttendStatus(ca.getAttendStatus());
		
		Customer cust = ca.getCustomer();
		if(cust!=null){
			dto.setCustomerCode(cust.getCustomerCode());
			dto.setCustomerName(cust.getCustomerName());
		}
		
		Activity activity = ca.getActivity();
		if(activity!=null){
			dto.setActivityCode(activity.getActivityCode());
			dto.setActivityTitle(activity.getActivityTitle());
			dto.setActivityAddress(activity.getActivityAddress());
			dto.setActivityStartDate(DateUtils.formatDate(activity.getActivityStartDate()));
			dto.setActivityStopDate(DateUtils.formatDate(activity.getActivityStopDate()));
			dto.setActivityStatus(activity.getActivityStatus());
		}

		return dto;
	}
	
	public static List<CustActivityDto> map(Page<CustomerActivity> custActivitys) {
		List<CustActivityDto> dtos = new ArrayList<CustActivityDto>();
		for (CustomerActivity custActivity : custActivitys) {
			dtos.add(map(custActivity));
		}
		return dtos;
	}
	
	public static List<CustActivityDto> map(List<CustomerActivity> custActivitys) {
		List<CustActivityDto> dtos = new ArrayList<CustActivityDto>();
		for (CustomerActivity custActivity : custActivitys) {
			dtos.add(map(custActivity));
		}
		return dtos;
	}
}