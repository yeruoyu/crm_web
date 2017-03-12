package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.ContactInfo;

public class ContactInfoMapper {
	public static ContactInfoDto map(ContactInfo contact) {
		ContactInfoDto dto = new ContactInfoDto();

		dto.setContactId(contact.getContactId());
		dto.setContactName(contact.getContactName());
		dto.setContactLocal(contact.getContactLocal());
		dto.setContactAddress(contact.getContactAddress());
		dto.setContactPhone(contact.getContactPhone());
		dto.setContactMobile(contact.getContactMobile());
		dto.setContactEmail(contact.getContactEmail());
		dto.setContactQq(contact.getContactQq());
		dto.setContactWebchat(contact.getContactWebchat());
		dto.setContactZip(contact.getContactZip());
		dto.setContactStatus(contact.getContactStatus());
		
		if(contact.getCustomer() !=null){
			dto.setCustomerCode(contact.getCustomer().getCustomerCode());
		}
		
		return dto;
	}
	
	public static List<ContactInfoDto> map(Page<ContactInfo> contactInfos) {
		List<ContactInfoDto> dtos = new ArrayList<ContactInfoDto>();
		for (ContactInfo contactInfo : contactInfos) {
			dtos.add(map(contactInfo));
		}
		return dtos;
	}
	
	public static List<ContactInfoDto> map(List<ContactInfo> contactInfos) {
		List<ContactInfoDto> dtos = new ArrayList<ContactInfoDto>();
		for (ContactInfo contactInfo : contactInfos) {
			dtos.add(map(contactInfo));
		}
		return dtos;
	}
}
