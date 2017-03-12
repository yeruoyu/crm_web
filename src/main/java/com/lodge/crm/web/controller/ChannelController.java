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

import com.lodge.crm.core.entity.hibernate.Channel;
import com.lodge.crm.core.service.ChannelService;
import com.lodge.crm.web.dto.ChannelDto;
import com.lodge.crm.web.dto.ChannelMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/channel")
public class ChannelController {

	@Autowired
	ChannelService channelService;
	
	@RequestMapping(value="channelList")
	public String gotoProjectList(){
		return "/channel/channelList";
	}
	
	@RequestMapping(value="/records", produces="application/json")
	public @ResponseBody JqgridResponse<ChannelDto> records(
    		@RequestParam("_search") Boolean search,
    		@RequestParam(value="filters", required=false) String filters,
    		@RequestParam(value="page", required=false) Integer page,
    		@RequestParam(value="rows", required=false) Integer rows,
    		@RequestParam(value="sidx", required=false) String sidx,
    		@RequestParam(value="sord", required=false) String sord) {
		
		Pageable pageRequest =null;
		if(sidx != null && !sidx.equals("")){
			Sort sort = null;
			if(sord.equals("desc")){
				sort = new Sort(Sort.Direction.DESC, sidx);
			}else{
				sort = new Sort(Sort.Direction.ASC, sidx);
			}	
			pageRequest= new PageRequest(page-1, rows, sort);
		}else{
			pageRequest= new PageRequest(page-1, rows);
		}
		
		Page<Channel> channels = channelService.findAll(pageRequest);
		
		List<ChannelDto> channelDtos = ChannelMapper.map(channels);
		
		JqgridResponse<ChannelDto> response = new JqgridResponse<ChannelDto>();
		response.setRows(channelDtos);
		response.setRecords(Long.valueOf(channels.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(channels.getTotalPages()).toString());
		response.setPage(Integer.valueOf(channels.getNumber()+1).toString());
		
		return response;
	}
	
	@RequestMapping(value="/allChannel", produces="application/json")
	public @ResponseBody List<ChannelDto> allChannel(){
		List<Channel> channels = channelService.findAll();
		List<ChannelDto> channelDtos = ChannelMapper.map(channels);
		return channelDtos;
	}
	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String channelCode,
			@RequestParam String channelName,
			@RequestParam String channelCompany,
			@RequestParam String channelAddress,
			@RequestParam String channelComments,
			@RequestParam String contact1Name,
			@RequestParam String contact1Phone,
			@RequestParam String contact1Mobile,
			@RequestParam String contact1Email,
			@RequestParam String contact1QQ,
			@RequestParam String contact1Webchat,
			@RequestParam String contact2Name,
			@RequestParam String contact2Phone,
			@RequestParam String contact2Mobile,
			@RequestParam String contact2Email,
			@RequestParam String contact2QQ,
			@RequestParam String contact2Webchat) {

		Channel newChannel = new Channel();

		newChannel.setChannelCode(channelCode);
		newChannel.setChannelName(channelName);
		newChannel.setChannelCompany(channelCompany);
		newChannel.setChannelAddress(channelAddress);
		newChannel.setChannelComments(channelComments);

		newChannel.setContact1Name(contact1Name);
		newChannel.setContact1Phone(contact1Phone);
		newChannel.setContact1Mobile(contact1Mobile);
		newChannel.setContact1Email(contact1Email);
		newChannel.setContact1QQ(contact1QQ);
		newChannel.setContact1Webchat(contact1Webchat);

		newChannel.setContact2Name(contact2Name);
		newChannel.setContact2Phone(contact2Phone);
		newChannel.setContact2Mobile(contact2Mobile);
		newChannel.setContact2Email(contact2Email);
		newChannel.setContact2QQ(contact2QQ);
		newChannel.setContact2Webchat(contact2Webchat);

		Boolean result = channelService.create(newChannel);
		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String channelCode,
			@RequestParam String channelName,
			@RequestParam String channelCompany,
			@RequestParam String channelAddress,
			@RequestParam String channelComments,
			@RequestParam String contact1Name,
			@RequestParam String contact1Phone,
			@RequestParam String contact1Mobile,
			@RequestParam String contact1Email,
			@RequestParam String contact1QQ,
			@RequestParam String contact1Webchat,
			@RequestParam String contact2Name,
			@RequestParam String contact2Phone,
			@RequestParam String contact2Mobile,
			@RequestParam String contact2Email,
			@RequestParam String contact2QQ,
			@RequestParam String contact2Webchat) {

		Channel exisiChannel = new Channel();
		
		exisiChannel.setChannelCode(channelCode);
		exisiChannel.setChannelName(channelName);
		exisiChannel.setChannelCompany(channelCompany);
		exisiChannel.setChannelAddress(channelAddress);
		exisiChannel.setChannelComments(channelComments);

		exisiChannel.setContact1Name(contact1Name);
		exisiChannel.setContact1Phone(contact1Phone);
		exisiChannel.setContact1Mobile(contact1Mobile);
		exisiChannel.setContact1Email(contact1Email);
		exisiChannel.setContact1QQ(contact1QQ);
		exisiChannel.setContact1Webchat(contact1Webchat);

		exisiChannel.setContact2Name(contact2Name);
		exisiChannel.setContact2Phone(contact2Phone);
		exisiChannel.setContact2Mobile(contact2Mobile);
		exisiChannel.setContact2Email(contact2Email);
		exisiChannel.setContact2QQ(contact2QQ);
		exisiChannel.setContact2Webchat(contact2Webchat);

		Boolean result = channelService.update(exisiChannel);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String channelCode) {

		Channel exisitChannel = new Channel();
		exisitChannel.setChannelCode(channelCode);
		Boolean result = true;
		try {
			channelService.delete(exisitChannel);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
	
}
