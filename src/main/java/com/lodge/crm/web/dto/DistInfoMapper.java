package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.DistInfo;

public class DistInfoMapper {
	public static DistInfoDto map(DistInfo distInfo) {
		DistInfoDto dto = new DistInfoDto();
		
		dto.setDistId(distInfo.getDistId());
		dto.setDistType(distInfo.getDistType());
		dto.setDistCode(distInfo.getDistCode());
		dto.setDistValue(distInfo.getDistValue());
		dto.setDistRemark(distInfo.getDistRemark());
				
		return dto;
	}

	public static List<DistInfoDto> map(Page<DistInfo> distInfos) {
		List<DistInfoDto> dtos = new ArrayList<DistInfoDto>();
		for (DistInfo distInfo : distInfos) {
			dtos.add(map(distInfo));
		}
		return dtos;
	}
	
	public static List<DistInfoDto> map(List<DistInfo> distInfos) {
		List<DistInfoDto> dtos = new ArrayList<DistInfoDto>();
		for (DistInfo distInfo : distInfos) {
			dtos.add(map(distInfo));
		}
		return dtos;
	}
}
