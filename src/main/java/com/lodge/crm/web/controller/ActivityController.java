package com.lodge.crm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lodge.crm.core.entity.hibernate.Activity;
import com.lodge.crm.core.service.ActivityService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.ActivityDto;
import com.lodge.crm.web.dto.ActivityMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	ActivityService activityService;

	@Autowired
	TableKeyService tableKeyService;
	
	/**
	 * 跳转到项目信息列表页面
	 * @return
	 */
	@RequestMapping(value="activityList")
	public String gotoActivityList(){
		return "/activity/activityList";
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<ActivityDto> records(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord) {

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

		if (search == true) {
			return getFilteredRecords(filters, pageRequest);
		}

		Page<Activity> activitys = activityService.findAll(pageRequest);
		List<ActivityDto> activityDtos = ActivityMapper.map(activitys);

		JqgridResponse<ActivityDto> response = new JqgridResponse<ActivityDto>();
		response.setRows(activityDtos);
		response.setRecords(Long.valueOf(activitys.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(activitys.getTotalPages()).toString());
		response.setPage(Integer.valueOf(activitys.getNumber() + 1).toString());

		return response;
	}

	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<ActivityDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Activity> activitys = activityService.findAll(jqgridFilter,
				pageRequest);

		List<ActivityDto> activityDtos = ActivityMapper.map(activitys);
		JqgridResponse<ActivityDto> response = new JqgridResponse<ActivityDto>();
		response.setRows(activityDtos);
		response.setRecords(Long.valueOf(activitys.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(activitys.getTotalPages()).toString());
		response.setPage(Integer.valueOf(activitys.getNumber() + 1).toString());
		return response;
	}

	@RequestMapping(value = "/get", produces = "application/json")
	public @ResponseBody ActivityDto get(@RequestBody ActivityDto activity) {
		return ActivityMapper.map(activityService.findOne(activity
				.getActivityCode()));
	}

	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String activityTitle,
			@RequestParam String activityDesc,
			@RequestParam String activityAddress,
			@RequestParam String activityStartDate,
			@RequestParam String activityStopDate,
			@RequestParam int activityAccount,
			@RequestParam int activityStatus) {

		Activity newActivity = new Activity();
		
		String activityCode =  tableKeyService.getNewCode("A");
		
		newActivity.setActivityCode(activityCode);
		newActivity.setActivityTitle(activityTitle);
		newActivity.setActivityDesc(activityDesc);
		newActivity.setActivityAddress(activityAddress);
		newActivity.setActivityStartDate(DateUtils.parseTimestampHour(activityStartDate));
		newActivity.setActivityStopDate(DateUtils.parseTimestampHour(activityStopDate));
		newActivity.setActivityAccount(activityAccount);
		newActivity.setActivityStatus(activityStatus);

		Boolean result = activityService.create(newActivity);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String activityCode,
			@RequestParam String activityTitle,
			@RequestParam String activityDesc,
			@RequestParam String activityAddress,
			@RequestParam String activityStartDate,
			@RequestParam String activityStopDate,
			@RequestParam int activityAccount,
			@RequestParam int activityStatus) {

		Activity exisitActivity = new Activity();
		exisitActivity.setActivityCode(activityCode);
		exisitActivity.setActivityTitle(activityTitle);
		exisitActivity.setActivityDesc(activityDesc);
		exisitActivity.setActivityAddress(activityAddress);
		exisitActivity.setActivityStartDate(DateUtils.parseTimestampHour(activityStartDate));
		exisitActivity.setActivityStopDate(DateUtils.parseTimestampHour(activityStopDate));
		exisitActivity.setActivityAccount(activityAccount);
		exisitActivity.setActivityStatus(activityStatus);

		Boolean result = activityService.create(exisitActivity);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String activityCode) {

		Activity exisitActivity = new Activity();
		exisitActivity.setActivityCode(activityCode);
		Boolean result = true;
		try {
			activityService.delete(exisitActivity);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}

	@RequestMapping(value = "/enableActivity", produces = "application/json")
	public @ResponseBody List<ActivityDto> enableActivity(){
		List<Activity> activitys = activityService.findEnableActivity();
		List<ActivityDto> activityDtos = ActivityMapper.map(activitys);
		
		return activityDtos;
	}
}
