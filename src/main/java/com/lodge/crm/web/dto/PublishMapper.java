package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Publish;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.util.DateUtils;

public class PublishMapper {
	public static Publish dtoToModule(PublishDto dto){
		Publish publish = new Publish();
		User user = new User();
		if(dto.getPublishId()!=null){
			publish.setPublishId(dto.getPublishId());
		}
		publish.setPublishTitle(dto.getPublishTitle());
		publish.setPublishDetail(dto.getPublishDetail());
		publish.setPublishStatus(dto.getPublishStatus());
		if(dto.getPublishCTime()!=null && !dto.getPublishCTime().isEmpty()){
			publish.setPublishCTime(DateUtils.parseTimestampHour(dto.getPublishCTime()));
		}
		
		if(dto.getPublishCTime()!=null && !dto.getPublishCTime().isEmpty()){
			publish.setPublishCTime(DateUtils.parseTimestampHour(dto.getPublishCTime()));
		}
		if(dto.getPublishCUserCode()!=null && !dto.getPublishCUserCode().isEmpty()){
			user.setUserCode(dto.getPublishCUserCode());
			publish.setPublishCUser(user);
		}

		return publish;
	}
	
	public static PublishDto map(Publish publish) {
		PublishDto dto = new PublishDto();

		dto.setPublishId(publish.getPublishId());
		dto.setPublishTitle(publish.getPublishTitle());
		dto.setPublishDetail(publish.getPublishDetail());
		dto.setPublishCTime(DateUtils.formatDateByDet(publish.getPublishCTime()));
		dto.setPublishUTime(DateUtils.formatDateByDet(publish.getPublishUTime()));
		dto.setPublishStatus(publish.getPublishStatus());
		
		if(publish.getPublishCUser()!=null){
			dto.setPublishCUserCode(publish.getPublishCUser().getUserCode());
			dto.setPublishCUserName(publish.getPublishCUser().getUserName());
		}
		
		if(publish.getPublishUUser()!=null){
			dto.setPublishUUserCode(publish.getPublishUUser().getUserCode());
			dto.setPublishUUserName(publish.getPublishUUser().getUserName());
		}

		return dto;
	}
	
	public static List<PublishDto> map(Page<Publish> publishs) {
		List<PublishDto> dtos = new ArrayList<PublishDto>();
		for (Publish publish : publishs) {
			dtos.add(map(publish));
		}
		return dtos;
	}
	
	public static List<PublishDto> map(List<Publish> publishs) {
		List<PublishDto> dtos = new ArrayList<PublishDto>();
		for (Publish publish : publishs) {
			dtos.add(map(publish));
		}
		return dtos;
	}
}
