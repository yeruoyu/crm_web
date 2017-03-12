package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.ContactInfo;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.User;

public class CustomerMapper {
	public static CustomerDto map(Customer customer) {
		CustomerDto dto = new CustomerDto();

		dto.setCustomerCode(customer.getCustomerCode());
		dto.setCustomerName(customer.getCustomerName());
		dto.setCustomerLevel(customer.getCustomerLevel());

		dto.setCustomerStatus(customer.getCustomerStatus());
		dto.setCustomerLocked(customer.getCustomerLocked());
		dto.setCustomerComments(customer.getCustomerComments());
		dto.setCustomerMobile(customer.getCustomerMobile());
		dto.setCustomerCourse(customer.getCustomerCourse());
		
		if(customer.getChannel() !=null){
			dto.setChannelCode(customer.getChannel().getChannelCode());
		}
		
		if(customer.getGroup()!=null){
			dto.setGroupCode(customer.getGroup().getSchoolCode());
		}
		
		if(customer.getLastUser() !=null){
			User user=customer.getLastUser();
			dto.setUserCode(user.getUserCode());
			dto.setUserName(user.getUserName());
		}
		
		// contact info
		StringBuffer phone = new StringBuffer("~");
		StringBuffer mobile = new StringBuffer("~");
		int count = 0;
		if(customer.getContactInfoList() !=null && customer.getContactInfoList().size()>0){
			for(ContactInfo contact : customer.getContactInfoList()){
				if(count>1){
					break;
				}
				count++;
				if(contact.getContactPhone() !=null && !contact.getContactPhone().isEmpty()){
					phone.append(",").append(contact.getContactPhone());
				}
				if(contact.getContactMobile() !=null && !contact.getContactMobile().isEmpty()){
					mobile.append(",").append(contact.getContactMobile());
				}
				dto.setMobile(mobile.toString().replace("~,", "").replace("~", ""));
				dto.setPhone(phone.toString().replace("~,", "").replace("~", ""));
			}
		}
		
		return dto;
	}

	public static List<CustomerDto> map(Page<Customer> customers) {
		List<CustomerDto> dtos = new ArrayList<CustomerDto>();
		for (Customer customer : customers) {
			dtos.add(map(customer));
		}
		return dtos;
	}
}
