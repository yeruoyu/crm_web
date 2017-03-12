package com.lodge.crm.web.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.lodge.crm.core.entity.hibernate.Channel;

public class ChannelMapper {

	public static ChannelDto map(Channel channel) {
		ChannelDto dto = new ChannelDto();
		
		dto.setChannelCode(channel.getChannelCode());
		dto.setChannelName(channel.getChannelName());
		dto.setChannelCompany(channel.getChannelCompany());
		dto.setChannelAddress(channel.getChannelAddress());
		dto.setChannelComments(channel.getChannelComments());
		
		dto.setContact1Name(channel.getContact1Name());
		dto.setContact1Phone(channel.getContact1Phone());
		dto.setContact1Mobile(channel.getContact1Mobile());
		dto.setContact1Email(channel.getContact1Email());
		dto.setContact1QQ(channel.getContact1QQ());
		dto.setContact1Webchat(channel.getContact1Webchat());
		
		dto.setContact2Name(channel.getContact2Name());
		dto.setContact2Phone(channel.getContact2Phone());
		dto.setContact2Mobile(channel.getContact2Mobile());
		dto.setContact2Email(channel.getContact2Email());
		dto.setContact2QQ(channel.getContact2QQ());
		dto.setContact2Webchat(channel.getContact2Webchat());
		
		return dto;
	}
	
	public static List<ChannelDto> map(List<Channel> channels) {
		List<ChannelDto> dtos = new ArrayList<ChannelDto>();
		for (Channel channel : channels) {
			dtos.add(map(channel));
		}
		return dtos;
	}
	
	public static List<ChannelDto> map(Page<Channel> channels) {
		List<ChannelDto> dtos = new ArrayList<ChannelDto>();
		for (Channel channel : channels) {
			dtos.add(map(channel));
		}
		return dtos;
	}
}
