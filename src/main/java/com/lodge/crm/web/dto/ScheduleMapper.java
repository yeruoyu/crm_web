package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Schedule;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.util.DateUtils;

public class ScheduleMapper {
	
	public static Schedule dtoToModule(ScheduleDto dto){
		Schedule schedule = new Schedule();
		User user = new User();
		
		schedule.setScheduleId(dto.getScheduleId());
		schedule.setScheduleType(dto.getScheduleType());
		schedule.setScheduleTitle(dto.getScheduleTitle());
		schedule.setScheduleDetail(dto.getScheduleDetail());
		schedule.setScheduleStartTime(DateUtils.parseTimestampHour(dto.getScheduleStartTime()));
		schedule.setScheduleEndTime(DateUtils.parseTimestampHour(dto.getScheduleEndTime()));
		schedule.setScheduleStatus(dto.getScheduleStatus());
		
		user.setUserCode(dto.getScheduleUserCode());
		schedule.setScheduleUser(user);
		return schedule;
	}
	
	public static ScheduleDto map(Schedule schedule) {
		ScheduleDto dto = new ScheduleDto();

		dto.setScheduleId(schedule.getScheduleId());
		dto.setScheduleType(schedule.getScheduleType());
		dto.setScheduleTitle(schedule.getScheduleTitle());
		dto.setScheduleDetail(schedule.getScheduleDetail());
		dto.setScheduleStartTime(DateUtils.formatDateByDet(schedule.getScheduleStartTime()));
		dto.setScheduleEndTime(DateUtils.formatDateByDet(schedule.getScheduleEndTime()));

		dto.setScheduleStatus(schedule.getScheduleStatus());
		
		if(schedule.getScheduleUser() !=null){
			User user=schedule.getScheduleUser();
			dto.setScheduleUserCode(user.getUserCode());
			dto.setScheduleUserName(user.getUserName());
		}
		
		if(schedule.getCreateUser() !=null){
			User user=schedule.getCreateUser();
			dto.setCreatorCode(user.getUserCode());
			dto.setCreatorName(user.getUserName());
		}
		
		return dto;
	}
	
	public static List<ScheduleDto> map(Page<Schedule> schedules) {
		List<ScheduleDto> dtos = new ArrayList<ScheduleDto>();
		for (Schedule schedule : schedules) {
			dtos.add(map(schedule));
		}
		return dtos;
	}
	
	public static List<ScheduleDto> map(List<Schedule> schedules) {
		List<ScheduleDto> dtos = new ArrayList<ScheduleDto>();
		for (Schedule schedule : schedules) {
			dtos.add(map(schedule));
		}
		return dtos;
	}
}
