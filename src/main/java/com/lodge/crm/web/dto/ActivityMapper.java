package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Activity;
import com.lodge.crm.core.util.DateUtils;

public class ActivityMapper {
	public static ActivityDto map(Activity activity) {
		ActivityDto dto = new ActivityDto();
		dto.setActivityCode(activity.getActivityCode());
		dto.setActivityTitle(activity.getActivityTitle());
		dto.setActivityDesc(activity.getActivityDesc());
		dto.setActivityAddress(activity.getActivityAddress());
		dto.setActivityStartDate(DateUtils.formatDateByDet(activity.getActivityStartDate()));
		dto.setActivityStopDate(DateUtils.formatDateByDet(activity.getActivityStopDate()));
		dto.setActivityAccount(activity.getActivityAccount());
		dto.setActivityStatus(activity.getActivityStatus());
		
		return dto;
	}

	public static List<ActivityDto> map(Page<Activity> activitys) {
		List<ActivityDto> dtos = new ArrayList<ActivityDto>();
		for (Activity activity : activitys) {
			dtos.add(map(activity));
		}
		return dtos;
	}
	
	public static List<ActivityDto> map(List<Activity> activitys) {
		List<ActivityDto> dtos = new ArrayList<ActivityDto>();
		for (Activity activity : activitys) {
			dtos.add(map(activity));
		}
		return dtos;
	}
}
