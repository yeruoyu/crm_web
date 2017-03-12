package com.lodge.crm.web.controller;

import java.util.List;

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

import com.lodge.crm.core.entity.hibernate.Project;
import com.lodge.crm.core.entity.hibernate.School;
import com.lodge.crm.core.service.ProjectService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.ProjectDto;
import com.lodge.crm.web.dto.ProjectMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;


@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	TableKeyService tableKeyService;
	
	/**
	 * 跳转到项目信息列表页面
	 * @return
	 */
	@RequestMapping(value="projectList")
	public String gotoProjectList(){
		return "/project/projectList";
	}
	
	
	
	@RequestMapping
	public String getProjectPage() {
		return "project";
	}
	
	@RequestMapping(value="/records", produces="application/json")
	public @ResponseBody JqgridResponse<ProjectDto> records(
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
		
		if (search == true) {
			return getFilteredRecords(filters, pageRequest);
		}
		
		Page<Project> projects = projectService.findAll(pageRequest);
		List<ProjectDto> projectDtos = ProjectMapper.map(projects);
		
		JqgridResponse<ProjectDto> response = new JqgridResponse<ProjectDto>();
		response.setRows(projectDtos);
		response.setRecords(Long.valueOf(projects.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(projects.getTotalPages()).toString());
		response.setPage(Integer.valueOf(projects.getNumber()+1).toString());
		
		return response;
	}
			
	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<ProjectDto> getFilteredRecords(String filters, Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		
		Page<Project> projects = projectService.findAll(jqgridFilter, pageRequest);
		
		List<ProjectDto> projectDtos = ProjectMapper.map(projects);
		JqgridResponse<ProjectDto> response = new JqgridResponse<ProjectDto>();
		response.setRows(projectDtos);
		response.setRecords(Long.valueOf(projects.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(projects.getTotalPages()).toString());
		response.setPage(Integer.valueOf(projects.getNumber()+1).toString());
		return response;
	}
	
	@RequestMapping(value="/get", produces="application/json")
	public @ResponseBody ProjectDto get(@RequestBody ProjectDto project) {
		return ProjectMapper.map(projectService.findOne(project.getProjectCode()));
	}

	@RequestMapping(value="/create", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String projectCode,
			@RequestParam String projectName,
			@RequestParam String projectDesc,
			@RequestParam Double projectPrice,
			@RequestParam Integer projectStatus,
			@RequestParam String startDate,
			@RequestParam String stopDate,
			@RequestParam String countryName,
			@RequestParam String schoolCode) {
		
		Project newProject = new Project();
		//newProject.setProjectId(projectId);
		//String projectCode =  tableKeyService.getNewCode("P");
		
		newProject.setProjectCode(projectCode);
		newProject.setProjectName(projectName);
		newProject.setProjectDesc(projectDesc);
		newProject.setProjectPrice(projectPrice);
		newProject.setProjectStatus(projectStatus);
		newProject.setStartDate(DateUtils.parseDate(startDate));
		newProject.setStopDate(DateUtils.parseDate(stopDate));
		newProject.setCountryName(countryName);
		School school = new School(schoolCode);
		newProject.setSchool(school);
		
		Boolean result = projectService.create(newProject);
		
		return new StatusResponse(result);
	}
	
	@RequestMapping(value="/update", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String projectCode,
			@RequestParam String projectName,
			@RequestParam String projectDesc,
			@RequestParam Double projectPrice,
			@RequestParam Integer projectStatus,
			@RequestParam String startDate,
			@RequestParam String stopDate,
			@RequestParam String countryName,
			@RequestParam String schoolCode) {
		
		Project existingProject = new Project();
		existingProject.setProjectCode(projectCode);
		existingProject.setProjectName(projectName);
		existingProject.setProjectDesc(projectDesc);
		existingProject.setProjectPrice(projectPrice);
		existingProject.setProjectStatus(projectStatus);
		existingProject.setStartDate(DateUtils.parseDate(startDate));
		existingProject.setStopDate(DateUtils.parseDate(stopDate));
		existingProject.setCountryName(countryName);
		School school = new School(schoolCode);
		existingProject.setSchool(school);
		Boolean result = projectService.update(existingProject);
		
		return new StatusResponse(result);
	}
	
	@RequestMapping(value="/delete", produces="application/json", method=RequestMethod.POST)
	public @ResponseBody StatusResponse delete(
			@RequestParam String projectCode) {

		Project existingProject = new Project();
		existingProject.setProjectCode(projectCode);
		Boolean result = true;
		try{
			projectService.delete(existingProject);
		}catch(Exception e){
			result = false;
		}
		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/enableProject", produces = "application/json")
	public @ResponseBody List<ProjectDto> enableProject(){
		List<Project> projects = projectService.findEnableProject();
		List<ProjectDto> projectDtos = ProjectMapper.map(projects);
		
		return projectDtos;
	}
}
