package com.lodge.crm.web.controller;

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

import com.lodge.crm.core.entity.hibernate.Publish;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.PublishService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.PublishDto;
import com.lodge.crm.web.dto.PublishMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/publish")
public class PublishController {
	
	@Autowired
	PublishService publishService;
	
	/** 页面跳转到公告列表  */
	@RequestMapping(value="publishList")
	public String gotoRoleList(){
		return "/publish/publishList";
	}
	
	/** 页面跳转到添加公告 */
	@RequestMapping(value="addPublish")
	public String gotoAddPublish(HttpServletRequest request, HttpServletResponse response){
		return "/publish/newPublish";
	}
	
	/** 跳转到明细页面 */
	@RequestMapping(value="publishDetail")
	public String gotoPublishDetail(HttpServletRequest request, HttpServletResponse response
			,@RequestParam Integer publishId){
		PublishDto publishDto = PublishMapper.map(publishService.findOne(publishId));
		request.setAttribute("publishDto", publishDto);
		return "/publish/publishDetail";
	}
	
	/** 跳转到编辑页面 */
	@RequestMapping(value="editPublish")
	public String gotoEditPublish(HttpServletRequest request, HttpServletResponse response
			,@RequestParam Integer publishId){
		PublishDto publishDto = PublishMapper.map(publishService.findOne(publishId));
		request.setAttribute("publishDto", publishDto);
		return "/publish/editPublish";
	}
	
	/**
	 * 保存新公告信息
	 * @param publishDto
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveNewPublish",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveNewPublish(@RequestBody PublishDto publishDto,HttpServletRequest request) {
		User sessionUser = (User)request.getSession().getAttribute("user");
		StatusResponse result = checkPublish(publishDto);
		if(result.getSuccess()){
			Publish publish = PublishMapper.dtoToModule(publishDto);

			publish.setPublishCUser(sessionUser);
			publish.setPublishCTime(DateUtils.getCurrentTimeStamp());
			publish.setPublishUUser(sessionUser);
			publish.setPublishUTime(DateUtils.getCurrentTimeStamp());
			publishService.create(publish);
		}
		return result;
	}
	
	/**
	 * 修改公告信息
	 * @param publishDto
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/savePublish",method = RequestMethod.POST)
	public @ResponseBody StatusResponse savePublish(@RequestBody PublishDto publishDto,HttpServletRequest request) {
		User sessionUser = (User)request.getSession().getAttribute("user");
		StatusResponse result = checkPublish(publishDto);
		if(result.getSuccess()){
			Publish publish = PublishMapper.dtoToModule(publishDto);

			publish.setPublishUUser(sessionUser);
			publish.setPublishUTime(DateUtils.getCurrentTimeStamp());
			publishService.update(publish);
		}
		return result;
	}
	
	/**
	 * 检查公告信息
	 * @param publishDto
	 * @return
	 */
	private StatusResponse checkPublish(PublishDto publishDto){
		StatusResponse result = new StatusResponse();
		result.setSuccess(true);

		return result;
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<PublishDto> records(@RequestParam("_search") Boolean search,
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

		Page<Publish> publishs = publishService.findAll(pageRequest);
		List<PublishDto> publishDtos = PublishMapper.map(publishs);

		JqgridResponse<PublishDto> response = new JqgridResponse<PublishDto>();
		response.setRows(publishDtos);
		response.setRecords(Long.valueOf(publishs.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(publishs.getTotalPages()).toString());
		response.setPage(Integer.valueOf(publishs.getNumber() + 1).toString());

		return response;
	}
	
	public JqgridResponse<PublishDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Publish> publishs = publishService.findAll(jqgridFilter,
				pageRequest);

		List<PublishDto> publishDtos = PublishMapper.map(publishs);
		JqgridResponse<PublishDto> response = new JqgridResponse<PublishDto>();
		response.setRows(publishDtos);
		response.setRecords(Long.valueOf(publishs.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(publishs.getTotalPages()).toString());
		response.setPage(Integer.valueOf(publishs.getNumber() + 1).toString());
		return response;
	}
}
