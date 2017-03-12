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

import com.lodge.crm.core.entity.hibernate.Country;
import com.lodge.crm.core.service.CountryService;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.CountryDto;
import com.lodge.crm.web.dto.CountryMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

@Controller
@RequestMapping("/country")
public class CountryController {
	@Autowired
	CountryService countryService;
	
	@RequestMapping(value="countryList")
	public String gotoSchoolList(){
		return "/school/countryList";
	}
	
	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<CountryDto> records(
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

		Page<Country> countrys = countryService.findAll(pageRequest);
		List<CountryDto> countryDtos = CountryMapper.map(countrys);

		JqgridResponse<CountryDto> response = new JqgridResponse<CountryDto>();
		response.setRows(countryDtos);
		response.setRecords(Long.valueOf(countrys.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(countrys.getTotalPages()).toString());
		response.setPage(Integer.valueOf(countrys.getNumber() + 1).toString());

		return response;
	}
	
	@RequestMapping(value = "/allCountry", produces = "application/json")
	public @ResponseBody List<CountryDto> allCountry(){
		List<Country> countries = countryService.findAll();
		List<CountryDto> countryDtos = CountryMapper.map(countries);
		
		return countryDtos;
	}

	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<CountryDto> getFilteredRecords(String filters,
			Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Country> countrys = countryService.findAll(jqgridFilter,pageRequest);

		List<CountryDto> countryDtos = CountryMapper.map(countrys);
		JqgridResponse<CountryDto> response = new JqgridResponse<CountryDto>();
		response.setRows(countryDtos);
		response.setRecords(Long.valueOf(countrys.getTotalElements())
				.toString());
		response.setTotal(Integer.valueOf(countrys.getTotalPages()).toString());
		response.setPage(Integer.valueOf(countrys.getNumber() + 1).toString());
		return response;
	}
	
	@RequestMapping(value = "/create", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse create(
			@RequestParam String countryCode,
			@RequestParam String countryName) {

		Country newCountry = new Country();
		newCountry.setCountryCode(countryCode);
		newCountry.setCountryName(countryName);

		Boolean result = countryService.create(newCountry);

		return new StatusResponse(result);
	}
	
	@RequestMapping(value = "/update", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse update(
			@RequestParam String countryCode,
			@RequestParam String countryName) {

		Country exisitCountry = new Country();
		exisitCountry.setCountryCode(countryCode);
		exisitCountry.setCountryName(countryName);

		Boolean result = countryService.create(exisitCountry);

		return new StatusResponse(result);
	}

	@RequestMapping(value = "/delete", produces = "application/json", method = RequestMethod.POST)
	public @ResponseBody StatusResponse delete(@RequestParam String countryCode) {

		Country exisitCountry = new Country();
		exisitCountry.setCountryCode(countryCode);;
		Boolean result = true;
		try {
			countryService.delete(exisitCountry);
		} catch (Exception e) {
			result = false;
		}
		return new StatusResponse(result);
	}
}
