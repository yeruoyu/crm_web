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

import com.lodge.crm.core.entity.hibernate.Teacher;
import com.lodge.crm.core.service.TeacherService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.TeacherDto;
import com.lodge.crm.web.dto.TeacherMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	TeacherService teacherService;
	
	@RequestMapping(value="teacherList")
	public String gotoTeacherList(){
		return "/teacher/teacherList";
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<TeacherDto> records(
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

		Page<Teacher> teachers = teacherService.findAll(pageRequest);
		List<TeacherDto> teacherDtos = TeacherMapper.map(teachers);

		JqgridResponse<TeacherDto> response = new JqgridResponse<TeacherDto>();
		response.setRows(teacherDtos);
		response.setRecords(Long.valueOf(teachers.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(teachers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(teachers.getNumber() + 1).toString());

		return response;
	}
	
	@RequestMapping(value = "/allTeacher", produces = "application/json")
	public @ResponseBody List<TeacherDto> allTeacher(){
		List<Teacher> teachers = teacherService.findAll();
		List<TeacherDto> teacherDtos = TeacherMapper.map(teachers);
		
		return teacherDtos;
	}
	
	public JqgridResponse<TeacherDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Teacher> teachers = teacherService.findAll(jqgridFilter,pageRequest);

		List<TeacherDto> teacherDtos = TeacherMapper.map(teachers);
		JqgridResponse<TeacherDto> response = new JqgridResponse<TeacherDto>();
		response.setRows(teacherDtos);
		response.setRecords(Long.valueOf(teachers.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(teachers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(teachers.getNumber() + 1).toString());
		return response;
	}
	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String teacherCode,
			@RequestParam String teacherName,

			@RequestParam int teacherStatus) {

		Teacher newTeacher = new Teacher();
		newTeacher.setTeacherCode(teacherCode);
		newTeacher.setTeacherName(teacherName);

		newTeacher.setTeacherStatus(teacherStatus);

		Boolean result = teacherService.create(newTeacher);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String teacherCode,
			@RequestParam String teacherName,
			@RequestParam int teacherStatus) {

		Teacher exisitTeacher = new Teacher();
		exisitTeacher.setTeacherCode(teacherCode);
		exisitTeacher.setTeacherName(teacherName);

		exisitTeacher.setTeacherStatus(teacherStatus);

		Boolean result = teacherService.create(exisitTeacher);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String teacherCode) {

		Teacher exisitTeacher = new Teacher();
		exisitTeacher.setTeacherCode(teacherCode);
		Boolean result = true;
		try {
			teacherService.delete(exisitTeacher);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
}
