package com.lodge.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.lodge.crm.core.entity.hibernate.Course;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.CourseService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.CourseDto;
import com.lodge.crm.web.dto.CourseMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping(value = "/course")
public class CourseController {
	@Autowired
	CourseService courseService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TableKeyService tableKeyService;
	
	@RequestMapping(value="courseList")
	public String gotoCourseList(){
		return "/course/courseList";
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<CourseDto> records(
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

		Page<Course> courses = courseService.findAll(pageRequest);
		List<CourseDto> courseDtos = CourseMapper.map(courses);

		JqgridResponse<CourseDto> response = new JqgridResponse<CourseDto>();
		response.setRows(courseDtos);
		response.setRecords(Long.valueOf(courses.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(courses.getTotalPages()).toString());
		response.setPage(Integer.valueOf(courses.getNumber() + 1).toString());

		return response;
	}

	@RequestMapping(value = "/allCourse", produces = "application/json")
	public @ResponseBody List<CourseDto> allCourse(){
		List<Course> courses = courseService.findAll();
		List<CourseDto> courseDtos = CourseMapper.map(courses);
		
		return courseDtos;
	}
	
	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<CourseDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Course> courses = courseService.findAll(jqgridFilter,pageRequest);

		List<CourseDto> courseDtos = CourseMapper.map(courses);
		JqgridResponse<CourseDto> response = new JqgridResponse<CourseDto>();
		response.setRows(courseDtos);
		response.setRecords(Long.valueOf(courses.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(courses.getTotalPages()).toString());
		response.setPage(Integer.valueOf(courses.getNumber() + 1).toString());
		return response;
	}
	
	@RequestMapping(value="addCourse")
	public String addCourse(HttpServletRequest request){

		return "/course/newCourse";
	}
	
	@RequestMapping(value = "/createCourse", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestBody CourseDto courseDto,HttpServletRequest request) {

		String courseCode =  tableKeyService.getNewCode("CO");
		User sessionUser = (User)request.getSession().getAttribute("user");
		
		Course newCourse = new Course();

		newCourse.setCourseCode(courseCode);
		newCourse.setCourseName(courseDto.getCourseName());
		newCourse.setCourseContent(courseDto.getCourseContent());
		newCourse.setCourseHour(Integer.valueOf(courseDto.getCourseHour()));
		newCourse.setCoursePrice(courseDto.getCoursePrice());
		newCourse.setCourseRemark(courseDto.getCourseRemark());
		newCourse.setCourseStatus(Integer.valueOf(courseDto.getCourseStatus()));
		newCourse.setCreatUser(sessionUser);
		newCourse.setCreateTime(DateUtils.getCurrentTimeStamp());
		newCourse.setUpdateUser(sessionUser);
		newCourse.setUpdateTime(DateUtils.getCurrentTimeStamp());
		
		Boolean result = this.courseService.create(newCourse);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String courseCode,
			@RequestParam String courseName,
			@RequestParam int courseStatus) {

		Course exisitCourse = new Course();
		exisitCourse.setCourseCode(courseCode);
		exisitCourse.setCourseName(courseName);
		exisitCourse.setCourseStatus(courseStatus);

		Boolean result = courseService.create(exisitCourse);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String courseCode) {

		Course exisitCourse = new Course();
		exisitCourse.setCourseCode(courseCode);
		Boolean result = true;
		try {
			courseService.delete(exisitCourse);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
}
