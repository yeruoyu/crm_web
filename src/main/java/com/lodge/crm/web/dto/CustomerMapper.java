package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.util.DateUtils;

public class CustomerMapper {
	public static CustomerDto map(Customer customer) {
		CustomerDto dto = new CustomerDto();
		/** 客户代码，主键 */
		dto.setCustomerCode(customer.getCustomerCode());
		/** 客户姓名 */
		dto.setCustomerName(customer.getCustomerName());
		/** 客户英文名/昵称 */
		dto.setCustomerEName(customer.getCustomerEName());
		/** 客户性别 */
		dto.setCustomerSex(customer.getCustomerSex());
		/** 身份证 */
		dto.setCustomerCredit(customer.getCustomerCredit());
		/** 出生年月 */
		dto.setCustomerBirthday(customer.getCustomerBirthday());
		/** 目前所在学校 */
		dto.setCustomerSchool(customer.getCustomerSchool());		
		/** 现在年级 */
		dto.setCustomerGrade(customer.getCustomerGrade());
		/** 现在年级 */
		dto.setCustomerMajor(customer.getCustomerMajor());
		/** 意向专业  */
		dto.setIntentionMajor(customer.getIntentionMajor());
		/** 意向国家  */
		dto.setIntentionContry(customer.getIntentionContry());
		/** 意向状态  */
		dto.setIntentionStatus(customer.getIntentionStatus());
		/** 负责人 */
		if(customer.getCustomerPrincipal()!=null){
			dto.setPrincipalCode(customer.getCustomerPrincipal().getUserCode());
			dto.setPrincipalName(customer.getCustomerPrincipal().getUserName());
		}
		/** 客户对应渠道 */
		if(customer.getCustomerChannel()!=null){
			dto.setChannelCode(customer.getCustomerChannel().getChannelCode());
			dto.setChannelName(customer.getCustomerChannel().getChannelName());
		}
		
		if(customer.getCustomerGroup()!=null){
			dto.setCustomerGroupCode(customer.getCustomerGroup().getGroupCode());
			dto.setCustomerGroupName(customer.getCustomerGroup().getGroupName());
		}
		
		dto.setCustomerPhone1(customer.getCustomerPhone1());
		
		dto.setCustomerPhone2(customer.getCustomerPhone2());
		
		/** 客户默认手机 ,作为客户唯一性验证*/
		dto.setCustomerMobile1(customer.getCustomerMobile1());
		
		dto.setCustomerMobile2(customer.getCustomerMobile2());
		/** E-Mail */
		dto.setCustomerEmail(customer.getCustomerEmail());
		/** QQ */
		dto.setCustomerQq(customer.getCustomerQq());
		/** 微信 */
		dto.setCustomerWeiChat(customer.getCustomerWeiChat());
		/** 省  */
		dto.setCustomerProvince(customer.getCustomerProvince());
		/** 市  */
		dto.setCustomerCity(customer.getCustomerCity());
		/** 邮编 */
		dto.setCustomerZipcode(customer.getCustomerZipcode());
		/** 地址 */
		dto.setCustomerAddress(customer.getCustomerAddress());
		/** 锁定状态 */
		dto.setCustomerLocked(customer.getCustomerLocked());
		/** 客户备注 */
		dto.setCustomerComments(customer.getCustomerComments());
		/** 客户级别 */
		dto.setCustomerLevel(customer.getCustomerLevel());
		/** 客户状态 */
		dto.setCustomerStatus(customer.getCustomerStatus());
		/** 上门状态 */
		dto.setVisitStatus(customer.getVisitStatus());
		/** 结算状态(未结算:0 -> 已结算:1 -> 已退回:-2) */
		dto.setAccountStatus(customer.getAccountStatus());
		/** 创建人 */
		if(customer.getCreatUser()!=null){
			dto.setCreateUserName(customer.getCreatUser().getUserName());
			dto.setCreateUserCode(customer.getCreatUser().getUserCode());
			
		}
		/** 创建时间 */
		dto.setCreateTime(DateUtils.formatDate(customer.getCreateTime()));
		/** 最后联系时间 */
		dto.setLastContactTime(DateUtils.formatDate(customer.getLastContactTime()));
		
//		// contact info
//		StringBuffer phone = new StringBuffer("~");
//		StringBuffer mobile = new StringBuffer("~");
//		int count = 0;
//		if(customer.getContactInfoList() !=null && customer.getContactInfoList().size()>0){
//			for(ContactInfo contact : customer.getContactInfoList()){
//				if(count>1){
//					break;
//				}
//				count++;
//				if(contact.getContactPhone() !=null && !contact.getContactPhone().isEmpty()){
//					phone.append(",").append(contact.getContactPhone());
//				}
//				if(contact.getContactMobile() !=null && !contact.getContactMobile().isEmpty()){
//					mobile.append(",").append(contact.getContactMobile());
//				}
////				dto.setMobile(mobile.toString().replace("~,", "").replace("~", ""));
////				dto.setPhone(phone.toString().replace("~,", "").replace("~", ""));
//			}
//		}
		
		return dto;
	}
	
	/**
	 * 客户信息转换，根据用户判断是否可以编辑
	 * @param customer
	 * @param user
	 * @return
	 */
	public static CustomerDto map(Customer customer,User user) {
		CustomerDto dto = new CustomerDto();
		/** 客户代码，主键 */
		dto.setCustomerCode(customer.getCustomerCode());
		/** 客户姓名 */
		dto.setCustomerName(customer.getCustomerName());
		/** 客户英文名/昵称 */
		dto.setCustomerEName(customer.getCustomerEName());
		/** 客户性别 */
		dto.setCustomerSex(customer.getCustomerSex());
		/** 身份证 */
		dto.setCustomerCredit(customer.getCustomerCredit());
		/** 出生年月 */
		dto.setCustomerBirthday(customer.getCustomerBirthday());
		/** 目前所在学校 */
		dto.setCustomerSchool(customer.getCustomerSchool());		
		/** 现在年级 */
		dto.setCustomerGrade(customer.getCustomerGrade());
		/** 现在年级 */
		dto.setCustomerMajor(customer.getCustomerMajor());
		/** 意向专业  */
		dto.setIntentionMajor(customer.getIntentionMajor());
		/** 意向国家  */
		dto.setIntentionContry(customer.getIntentionContry());
		/** 意向状态  */
		dto.setIntentionStatus(customer.getIntentionStatus());
		/** 负责人 */
		if(customer.getCustomerPrincipal()!=null){
			dto.setPrincipalCode(customer.getCustomerPrincipal().getUserCode());
			dto.setPrincipalName(customer.getCustomerPrincipal().getUserName());
		}
		/** 客户对应渠道 */
		if(customer.getCustomerChannel()!=null){
			dto.setChannelCode(customer.getCustomerChannel().getChannelCode());
			dto.setChannelName(customer.getCustomerChannel().getChannelName());
		}
		
		if(customer.getCustomerGroup()!=null){
			dto.setCustomerGroupCode(customer.getCustomerGroup().getGroupCode());
			dto.setCustomerGroupName(customer.getCustomerGroup().getGroupName());
		}
		
		dto.setCustomerPhone1(customer.getCustomerPhone1());
		
		dto.setCustomerPhone2(customer.getCustomerPhone2());
		
		/** 客户默认手机 ,作为客户唯一性验证*/
		dto.setCustomerMobile1(customer.getCustomerMobile1());
		
		dto.setCustomerMobile2(customer.getCustomerMobile2());
		/** E-Mail */
		dto.setCustomerEmail(customer.getCustomerEmail());
		/** QQ */
		dto.setCustomerQq(customer.getCustomerQq());
		/** 微信 */
		dto.setCustomerWeiChat(customer.getCustomerWeiChat());
		/** 省  */
		dto.setCustomerProvince(customer.getCustomerProvince());
		/** 市  */
		dto.setCustomerCity(customer.getCustomerCity());
		/** 邮编 */
		dto.setCustomerZipcode(customer.getCustomerZipcode());
		/** 地址 */
		dto.setCustomerAddress(customer.getCustomerAddress());
		/** 锁定状态 */
		dto.setCustomerLocked(customer.getCustomerLocked());
		/** 客户备注 */
		dto.setCustomerComments(customer.getCustomerComments());
		/** 客户级别 */
		dto.setCustomerLevel(customer.getCustomerLevel());
		/** 客户状态 */
		dto.setCustomerStatus(customer.getCustomerStatus());
		/** 结算状态(未结算:0 -> 已结算:1 -> 已退回:-2) */
		dto.setAccountStatus(customer.getAccountStatus());
		/** 上门状态 */
		dto.setVisitStatus(customer.getVisitStatus());
		/** 创建人 */
		if(customer.getCreatUser()!=null){
			dto.setCreateUserName(customer.getCreatUser().getUserName());
			dto.setCreateUserCode(customer.getCreatUser().getUserCode());
			
		}
		/** 创建时间 */
		dto.setCreateTime(DateUtils.formatDate(customer.getCreateTime()));
		/** 最后联系时间 */
		dto.setLastContactTime(DateUtils.formatDate(customer.getLastContactTime()));
		/** 判断用户是否可以编辑 */
		if(user!=null){
			if(user.getUserCode().equals(customer.getCustomerPrincipal().getUserCode())){
				dto.setEditFlag(2); // 可以编辑
			}else if(user.getUserCode().equals(customer.getCreatUser().getUserCode())
					&& customer.getCustomerLocked()==0){
				dto.setEditFlag(1); // 只可以编辑客户信息部分
			} else{
				dto.setEditFlag(0); // 只可以查看
			}
		}else{
			dto.setEditFlag(0); // 只可以查看
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
	
	public static List<CustomerDto> map(Page<Customer> customers,User user){
		List<CustomerDto> dtos = new ArrayList<CustomerDto>();
		for (Customer customer : customers) {
			dtos.add(map(customer));
		}
		return dtos;
	}
}
