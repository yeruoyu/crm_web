package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerRecord;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.util.DateUtils;

public class RecordMapper {

	public static RecordDto map(CustomerRecord record) {
		RecordDto dto = new RecordDto();
		
		dto.setRecordId(record.getRecordId());
		dto.setRecordType(record.getRecordType());
		dto.setRecordResult(record.getRecordResult());
		dto.setRecordPhone(record.getRecordPhone());
		dto.setRecordAddress(record.getRecordAddress());
		dto.setRecordTime(DateUtils.formatDateByDet(record.getRecordTime()));
		dto.setRecordComment(record.getRecordComment());

		if(record.getRecordCustomer() !=null){
			Customer customer = record.getRecordCustomer();
			dto.setCustomerCode(customer.getCustomerCode());
			dto.setCustomerName(customer.getCustomerName());
			dto.setRecordName(customer.getCustomerName());
		}
		
		if(record.getRecordName()!=null && !record.getRecordName().isEmpty()){
			dto.setRecordName(record.getRecordName());
		}
		
		if(record.getRecordUser() !=null){
			User user = record.getRecordUser();
			dto.setUserCode(user.getUserCode());
			dto.setUserName(user.getUserName());
		}
		
		return dto;
	}
	
	public static List<RecordDto> map(Page<CustomerRecord> records) {
		List<RecordDto> dtos = new ArrayList<RecordDto>();
		for (CustomerRecord record : records) {
			dtos.add(map(record));
		}
		return dtos;
	}
}
