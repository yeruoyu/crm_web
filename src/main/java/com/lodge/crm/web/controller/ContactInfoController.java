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

import com.lodge.crm.core.entity.hibernate.ContactInfo;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.service.ContactInfoService;
import com.lodge.crm.web.dto.ContactInfoDto;
import com.lodge.crm.web.dto.ContactInfoMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/contactInfo")
public class ContactInfoController {
	
	@Autowired
	ContactInfoService contactInfoService;
	
	/**
	 * 显示客户联系信息
	 * @param search
	 * @param filters
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 * @param customerCode
	 * @return
	 */
	@RequestMapping(value = "/custContacts", produces = "application/json")
	public @ResponseBody JqgridResponse<ContactInfoDto> recRecords(
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

		Page<ContactInfo> contacts = contactInfoService.findContactByCustCode(customerCode, pageRequest);
		List<ContactInfoDto> contactDtos = ContactInfoMapper.map(contacts);
		JqgridResponse<ContactInfoDto> response = new JqgridResponse<ContactInfoDto>();
		response.setRows(contactDtos);
		response.setRecords(Long.valueOf(contacts.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(contacts.getTotalPages()).toString());
		response.setPage(Integer.valueOf(contacts.getNumber() + 1).toString());
		return response;
	}
	
	/**
	 * 添加客户联系信息
	 * @param custCode
	 * @param customerCode
	 * @param contactName
	 * @param contactLocal
	 * @param contactAddress
	 * @param contactZip
	 * @param contactPhone
	 * @param contactMobile
	 * @param contactEmail
	 * @param contactQq
	 * @param contactWebchat
	 * @param contactStatus
	 * @return
	 */
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String custCode,
			@RequestParam String customerCode,
			@RequestParam String contactName,
			@RequestParam String contactLocal,
			@RequestParam String contactAddress,
			@RequestParam String contactZip,
			@RequestParam String contactPhone,
			@RequestParam String contactMobile,
			@RequestParam String contactEmail,
			@RequestParam String contactQq,
			@RequestParam String contactWebchat,
			@RequestParam int contactStatus) {

		if(contactMobile != null && !contactMobile.isEmpty() && checkContact(contactMobile,null).getSuccess()){
			ContactInfo entity = new ContactInfo();
			Customer customer = new Customer();
			customer.setCustomerCode(custCode);
			entity.setCustomer(customer);
			entity.setContactName(contactName);
			entity.setContactLocal(contactLocal);
			entity.setContactAddress(contactAddress);
			entity.setContactZip(contactZip);
			entity.setContactPhone(contactPhone);
			entity.setContactEmail(contactEmail);
			entity.setContactMobile(contactMobile);
			entity.setContactQq(contactQq);
			entity.setContactWebchat(contactWebchat);
			entity.setContactStatus(contactStatus);
	
			Boolean result = contactInfoService.create(entity);
	
			return new StatusResponse(result);
		}else{
			return checkContact(contactMobile,null);
		}
	}
	
	/**
	 * 修改客户联系方式
	 * @param contactId
	 * @param customerCode
	 * @param contactName
	 * @param contactLocal
	 * @param contactAddress
	 * @param contactZip
	 * @param contactPhone
	 * @param contactMobile
	 * @param contactEmail
	 * @param contactQq
	 * @param contactWebchat
	 * @param contactStatus
	 * @return
	 */
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam Long contactId,
			@RequestParam String customerCode,
			@RequestParam String contactName,
			@RequestParam String contactLocal,
			@RequestParam String contactAddress,
			@RequestParam String contactZip,
			@RequestParam String contactPhone,
			@RequestParam String contactMobile,
			@RequestParam String contactEmail,
			@RequestParam String contactQq,
			@RequestParam String contactWebchat,
			@RequestParam Integer contactStatus) {

		if(contactMobile != null && !contactMobile.isEmpty() && checkContact(contactMobile,contactId).getSuccess()){
			ContactInfo entity = new ContactInfo();
			entity.setContactId(contactId);
			Customer customer = new Customer();
			customer.setCustomerCode(customerCode);
			entity.setCustomer(customer);
			entity.setContactName(contactName);
			entity.setContactLocal(contactLocal);
			entity.setContactAddress(contactAddress);
			entity.setContactZip(contactZip);
			entity.setContactPhone(contactPhone);
			entity.setContactEmail(contactEmail);
			entity.setContactMobile(contactMobile);
			entity.setContactQq(contactQq);
			entity.setContactWebchat(contactWebchat);
			entity.setContactStatus(contactStatus);
	
			Boolean result = contactInfoService.update(entity);
			return new StatusResponse(result);
		}else{
			return checkContact(contactMobile,contactId);
		}
	}
	
	private StatusResponse checkContact(String mobile,Long contactId){
		StatusResponse result = new StatusResponse();
		// checkMobile;
		Boolean unquireCheck = this.contactInfoService.checkContactByMobile(mobile,contactId);
		if(!unquireCheck){
			if(contactId==null){
				result.setMessage("手机号已经存在，不能修改为已存在的手机号。");
			}else{
				result.setMessage("手机号已经存在，不能添加为已存在的手机号。");
			}
		}
		result.setSuccess(unquireCheck);

		return result;
	}
}