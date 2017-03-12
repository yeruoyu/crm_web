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

import com.lodge.crm.core.entity.hibernate.School;
import com.lodge.crm.core.service.SchoolService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.SchoolDto;
import com.lodge.crm.web.dto.SchoolMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/school")
public class SchoolController {

	@Autowired
	SchoolService schoolService;
	
	@RequestMapping(value="schoolList")
	public String gotoSchoolList(){
		return "/school/schoolList";
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<SchoolDto> records(
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

		Page<School> schools = schoolService.findAll(pageRequest);
		List<SchoolDto> schoolDtos = SchoolMapper.map(schools);

		JqgridResponse<SchoolDto> response = new JqgridResponse<SchoolDto>();
		response.setRows(schoolDtos);
		response.setRecords(Long.valueOf(schools.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(schools.getTotalPages()).toString());
		response.setPage(Integer.valueOf(schools.getNumber() + 1).toString());

		return response;
	}

	@RequestMapping(value = "/allSchool", produces = "application/json")
	public @ResponseBody List<SchoolDto> allSchool(){
		List<School> schools = schoolService.findAll();
		List<SchoolDto> schoolDtos = SchoolMapper.map(schools);
		
		return schoolDtos;
	}
	
	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<SchoolDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<School> schools = schoolService.findAll(jqgridFilter,pageRequest);

		List<SchoolDto> schoolDtos = SchoolMapper.map(schools);
		JqgridResponse<SchoolDto> response = new JqgridResponse<SchoolDto>();
		response.setRows(schoolDtos);
		response.setRecords(Long.valueOf(schools.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(schools.getTotalPages()).toString());
		response.setPage(Integer.valueOf(schools.getNumber() + 1).toString());
		return response;
	}
	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String schoolCode,
			@RequestParam String schoolName,
			@RequestParam String schoolComments,
			@RequestParam int schoolStatus) {

		School newSchool = new School();
		newSchool.setSchoolCode(schoolCode);
		newSchool.setSchoolName(schoolName);
		newSchool.setSchoolComments(schoolComments);
		newSchool.setSchoolStatus(schoolStatus);

		Boolean result = schoolService.create(newSchool);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String schoolCode,
			@RequestParam String schoolName,
			@RequestParam String schoolComments,
			@RequestParam int schoolStatus) {

		School exisitSchool = new School();
		exisitSchool.setSchoolCode(schoolCode);
		exisitSchool.setSchoolName(schoolName);
		exisitSchool.setSchoolComments(schoolComments);
		exisitSchool.setSchoolStatus(schoolStatus);

		Boolean result = schoolService.create(exisitSchool);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String schoolCode) {

		School exisitSchool = new School();
		exisitSchool.setSchoolCode(schoolCode);
		Boolean result = true;
		try {
			schoolService.delete(exisitSchool);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
}
