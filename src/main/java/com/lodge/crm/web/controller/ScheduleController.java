package com.lodge.crm.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.lodge.crm.core.common.Constants;
import com.lodge.crm.core.entity.hibernate.Schedule;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.DistInfoService;
import com.lodge.crm.core.service.ScheduleService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.DistInfoDto;
import com.lodge.crm.web.dto.DistInfoMapper;
import com.lodge.crm.web.dto.ScheduleDto;
import com.lodge.crm.web.dto.ScheduleMapper;
import com.lodge.crm.web.dto.UserDto;
import com.lodge.crm.web.dto.UserMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService;

	@Autowired
	DistInfoService distInfoService;
	
	@Autowired
	UserService userService;
	
	/** 页面跳转到日程列表  */
	@RequestMapping(value="scheduleList")
	public String gotoScheduleList(){
		return "/schedule/scheduleList";
	}
	
	/** 页面跳转到我的日程列表  */
	@RequestMapping(value = "myScheduleList")
	public String gotoMyScheduleList() {
		return "/schedule/myScheduleList";
	}

	@RequestMapping(value="addSchedule")
	public String gotoAddSchedule(HttpServletRequest request, HttpServletResponse response){
		
		List<DistInfoDto> scheduleTypeDtos = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DIST_TYPE_SCHEDULE));
		
		List<UserDto> userDtos = UserMapper.map(userService.findAll());
		
		UserDto currUser = UserMapper.map((User)request.getSession().getAttribute("user"));
		
		
		request.setAttribute("userDtos", userDtos);
		
		request.setAttribute("currUser", currUser);
		
		request.setAttribute("scheduleTypeDtos", scheduleTypeDtos);
		
		return "/schedule/newSchedule";
	}
	
	/** 跳转到信息查看页面 */
	@RequestMapping(value="scheduleDetail")
	public String gotoScheduleDetail(HttpServletRequest request, HttpServletResponse response
			,@RequestParam Integer scheduleId){
		
		ScheduleDto scheduleDto = ScheduleMapper.map(scheduleService.findOne(scheduleId));

		List<DistInfoDto> scheduleTypeDtos = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DIST_TYPE_SCHEDULE));
		
		List<UserDto> userDtos = UserMapper.map(userService.findAll());
		
		List<Schedule> subScheduleList = scheduleService.findBySchedulePid(scheduleId);
		if(subScheduleList!=null && subScheduleList.size()>0){
			List<User> selectUsers = new ArrayList<User>();
			for(Schedule subSchedule:subScheduleList){
				selectUsers.add(subSchedule.getScheduleUser());
			}
			
			for(UserDto userDto:userDtos){
				for(User selUser:selectUsers){
					if(userDto.getUserCode().equals(selUser.getUserCode())){
						userDto.setSubScheduleFlag(1);
						break;
					}else{
						userDto.setSubScheduleFlag(0);
					}
				}
			}
		}
		
		UserDto currUser = UserMapper.map((User)request.getSession().getAttribute("user"));
		
		request.setAttribute("scheduleTypeDtos", scheduleTypeDtos);
		
		request.setAttribute("userDtos", userDtos);
		
		request.setAttribute("scheduleDto", scheduleDto);

		request.setAttribute("currUser", currUser);
		
		return "/schedule/scheduleDetail";
	}
	
	/** 跳转到编辑页面 */
	@RequestMapping(value="editSchedule")
	public String gotoEditSchedule(HttpServletRequest request, HttpServletResponse response
			,@RequestParam Integer scheduleId){
		
		ScheduleDto scheduleDto = ScheduleMapper.map(scheduleService.findOne(scheduleId));

		List<DistInfoDto> scheduleTypeDtos = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DIST_TYPE_SCHEDULE));
		
		List<UserDto> userDtos = UserMapper.map(userService.findAll());
		
		List<Schedule> subScheduleList = scheduleService.findBySchedulePid(scheduleId);
		if(subScheduleList!=null && subScheduleList.size()>0){
			List<User> selectUsers = new ArrayList<User>();
			for(Schedule subSchedule:subScheduleList){
				selectUsers.add(subSchedule.getScheduleUser());
			}
			
			for(UserDto userDto:userDtos){
				for(User selUser:selectUsers){
					if(userDto.getUserCode().equals(selUser.getUserCode())){
						userDto.setSubScheduleFlag(1);
						break;
					}else{
						userDto.setSubScheduleFlag(0);
					}
				}
			}
		}
		
		UserDto currUser = UserMapper.map((User)request.getSession().getAttribute("user"));

		request.setAttribute("userDtos", userDtos);
		
		request.setAttribute("currUser", currUser);
		
		request.setAttribute("scheduleTypeDtos", scheduleTypeDtos);
		
		request.setAttribute("scheduleDto", scheduleDto);
				
		return "/schedule/editSchedule";
	}
	
	/**
	 * 保存日程信息
	 * @param scheduleDto
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveNewSchedule",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveNewSchedule(@RequestBody ScheduleDto scheduleDto,HttpServletRequest request) {
		StatusResponse result = checkSchedule(scheduleDto);
		
		User sessionUser = (User)request.getSession().getAttribute("user");
		
		if(result.getSuccess()){
			Schedule schedule = ScheduleMapper.dtoToModule(scheduleDto);
			schedule.setCreateUser(sessionUser);
			schedule.setScheduleUser(sessionUser);
			schedule.setCreateTime(DateUtils.getCurrentTimeStamp());
			
			scheduleService.create(schedule);
			
			String[] subUsers = scheduleDto.getUserList().split(",");
			if(subUsers.length>0){
				for (String subUser : subUsers) {
					Schedule subSchedule = new Schedule();
					User user = new User();
					user.setUserCode(subUser);
					
					subSchedule = ScheduleMapper.dtoToModule(scheduleDto);
					
					subSchedule.setCreateUser(sessionUser);
					subSchedule.setScheduleUser(user);
					subSchedule.setSchedulePid(schedule.getScheduleId());
					subSchedule.setCreateTime(DateUtils.getCurrentTimeStamp());
					
					scheduleService.create(subSchedule);
				}
			}
			
		}

		return result;
	}
	
	@RequestMapping(value = "/saveSchedule",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveSchedule(@RequestBody ScheduleDto scheduleDto,HttpServletRequest request) {
		StatusResponse result = checkSchedule(scheduleDto);
		
		User sessionUser = (User)request.getSession().getAttribute("user");
		
		if(result.getSuccess()){
			Schedule schedule = ScheduleMapper.dtoToModule(scheduleDto);
			schedule.setCreateUser(sessionUser);
			schedule.setScheduleUser(sessionUser);
			schedule.setCreateTime(DateUtils.getCurrentTimeStamp());
			
			scheduleService.update(schedule);
			
			//删除指派的日程
			List<Schedule> subSchedules = scheduleService.findBySchedulePid(schedule.getScheduleId());
			scheduleService.deleteInBatch(subSchedules);
			//重新指派
			String[] subUsers = scheduleDto.getUserList().split(",");
			if(subUsers.length>0){
				for (String subUser : subUsers) {
					Schedule subSchedule = new Schedule();
					User user = new User();
					user.setUserCode(subUser);
					
					subSchedule = ScheduleMapper.dtoToModule(scheduleDto);
					subSchedule.setScheduleId(null);
					subSchedule.setCreateUser(sessionUser);
					subSchedule.setScheduleUser(user);
					subSchedule.setSchedulePid(schedule.getScheduleId());
					subSchedule.setCreateTime(DateUtils.getCurrentTimeStamp());
					
					scheduleService.create(subSchedule);
				}
			}
			
		}

		return result;
	}	
	
	/**
	 * 检查日程信息
	 * @param scheduleDto
	 * @return
	 */
	private StatusResponse checkSchedule(ScheduleDto scheduleDto){
		StatusResponse result = new StatusResponse();
		result.setSuccess(true);

		return result;
	}
	
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<ScheduleDto> records(@RequestParam("_search") Boolean search,
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

		Page<Schedule> schedules = scheduleService.findAll(pageRequest);
		List<ScheduleDto> scheduleDtos = ScheduleMapper.map(schedules);

		JqgridResponse<ScheduleDto> response = new JqgridResponse<ScheduleDto>();
		response.setRows(scheduleDtos);
		response.setRecords(Long.valueOf(schedules.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(schedules.getTotalPages()).toString());
		response.setPage(Integer.valueOf(schedules.getNumber() + 1).toString());

		return response;
	}
	
	@RequestMapping(value = "/myRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<ScheduleDto> myRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord, HttpServletRequest request) {

		User user = (User) request.getSession().getAttribute("user");
		
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

		return getFilteredCustRecords(filters, pageRequest, user.getUserCode().toString());
	}
	
	public JqgridResponse<ScheduleDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Schedule> schedules = scheduleService.findAll(jqgridFilter,
				pageRequest);

		List<ScheduleDto> scheduleDtos = ScheduleMapper.map(schedules);
		JqgridResponse<ScheduleDto> response = new JqgridResponse<ScheduleDto>();
		response.setRows(scheduleDtos);
		response.setRecords(Long.valueOf(schedules.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(schedules.getTotalPages()).toString());
		response.setPage(Integer.valueOf(schedules.getNumber() + 1).toString());
		return response;
	}
	
	public JqgridResponse<ScheduleDto> getFilteredCustRecords(String filters, Pageable pageRequest, String userCode) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		if (jqgridFilter == null) {
			jqgridFilter = new JqgridFilter();
			jqgridFilter.setGroupOp("AND");
			jqgridFilter.setRules(new ArrayList<JqgridFilter.Rule>());
		}
		JqgridFilter.Rule rule = new JqgridFilter.Rule();
		rule.setField("scheduleUser");
		rule.setOp("eq");
		rule.setData(userCode);
		List<JqgridFilter.Rule> rules = jqgridFilter.getRules();
		rules.add(rule);
		Page<Schedule> schedules = scheduleService.findAll(jqgridFilter, pageRequest);

		List<ScheduleDto> scheduleDtos = ScheduleMapper.map(schedules);
		JqgridResponse<ScheduleDto> response = new JqgridResponse<ScheduleDto>();
		response.setRows(scheduleDtos);
		response.setRecords(Long.valueOf(schedules.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(schedules.getTotalPages()).toString());
		response.setPage(Integer.valueOf(schedules.getNumber() + 1).toString());
		return response;
	}
}
