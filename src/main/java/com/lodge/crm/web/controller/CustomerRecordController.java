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
import com.lodge.crm.core.entity.hibernate.CustomerRecord;
import com.lodge.crm.core.entity.hibernate.Schedule;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.RecordService;
import com.lodge.crm.core.service.ScheduleService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.web.dto.RecordDto;
import com.lodge.crm.web.dto.RecordMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping(value="/custRecord")
public class CustomerRecordController {

	@Autowired
	RecordService recordService;
	@Autowired
	CustomerService customerService;
	@Autowired
	ScheduleService scheduleService;
	
	/**
	 * 显示客户联系记录信息
	 * @param search
	 * @param filters
	 * @param page
	 * @param rows
	 * @param sidx
	 * @param sord
	 * @param customerCode
	 * @return
	 */
	@RequestMapping(value = "/custRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<RecordDto> recRecords(
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

		Page<CustomerRecord> custRecords = recordService.findByCustomerCode(customerCode, pageRequest);
		List<RecordDto> recordDtos = RecordMapper.map(custRecords);
		JqgridResponse<RecordDto> response = new JqgridResponse<RecordDto>();
		response.setRows(recordDtos);
		response.setRecords(Long.valueOf(custRecords.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(custRecords.getTotalPages()).toString());
		response.setPage(Integer.valueOf(custRecords.getNumber() + 1).toString());
		return response;
	}
	
	/**
	 * 添加客户的联系信息
	 * @param request
	 * @param custCode
	 * @param customerCode
	 * @param recordType
	 * @param recordTime
	 * @param recordComment
	 * @param recordPhone
	 * @param recordResult
	 * @param recordAddress
	 * @return
	 */
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			HttpServletRequest request,
			@RequestParam String custCode,
			@RequestParam String customerCode,
			@RequestParam String recordType,
			@RequestParam String recordTime,
			@RequestParam String recordNTime,
			@RequestParam String recordComment,
			//@RequestParam String recordPhone,
			@RequestParam String recordResult
			//@RequestParam String recordAddress,
			//@RequestParam String recordName
			) {
			User user= (User)request.getSession().getAttribute("user");
			CustomerRecord entity = new CustomerRecord();
			Customer customer = customerService.findOne(custCode);
			customer.setLastContactTime(DateUtils.parseDate(recordTime));
			
			//entity.setRecordName(recordName);
			entity.setRecordCustomer(customer);
			entity.setRecordType(recordType);
			entity.setRecordTime(DateUtils.parseTimestamp(recordTime));
			entity.setRecordNTime(recordNTime);
			entity.setRecordComment(recordComment);
			//entity.setRecordPhone(recordPhone);
			entity.setRecordResult(recordResult);
			//entity.setRecordAddress(recordAddress);
		
		
			entity.setRecordUser(user);
			Boolean result = recordService.create(entity);
			result = customerService.update(customer);
			if(recordNTime!=null && !recordNTime.isEmpty()){
				this.newSchedule(custCode, entity, user); //增加一条活动日程
			}
			return new StatusResponse(result);
		
	}
	
	/**
	 * 修改客户的联系信息
	 * @param request
	 * @param recordId
	 * @param customerCode
	 * @param recordType
	 * @param recordTime
	 * @param recordComment
	 * @param recordPhone
	 * @param recordResult
	 * @param recordAddress
	 * @return
	 */
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			HttpServletRequest request,
			@RequestParam Long recordId,
			@RequestParam String customerCode,
			@RequestParam String recordType,
			@RequestParam String recordTime,
			@RequestParam String recordNTime,
			@RequestParam String recordComment,
			// @RequestParam String recordPhone,
			@RequestParam String recordResult
			// @RequestParam String recordAddress,
			//@RequestParam String recordName
			) {
		
			User user= (User)request.getSession().getAttribute("user");
			CustomerRecord entity = new CustomerRecord();
			Customer customer = new Customer();
			customer.setCustomerCode(customerCode);
			entity.setRecordId(recordId);
			//entity.setRecordName(recordName);
			entity.setRecordCustomer(customer);
			entity.setRecordType(recordType);
			entity.setRecordTime(DateUtils.parseTimestamp(recordTime));
			entity.setRecordNTime(recordNTime);
			entity.setRecordComment(recordComment);
			//entity.setRecordPhone(recordPhone);
			entity.setRecordResult(recordResult);
			//entity.setRecordAddress(recordAddress);
		
			entity.setRecordUser(user);
			Boolean result = recordService.update(entity);
			
			return new StatusResponse(result);
	}
	
	private void newSchedule(String customerCode,CustomerRecord record,User user){
		Schedule schedule = new Schedule();
		
		schedule.setScheduleType("HFRC");
		schedule.setScheduleTitle("客户["+customerCode+"]回访");
		schedule.setScheduleDetail("客户["+customerCode+"]回访");
		schedule.setScheduleStartTime(DateUtils.parseTimestamp(record.getRecordNTime()));
		schedule.setScheduleEndTime(DateUtils.parseTimestamp(record.getRecordNTime()));
		schedule.setScheduleStatus(1);
		schedule.setCreateUser(user);
		schedule.setScheduleUser(user);
		schedule.setCreateTime(DateUtils.getCurrentTimeStamp());
		
		scheduleService.create(schedule);
	}
}
