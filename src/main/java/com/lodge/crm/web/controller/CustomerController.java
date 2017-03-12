package com.lodge.crm.web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import org.springframework.web.multipart.MultipartFile;

import com.lodge.crm.core.common.Constants;
import com.lodge.crm.core.entity.hibernate.Channel;
import com.lodge.crm.core.entity.hibernate.ContactInfo;
import com.lodge.crm.core.entity.hibernate.Customer;
import com.lodge.crm.core.entity.hibernate.CustomerUser;
import com.lodge.crm.core.entity.hibernate.School;
import com.lodge.crm.core.entity.hibernate.User;
import com.lodge.crm.core.service.ChannelService;
import com.lodge.crm.core.service.CustomerService;
import com.lodge.crm.core.service.DistInfoService;
import com.lodge.crm.core.service.SchoolService;
import com.lodge.crm.core.service.TableKeyService;
import com.lodge.crm.core.service.UserService;
import com.lodge.crm.core.util.DateUtils;
import com.lodge.crm.core.util.JqgridFilter;
import com.lodge.crm.core.util.JqgridObjectMapper;
import com.lodge.crm.web.dto.ChannelDto;
import com.lodge.crm.web.dto.ChannelMapper;
import com.lodge.crm.web.dto.CustomerDto;
import com.lodge.crm.web.dto.CustomerMapper;
import com.lodge.crm.web.dto.DistInfoDto;
import com.lodge.crm.web.dto.DistInfoMapper;
import com.lodge.crm.web.dto.SchoolDto;
import com.lodge.crm.web.dto.SchoolMapper;
import com.lodge.crm.web.dto.UserDto;
import com.lodge.crm.web.dto.UserMapper;
import com.lodge.crm.web.response.JqgridResponse;
import com.lodge.crm.web.response.StatusResponse;

/**
 * 客户信息 Controller
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@Autowired
	ChannelService channelService;

	@Autowired
	SchoolService schoolService;

	@Autowired
	UserService userService;
	
	@Autowired
	TableKeyService tableKeyService;
	
	@Autowired
	DistInfoService distInfoService;
	
	/**
	 * 跳转到客户信息列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "customerList")
	public String gotoCustomerList() {
		return "/customer/customerList";
	}

	/**
	 * 跳转到我的客户信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "myCustomerList")
	public String gotoMyCustomerList() {
		return "/customer/myCustomerList";
	}

	@RequestMapping(value = "/records", produces = "application/json")
	public @ResponseBody JqgridResponse<CustomerDto> records(@RequestParam("_search") Boolean search,
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

		Page<Customer> customers = customerService.findAll(pageRequest);
		List<CustomerDto> customerDtos = CustomerMapper.map(customers);

		JqgridResponse<CustomerDto> response = new JqgridResponse<CustomerDto>();
		response.setRows(customerDtos);
		response.setRecords(Long.valueOf(customers.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(customers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(customers.getNumber() + 1).toString());

		return response;
	}

	/**
	 * Helper method for returning filtered records
	 */
	public JqgridResponse<CustomerDto> getFilteredRecords(String filters, Pageable pageRequest) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);

		Page<Customer> customers = customerService.findAll(jqgridFilter, pageRequest);

		List<CustomerDto> customerDtos = CustomerMapper.map(customers);
		JqgridResponse<CustomerDto> response = new JqgridResponse<CustomerDto>();
		response.setRows(customerDtos);
		response.setRecords(Long.valueOf(customers.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(customers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(customers.getNumber() + 1).toString());
		return response;
	}

	@RequestMapping(value = "/myRecords", produces = "application/json")
	public @ResponseBody JqgridResponse<CustomerDto> custRecords(@RequestParam("_search") Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord, HttpServletRequest request) {

		User user = (User) request.getSession().getAttribute("user");

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

		return getFilteredCustRecords(filters, pageRequest, user.getUserCode().toString());
	}

	public JqgridResponse<CustomerDto> getFilteredCustRecords(String filters, Pageable pageRequest, String userCode) {
		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		if (jqgridFilter == null) {
			jqgridFilter = new JqgridFilter();
			jqgridFilter.setGroupOp("AND");
			jqgridFilter.setRules(new ArrayList<JqgridFilter.Rule>());
		}
		JqgridFilter.Rule rule = new JqgridFilter.Rule();
		rule.setField("userCode");
		rule.setOp("eq");
		rule.setData(userCode);
		List<JqgridFilter.Rule> rules = jqgridFilter.getRules();
		rules.add(rule);
		Page<Customer> customers = customerService.findAll(jqgridFilter, pageRequest);

		List<CustomerDto> customerDtos = CustomerMapper.map(customers);
		JqgridResponse<CustomerDto> response = new JqgridResponse<CustomerDto>();
		response.setRows(customerDtos);
		response.setRecords(Long.valueOf(customers.getTotalElements()).toString());
		response.setTotal(Integer.valueOf(customers.getTotalPages()).toString());
		response.setPage(Integer.valueOf(customers.getNumber() + 1).toString());
		return response;
	}

	/**
	 * 跳转到客户明细页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "customerDetail")
	public String gotoCustomerDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String customerCode) {
		CustomerDto customerDto = CustomerMapper.map(customerService.findOne(customerCode));
		List<ChannelDto> channelDtos = ChannelMapper.map(channelService.findAll());
		List<SchoolDto> schoolDtos = SchoolMapper.map(schoolService.findAll());

		List<DistInfoDto> curseDtos = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DIST_TYPE_COURSE));
		
		request.setAttribute("customerDto", customerDto);
		request.setAttribute("schoolDtos", schoolDtos);
		request.setAttribute("channelDtos", channelDtos);
		request.setAttribute("curseDtos", curseDtos);

		return "/customer/customerDetail";
	}

	/**
	 * 跳转到客户编辑页面(包括添加，修改)
	 * @return
	 */
	@RequestMapping(value="customerEdit")
	public String gotoCustomerEdit(HttpServletRequest request,HttpServletResponse response){
	
		String customerCode = request.getParameter("customerCode");
		List<ChannelDto> channelDtos = ChannelMapper.map(channelService.findAll());
		List<SchoolDto> schoolDtos = SchoolMapper.map(schoolService.findAll());
		List<UserDto> userDtos = UserMapper.map(userService.findAll());
		List<DistInfoDto> curseDtos = DistInfoMapper.map(
				distInfoService.findDistInfoByType(Constants.DIST_TYPE_COURSE));
		request.setAttribute("schoolDtos", schoolDtos);
		request.setAttribute("channelDtos", channelDtos);
		request.setAttribute("userDtos", userDtos);
		request.setAttribute("curseDtos", curseDtos);
		
		if(customerCode!=null && !customerCode.isEmpty()){
			CustomerDto customerDto = CustomerMapper.map(customerService.findOne(customerCode));
			request.setAttribute("customerEdit", true);
			request.setAttribute("customerDto", customerDto);

		}else{
			request.setAttribute("customerEdit", false);
		}
		return "/customer/customerEdit";
	}

	/**
	 * 编辑客户信息(包括添加，修改)，跳转到修改后的客户明细信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveCustomer",method = RequestMethod.POST)
	public @ResponseBody StatusResponse saveCustomer(@RequestBody CustomerDto customerDto,HttpServletRequest request) {
		StatusResponse result = checkCustomer(customerDto);
		
		User sessionUser = (User)request.getSession().getAttribute("user");
		
		
		if(result.getSuccess()){
			// 没有CustomerCode，则为创建
			if(customerDto.getCustomerCode()==null || customerDto.getCustomerCode().isEmpty()){
				// 获取Customer Code
				String custCode =  tableKeyService.getNewCode("C");
				Customer newCustomer = new Customer();
				newCustomer.setCustomerCode(custCode);
				newCustomer.setCustomerName(customerDto.getCustomerName());
				newCustomer.setCustomerComments(customerDto.getCustomerComments());
				newCustomer.setCustomerMobile(customerDto.getCustomerMobile());
				// 对应用户
				if(customerDto.getUserCode()!=null &&!customerDto.getUserCode().isEmpty()){
					User user =this.userService.findOne(customerDto.getUserCode());
					user.setUserCode(customerDto.getUserCode());
					newCustomer.setLastUser(user );
				}else{
					newCustomer.setLastUser(null);
				}

				// 渠道
				if(customerDto.getChannelCode()!=null &&!customerDto.getChannelCode().isEmpty()){
					Channel channel = this.channelService.findOne(customerDto.getChannelCode());
					channel.setChannelCode(customerDto.getChannelCode());
					newCustomer.setChannel(channel);
				}
				// 团队
				if(customerDto.getGroupCode()!=null &&!customerDto.getGroupCode().isEmpty()){
					School school = this.schoolService.findOne(customerDto.getGroupCode());
					school.setSchoolCode(customerDto.getGroupCode());
					newCustomer.setGroup(school);
				}
				// 创建人，创建时间，修改人，修改时间
				newCustomer.setCreatUserCode(sessionUser.getUserCode());
				newCustomer.setCreateTime(DateUtils.getCurrentTimeStamp());
				newCustomer.setUpdateUserCode(sessionUser.getUserCode());
				newCustomer.setUpdateTime(DateUtils.getCurrentTimeStamp());
				newCustomer.setCustomerLocked(customerDto.getCustomerLocked());
				// 状态
				newCustomer.setCustomerStatus(customerDto.getCustomerStatus());
				newCustomer.setAccountStatus(0);
				
				// 根据用户手机号，添加一条基本的联系方式
				List<ContactInfo> contactList = new ArrayList<ContactInfo>();
				ContactInfo contact = new ContactInfo();
				contact.setCustomer(newCustomer);
				contact.setContactName(customerDto.getCustomerName());
				contact.setContactMobile(customerDto.getCustomerMobile());
				contactList.add(contact);
				newCustomer.setContactInfoList(contactList);
				this.customerService.create(newCustomer);
				
			}else{
				Customer exisitCustomer = this.customerService.findOne(customerDto.getCustomerCode());
				exisitCustomer.setCustomerName(customerDto.getCustomerName());
				exisitCustomer.setCustomerComments(customerDto.getCustomerComments());
				exisitCustomer.setCustomerMobile(customerDto.getCustomerMobile());
				exisitCustomer.setCustomerLocked(customerDto.getCustomerLocked());

				// 对应用户
				if(customerDto.getUserCode()!=null &&!customerDto.getUserCode().isEmpty()){
					User user =this.userService.findOne(customerDto.getUserCode());
					user.setUserCode(customerDto.getUserCode());
					exisitCustomer.setLastUser(user );
				}else{
					exisitCustomer.setLastUser(null);
				}

				// 渠道
				if(customerDto.getChannelCode()!=null &&!customerDto.getChannelCode().isEmpty()){
					Channel channel = this.channelService.findOne(customerDto.getChannelCode());
					channel.setChannelCode(customerDto.getChannelCode());
					exisitCustomer.setChannel(channel);
				}
				// 团队
				if(customerDto.getGroupCode()!=null &&!customerDto.getGroupCode().isEmpty()){
					School school = this.schoolService.findOne(customerDto.getGroupCode());
					school.setSchoolCode(customerDto.getGroupCode());
					exisitCustomer.setGroup(school);
				}
				// 状态
				exisitCustomer.setCustomerStatus(customerDto.getCustomerStatus());
				// 创建人，创建时间，修改人，修改时间
				exisitCustomer.setUpdateUserCode(sessionUser.getUserCode());
				exisitCustomer.setUpdateTime(DateUtils.getCurrentTimeStamp());
				this.customerService.update(exisitCustomer);
				request.setAttribute("customerEdit", true);
			}
		}
		
		return result;
	}

	private StatusResponse checkCustomer(CustomerDto customer){
		StatusResponse result = new StatusResponse();
		// checkMobile;
		boolean unquireCheck = this.customerService.checkCustomerUnquire(customer.getCustomerCode(),customer.getCustomerMobile());
		if(!unquireCheck){
			if(customer.getCustomerCode()!=null && !customer.getCustomerCode().isEmpty()){
				result.setMessage("手机号已经存在，不能修改成相同的手机号。");
			}else{
				result.setMessage("客户已经存在，不能再次添加。");
			}
		}
		result.setSuccess(unquireCheck);

		return result;
	}
	
	/**
	 * 锁定用户
	 * @param customerCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/lockCustomer",method = RequestMethod.POST)
	public @ResponseBody StatusResponse lockCustomer(@RequestParam String customerCode,HttpServletRequest request){
		StatusResponse result = new StatusResponse(true);
		
		Customer customer = this.customerService.findOne(customerCode);
		User user = (User)request.getSession().getAttribute("user");
		if(customer!=null){
			if(!customer.getCustomerStatus().equals(Constants._ACTIVE)){
				result.setMessage("客户已无效，无法锁定。");
				result.setSuccess(false);
				return result;
			}
			if(customer.getCustomerLocked().equals(Constants._LOCKED)){
				result.setMessage("客户已被锁定，无法锁定。");
				result.setSuccess(false);
				return result;
			}
			
			CustomerUser cu = new CustomerUser();
			cu.setLockCustomer(customer);
			cu.setLockUser(user);
			cu.setLockDate(DateUtils.getCurrentSytemTimeForTimestamp());
			cu.setLockStatus(Constants._LOCKED);
			
			List<CustomerUser> list = customer.getLockHistoryList();
			if(list ==null){
				list = new ArrayList<CustomerUser>();
			}
			list.add(cu);
			customer.setLockHistoryList(list);
			
			customer.setCustomerLocked(Constants._LOCKED);

			customer.setLastUser(user);
			result.setSuccess(this.customerService.update(customer));

		}else{
			result.setMessage("无客户信息，无法锁定。");
			result.setSuccess(false);
		}

		return result;
	}

	/**
	 * 解锁
	 * @param customerCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/unlockCustomer",method = RequestMethod.POST)
	public @ResponseBody StatusResponse unLockCustomer(@RequestParam String customerCode,HttpServletRequest request){
		StatusResponse result = new StatusResponse(true);
		
		Customer customer = this.customerService.findOne(customerCode);
		User user = (User)request.getSession().getAttribute("user");
		if(customer!=null){
			if(!customer.getCustomerStatus().equals(Constants._ACTIVE)){
				result.setMessage("客户已无效，无法锁定。");
				result.setSuccess(false);
				return result;
			}
			if(!customer.getCustomerLocked().equals(Constants._UNLOCKED)){
				result.setMessage("客户已被解锁，无法解锁。");
				result.setSuccess(false);
				return result;
			}
			
			CustomerUser cu = new CustomerUser();
			cu.setLockCustomer(customer);
			cu.setLockUser(user);
			cu.setLockStatus(Constants._UNLOCKED);
			cu.setUnlockComment("");
			cu.setUnlockDate(DateUtils.getCurrentSytemTimeForTimestamp());
			
			List<CustomerUser> list = customer.getLockHistoryList();
			if(list ==null){
				list = new ArrayList<CustomerUser>();
			}
			list.add(cu);
			customer.setLockHistoryList(list);
			
			customer.setCustomerLocked(Constants._UNLOCKED);

			customer.setLastUser(user);
			result.setSuccess(this.customerService.update(customer));

		}else{
			result.setMessage("无客户信息，无法解锁。");
			result.setSuccess(false);
		}

		return result;
	}
	
	@RequestMapping(value="customerInput")
	public String gotoCustomerInput(HttpServletRequest request,HttpServletResponse response){
		
		return "/customer/customerInput";
	}
	
	@RequestMapping(value="inputFile")
	public @ResponseBody StatusResponse inputFile(
			@RequestParam MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		StatusResponse result = new StatusResponse(true);
		try {
			String filePath = "c:/112900e012097151223121000100_1.zip";
			file.transferTo(new java.io.File(filePath));
			result.setSuccess(true);
			
		} catch (IOException e) {
			result.setMessage("文件导入失败，请检查文件。");
			result.setSuccess(false);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="inputCustomer")
	public @ResponseBody StatusResponse inputCustomer(
			@RequestParam MultipartFile[] customerFile,HttpServletRequest request,HttpServletResponse response){
		User user = (User)request.getSession().getAttribute("user");
		
		StatusResponse result = new StatusResponse(true);
		//import excel file
		InputStream is = null;
		try {
			is = customerFile[0].getInputStream();
			// read excel file
			List<Customer> custList = this.transferExcelToCustomer(is,result,user);

		} catch (IOException e) {
			result.setMessage("文件导入失败，请检查文件。");
			result.setSuccess(false);
			e.printStackTrace();
		}finally{
			if(is !=null){
				try {
					is.close();
				} catch (IOException e) {
					is=null;
				}
				is=null;
			}
		}
		return result;
	}
	
	private List<Customer> transferExcelToCustomer(InputStream is,StatusResponse result,User user){
		
		result.setSuccess(true);
		List<Customer> custList = new ArrayList<Customer>();
		ContactInfo contact = new ContactInfo();
		//HSSFWorkbook hssfWorkbook=null;
		XSSFWorkbook hssfWorkbook=null;
		XSSFSheet hssfSheet = null;
		try {
			hssfWorkbook = new XSSFWorkbook(is);
			hssfSheet = hssfWorkbook.getSheetAt(0);
			// 循环行Row
			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				Customer customer = new Customer(); 
				XSSFRow hssfRow = hssfSheet.getRow(rowNum);
				
				// 1.客户姓名
				if(hssfRow.getCell(0) ==null){
					// 如果客户名称为空，则执行下一条记录
					result.setMessage("第"+rowNum+"行,客户姓名为空。");
					result.setSuccess(false);
					continue;
				}
				String custName = hssfRow.getCell(0).getStringCellValue();
				if(custName.isEmpty()){
					// 如果客户名称为空，则执行下一条记录
					result.setMessage("第"+rowNum+"行,客户姓名为空。");
					result.setSuccess(false);
					continue;
				}
				customer.setCustomerName(custName);
				
				// 2.客户默认手机
				if(hssfRow.getCell(1) ==null){
					// 如果客户名称为空，则执行下一条记录
					result.setMessage("第"+rowNum+"行,客户手机为空。");
					result.setSuccess(false);
					continue;
				}
				String custMobile = hssfRow.getCell(1).getStringCellValue();
				if(custMobile.isEmpty()){
					// 如果客户手机为空，则执行下一条记录
					result.setMessage("第"+rowNum+"行,客户手机为空。");
					result.setSuccess(false);
					continue;
				}
				// TODO 格式校验
//				if(false){
//					// 如果客户手机格式校验，则执行下一条记录
//					result.setMessage("第"+rowNum+"行,客户手机格式不对。");
//					result.setSuccess(false);
//					continue;
//				}
				
				customer.setCustomerMobile(custMobile);
				if(!this.customerService.checkCustomerUnquire(null,customer.getCustomerMobile())){
					// 如果客户手机不唯一，则执行下一条记录
					result.setMessage("第"+rowNum+"行,客户手机已存在与现有系统中。");
					result.setSuccess(false);
					continue;
				}else{
					contact.setContactMobile(customer.getCustomerMobile());
				}

				// 3.客户对应渠道
				String channelName = hssfRow.getCell(2)==null? "": hssfRow.getCell(2).getStringCellValue();
				Channel channel = this.channelService.findOne(channelName);
				if(channel !=null){
					customer.setChannel(channel);
				}

				// 4.客户对应团队
				
				String schoolName = hssfRow.getCell(3)==null? "": hssfRow.getCell(3).getStringCellValue();
				School school = this.schoolService.findOne(schoolName);
				if(school !=null){
					customer.setGroup(school);
				}

				// 5.区域
				String local = hssfRow.getCell(4)==null? "": hssfRow.getCell(4).getStringCellValue();
				contact.setContactLocal(local);
				
				
				// 6.联系地址
				String address = hssfRow.getCell(5)==null? "": hssfRow.getCell(5).getStringCellValue();
				contact.setContactAddress(address);
				
				// 7.邮编
				String zipCode =hssfRow.getCell(6)==null? "": hssfRow.getCell(6).getStringCellValue();
				contact.setContactZip(zipCode);
				
				// 8.电话
				String phone =hssfRow.getCell(7)==null? "": hssfRow.getCell(7).getStringCellValue();
				contact.setContactPhone(phone);
				
				// 9.EMAIL
				String email =hssfRow.getCell(8)==null? "": hssfRow.getCell(8).getStringCellValue();
				
				// TODO 检查邮件格式
//				if(true){
//					contact.setContactEmail(email);
//				}else{
//					result.setMessage("第"+rowNum+"行,客户邮件格式不正确。");
//					result.setSuccess(false);
//				}
				contact.setContactEmail(email);
				
				// 10.QQ
				String qq =hssfRow.getCell(9)==null? "": hssfRow.getCell(9).getStringCellValue();
//				if(true){
//					contact.setContactQq(qq);
//				}else{
//					result.setMessage("第"+rowNum+"行,客户QQ格式不正确。");
//					result.setSuccess(false);
//				}
				contact.setContactQq(qq);
				// 11.微信
				String webChat =hssfRow.getCell(10)==null? "": hssfRow.getCell(10).getStringCellValue();
				contact.setContactWebchat(webChat);
				
				// 12.客户备注
				String comments =hssfRow.getCell(11)==null? "": hssfRow.getCell(11).getStringCellValue();
				customer.setCustomerComments(comments);
				
				// 客户创建日期，客户默认值
				customer.setCustomerCode(this.tableKeyService.getNewCode("C"));
				customer.setAccountStatus(0);
				customer.setCustomerLocked(0);
				customer.setCustomerStatus(1);
				customer.setCreatUserCode(user.getUserAddress());
				customer.setCreateTime(DateUtils.getCurrentSytemTimeForTimestamp());

				contact.setCustomer(customer);
				List<ContactInfo> contactList = new ArrayList<ContactInfo>();
				contactList.add(contact);
				customer.setContactInfoList(contactList);
				this.customerService.create(customer);
				custList.add(customer);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			hssfSheet = null;
			hssfWorkbook =null;
		}
		return custList;
	}
	
}
