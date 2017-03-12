package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerProject;
import com.lodge.crm.core.entity.hibernate.Project;
import com.lodge.crm.core.util.DateUtils;

public class CustProjectMapper {
	public static CustProjectDto map(CustomerProject cp) {
		CustProjectDto dto = new CustProjectDto();
		
		dto.setCpId(cp.getCpId());
		dto.setComments(cp.getComments());
		Customer cust = cp.getCustomer();
		if(cust!=null){
			dto.setCustomerCode(cust.getCustomerCode());
			dto.setCustomerName(cust.getCustomerName());
		}
		Project proj = cp.getProject();
		if(proj!=null){
			dto.setProjectCode(proj.getProjectCode());
			dto.setProjectName(proj.getProjectName());
			dto.setProjectPrice(proj.getProjectPrice());
			dto.setProjectStatus(proj.getProjectStatus());
			dto.setCountryName(proj.getCountryName());
			if(proj.getSchool()!=null){
				dto.setSchoolName(proj.getSchool().getSchoolName());
			}
			dto.setStopDate(DateUtils.formatDate(proj.getStopDate()));
			dto.setStartDate(DateUtils.formatDate(proj.getStartDate()));
		}
		
		return dto;
	}
	
	public static List<CustProjectDto> map(Page<CustomerProject> custProjects) {
		List<CustProjectDto> dtos = new ArrayList<CustProjectDto>();
		for (CustomerProject custProject : custProjects) {
			dtos.add(map(custProject));
		}
		return dtos;
	}
	
	public static List<CustProjectDto> map(List<CustomerProject> custProjects) {
		List<CustProjectDto> dtos = new ArrayList<CustProjectDto>();
		for (CustomerProject custProject : custProjects) {
			dtos.add(map(custProject));
		}
		return dtos;
	}
}
