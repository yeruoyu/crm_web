<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/customer/saveCustomer" var="saveCustomer"/>
<c:url value="/customer/" var="customerList"/>
<c:url value="/customer/findCity" var="findCity"/>

<!-- 联系记录信息 -->
<c:url value="/custRecord/custRecords" var="custRecordsUrl"/>
<c:url value="/custRecord/create" var="addRecordUrl" />
<c:url value="/custRecord/update" var="editRecordUrl" />
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM系统</title>

<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/linecons/css/linecons.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/fontawesome/css/font-awesome.min.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-core.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-forms.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-components.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-skins.css"/>' />


<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/jqgrid/css/ui.jqgrid-bootstrap.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/datetimepicker/css/bootstrap-datetimepicker.min.css"/>' />

<script type='text/ecmascript' src='<c:url value="/resources/js/jquery-1.11.0.min.js"/>'></script>
</head>
<body class="page-body">
	<div class="page-container">
		<jsp:include page="../common/menu.jsp"/>
		<!-- Content -->
		<div class="main-content">
			<jsp:include page="../common/navbar.jsp"/>
			<div class="page-title">
				<div class="breadcrumb-env">
					<ol class="breadcrumb bc-1">
						<li>
							<a href="<c:url value='/index'/>"><i class="fa-home"></i>首页</a>
						</li>
						<li>
							<a href="<c:url value='/customer/${returnUrl}'/>">客户管理</a>
						</li>
						<li class="active">
							<strong>修改</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel -->
			<!-- 客户基本信息 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">客户基本</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="customerForm" class="form-horizontal col-sm-10">
								<div class="form-group">
									<!-- 客户代码 -->
									<label class="col-sm-2 control-label" for="field-1">客户代码</label>
									<div class="col-sm-4">
										<input type="hidden" value="${customerDto.customerCode}" id="custCode" />
										<input type="hidden" value="${customerDto.editFlag}" id="editFlag" />
										<input type="hidden" value="${returnUrl}" id="returnUrl" />
										<input type="text" class="form-control" value="${customerDto.customerCode}" id="customerCode" name="customerCode" readonly="readonly">
									</div>
									<!-- 客户姓名 -->
									<label class="col-sm-2 control-label" for="field-1">客户姓名</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerName}" id="customerName" name="customerName"  readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<!-- 客户英文名 -->
									<label class="col-sm-2 control-label" for="field-1">客户英文名/昵称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerEName}" id="customerEName" name="customerEName"  readonly="readonly">
									</div>
									<!-- 客户性别 -->
									<label class="col-sm-2 control-label" for="field-1">客户性别</label>
									<div class="col-sm-4">
										<select id="customerSex" name="customerSex"  class="form-control lockflag"  readonly="readonly">
											<c:if test="${customerDto.customerSex==1}">
												<option value="0">女</option>
												<option value="1" selected="selected">男</option>
											</c:if>
											<c:if test="${customerDto.customerSex==0}">
												<option value="0" selected="selected">女</option>
												<option value="1">男</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 身份证 -->
									<label class="col-sm-2 control-label" for="field-1">身份证 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerCredit}" id="customerCredit" name="customerCredit"  readonly="readonly"/>
									</div>
									<!-- 出生年月 -->
									<label class="col-sm-2 control-label" for="field-1">出生年月</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerBirthday}" id="customerBirthday" name="customerBirthday"  readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 目前所在学校-->
									<label class="col-sm-2 control-label" for="field-1">目前所在学校 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerSchool}" id="customerSchool" name="customerSchool"  readonly="readonly"/>
									</div>
									<!-- 目前年级-->
									<label class="col-sm-2 control-label" for="field-1">年级 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerGrade}" id="customerGrade" name="customerGrade"  readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 目前现在专业-->
									<label class="col-sm-2 control-label" for="field-1">现在专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerMajor}" id="customerMajor" name="customerMajor"  readonly="readonly"/>
									</div>
									<!-- 意向专业-->
									<label class="col-sm-2 control-label" for="field-1">意向专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.intentionMajor}" id="intentionMajor" name="intentionMajor"  readonly="readonly"/>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 意向国家-->
									<label class="col-sm-2 control-label" for="field-1">意向国家 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.intentionContry}" id="intentionContry" name="intentionContry"  readonly="readonly"/>
									</div>
									<!-- 意向状态-->
									<label class="col-sm-2 control-label" for="field-1">意向状态 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.intentionStatus}" id="intentionStatus" name="intentionStatus"  readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 负责人-->
									<label class="col-sm-2 control-label" for="field-1">负责人  <i class="linecons-user"></i></label>
									<div class="col-sm-4">
										<select id="principalCode" name="principalCode"  class="form-control lockflag"  readonly="readonly">
											<option value="">无</option>
											<c:forEach items="${principalList }" var="principal">
												<c:if test="${principal.userCode==customerDto.principalCode}">
													<option value="${principal.userCode}" selected="selected">${principal.userName}</option>
												</c:if>
												<c:if test="${principal.userCode!=customerDto.principalCode}">
													<option value="${principal.userCode}">${principal.userName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<!-- 所属团队 -->
									<label class="col-sm-2 control-label" for="field-1">所属团队 </label>
									<div class="col-sm-4">
										<select id="customerGroupCode" name="customerGroupCode" class="form-control lockflag"  readonly="readonly">
											<c:forEach items="${groupList}" var="group">
												<c:if test="${group.groupCode==customerDto.customerGroupCode}">
													<option value="${group.groupCode}" selected="selected">${group.groupName}</option>
												</c:if>
												<c:if test="${group.groupCode!=customerDto.customerGroupCode}">
													<option value="${group.groupCode}">${group.groupName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 来源渠道 -->
									<label class="col-sm-2 control-label" for="field-1">来源渠道 <i class="linecons-user"></i></label>
									<div class="col-sm-4">
										<select id="channelCode" name="channelCode" class="form-control lockflag"  readonly="readonly">
											<option value="">无</option>
											<c:forEach items="${channelList}" var="channel">
												<c:if test="${channel.channelCode==customerDto.channelCode}">
													<option value="${channel.channelCode}" selected="selected">${channel.channelName}</option>
												</c:if>
												<c:if test="${channel.channelCode!=customerDto.channelCode}">
													<option value="${channel.channelCode}">${channel.channelName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">E-Mail <i class="linecons-mail"></i></label>
									
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerEmail}" id="customerEmail" name="customerEmail" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">联系电话1 <i class="linecons-megaphone"></i></label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerPhone1}" id="customerPhone1" name="customerPhone1" readonly="readonly"/>
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">联系电话2</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerPhone2}" id="customerPhone2" name="customerPhone2" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机1 <i class="linecons-mobile"></i></label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerMobile1}" id="customerMobile1" name="customerMobile1" readonly="readonly"/>
									</div>
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机2 <i class="linecons-mobile"></i></label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerMobile2}" id="customerMobile2" name="customerMobile2" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- QQ-->
									<label class="col-sm-2 control-label lockflag" for="field-1">QQ </label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerQq}" id="customerQq" name="customerQq" readonly="readonly"/>
									</div>
									<!-- 微信 -->
									<label class="col-sm-2 control-label" for="field-1">微信</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerWeiChat}" id="customerWeiChat" name="customerWeiChat" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 省份 -->
									<label class="col-sm-2 control-label" for="field-1">省市 </label>
									<div class="col-sm-4">
										<div class="col-xs-6">
											<select id="customerProvince" name="customerProvince" class="form-control lockflag" readonly="readonly">
												<option value="">无</option>
												<c:forEach items="${areaList}" var="area">
													<c:if test="${area.areaCode==customerDto.customerProvince}">
														<option value="${area.areaCode}" selected="selected">${area.areaName}</option>
													</c:if>
													<c:if test="${area.areaCode!=customerDto.customerProvince}">
														<option value="${area.areaCode}">${area.areaName}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
										<div class="col-xs-6">
											<select id="customerCity" name="customerCity" class="form-control lockflag" readonly="readonly">
												<option value="">无</option>
												<c:forEach items="${cityList}" var="city">
													<c:if test="${city.areaCode==customerDto.customerCity}">
														<option value="${city.areaCode}" selected="selected">${city.cityName}</option>
													</c:if>
													<c:if test="${city.areaCode!=customerDto.customerCity}">
														<option value="${city.areaCode}">${city.cityName}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<!-- 邮编 -->
									<label class="col-sm-2 control-label" for="field-1">邮编</label>
									<div class="col-sm-4">
										<input type="text" class="form-control lockflag" value="${customerDto.customerZipcode}" id="customerZipcode" name="customerZipcode" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<!-- 地址-->
									<label class="col-sm-2 control-label" for="field-1">地址 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control lockflag" value="${customerDto.customerAddress}" id="customerAddress" name="customerAddress" readonly="readonly"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">备注信息</label>
									
									<div class="col-sm-10">
										<textarea class="form-control lockflag" rows="3" id="customerComments" name="customerComments" readonly="readonly">${customerDto.customerComments}</textarea>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 客户锁定状态 -->
									<label class="col-sm-2 control-label" for="field-1">锁定状态</label>
									<div class="col-sm-4">
										<select id="customerLocked" name="customerLocked"  class="form-control lockflag" readonly="readonly">
											<c:if test="${customerDto.customerLocked==1}">
												<option value="0">未锁定</option>
												<option value="1" selected="selected">锁定</option>
											</c:if>
											<c:if test="${customerDto.customerLocked==0}">
												<option value="0" selected="selected">未锁定</option>
												<option value="1">锁定</option>
											</c:if>
										</select>
									</div>
									<!-- 上门情况 -->
									<label class="col-sm-2 control-label" for="field-1">上门情况</label>
									<div class="col-sm-4">
										<select id="visitStatus" name="visitStatus"  class="form-control lockflag" readonly="readonly">
											<c:if test="${customerDto.visitStatus==1}">
												<option value="0">未上门</option>
												<option value="1" selected="selected">已上门</option>
											</c:if>
											<c:if test="${customerDto.visitStatus==0}">
												<option value="0" selected="selected">未上门</option>
												<option value="1">已上门</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 客户状态 -->
									<label class="col-sm-2 control-label" for="field-1">客户状态</label>
									<div class="col-sm-4">
										<select id="customerStatus" name="customerStatus"  class="form-control lockflag" readonly="readonly">
											<c:if test="${customerDto.customerStatus==1}">
												<option value="0">无效</option>
												<option value="1" selected="selected">有效</option>
											</c:if>
											<c:if test="${customerDto.customerStatus==0}">
												<option value="0" selected="selected">无效</option>
												<option value="1">有效</option>
											</c:if>
										</select>
									</div>
									<!-- 签约状态 -->
									<label class="col-sm-2 control-label" for="field-1">签约状态</label>
									<div class="col-sm-4">
										<select id="customerSex" name="accountStatus"  class="form-control lockflag" readonly="readonly">
											<c:if test="${customerDto.accountStatus==1}">
												<option value="0">未签约</option>
												<option value="1" selected="selected">签约</option>
											</c:if>
											<c:if test="${customerDto.accountStatus==0}">
												<option value="0" selected="selected">未签约</option>
												<option value="1">签约</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回客户列表</span>
										</button>
										<c:if test="${customerDto.editFlag==1 || customerDto.editFlag==2}">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="toEditCustomer">
											<i class="fa-edit"></i>
											<span>修改客户信息</span>
										</button>
										<button type="reset" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px;display:none" id="cancelSave" >
											<i class="fa-share"></i>
											<span>取消保存</span>
										</button>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="saveCustomer" style="display:none">
											<i class="fa-save"></i>
											<span>保存客户信息</span>
										</button>
										</c:if>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 联系记录 -->
			<div class="row clsEdit" id="recordList" style="display:none">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">联系记录</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- 联系记录 -->
							<div>
								<table id='recordGrid' ></table>
								<div id='recordPager'></div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
			<!-- 底部显示 -->
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</div>
</body>
<!-- Bottom Scripts -->
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/js/multiselect/css/multi-select.css"/>' />

<!-- Bottom Scripts -->
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/TweenMax.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/resizeable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/joinable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-api.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-toggles.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-custom.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/jquery.json-2.4.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/i18n/grid.locale-cn.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/jquery.jqGrid.js"/>'></script>

<script type='text/ecmascript' src='<c:url value="/resources/js/datepicker/bootstrap-datepicker.js"/>'></script>

<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap3-typeahead.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/jquery.bootstrap.teninedialog.v3.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/js/multiselect/js/jquery.multi-select.js"/>'></script>

<script type='text/ecmascript'>
jQuery.prototype.serializeObject=function(){  
    var obj=new Object();  
    $.each(this.serializeArray(),function(index,param){  
        if(!(param.name in obj)){  
            obj[param.name]=param.value;  
        }  
    });  
    return obj;  
};

//$.jgrid.defaults.width = 780;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';
</script>

<script type='text/ecmascript'>
//返回到客户列表
$("#backToList").click(function(){
	var url='${customerList}'+$('#returnUrl').val();
	window.location.href= url;
});


$('#customerProvince').change(function(){
	var _this=$(this);
	var areaCode = _this.find('option:selected').attr('value');
	var cityUrl ='${findCity}?areaCode='+areaCode;
	$('#customerCity').html('');
	var $option1 = '<option value="">无</option>';
	$('#customerCity').append($option1);
	
	$.ajax({
		 type:"get",
		 url:cityUrl,
		 dataType : "json",
		 success:function(data){
		 	var selPro = data;
		 	$.each(data, function(i, item) {          
		 		var $option = '<option value='+item.areaCode+'>'+item.cityName+'</option>';
				$('#customerCity').append($option);
			})
		 }
	});
});

//保存客户信息
$("#saveCustomer").click(function(){
	var customerDto = $.toJSON($('#customerForm').serializeObject()); //serializeObject
	$.ajax({
		url : "${saveCustomer}",  
		type : "POST",  
		datatype:"json",  
		contentType: "application/json; charset=utf-8",  
		data : customerDto,  
		success :function(response, postdata) {
			var result = response.success;
			var errors = "";
			if (result == false) {
				for (var i = 0; i < response.message.length; i++) {
					errors += response.message[i] + "<br/>";
				}
				$.teninedialog({
                    title:'系统提示',
                    content:'客户保存失败：'+errors
                });
			} else {
				$.teninedialog({
					title:'系统提示',
					content:'客户保存成功。'
				});
			}
		}
	});
	
	lock();
	
});

$('#customerBirthday').datepicker({
	autoclose: true,
	format: 'yyyy-mm-dd',
	orientation : 'auto bottom',
	todayBtn: true
});

$("#toEditCustomer").click(function(){
	unlock();
});

$("#cancelSave").click(function(){
	lock();
});

function unlock(){
	$(".lockflag").removeAttr("readonly");

	$("#toEditCustomer").css("display","none");
	$("#backToList").css("display","none");
	$("#cancelSave").css("display","");
	$("#saveCustomer").css("display","");
}

function lock(){
	$(".lockflag").attr("readonly","readonly");

	$("#toEditCustomer").css("display","");
	$("#backToList").css("display","");
	$("#cancelSave").css("display","none");
	$("#saveCustomer").css("display","none");
}
</script>

<!-- 联系记录 -->
<script type='text/ecmascript'>
$(function() {
	var showFlag = $("#editFlag").val();
	if(showFlag==2){
		$("#recordList").css("display","");
	}else{
		return;
	}

	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#recordGrid").jqGrid({
		url : '${custRecordsUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'recordId',
			name : 'recordId',
			label : '联系ID',
			hidden:true,
			width : 55,
			key : true,
			editable : true,
			editrules : {
				required : false,
				edithidden:true
			},
			editoptions : {
				readonly : true,
			}
		}, {
			name : 'customerCode',
			index : 'customerCode',
			label : '客户代码',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				readonly : true,
				value:$('#custCode').val()
			}
		}
/* 		, {
			name : 'recordName',
			index : 'recordName',
			label : '联系人姓名',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		} */
		, {
			index : 'recordType',
			name : 'recordType',
			label : '联系类型',
			width : 100,
			editable : true,
			editrules : {
				required : true
			}
			
		}, {
			name : 'recordTime',
			index : 'recordTime',
			label : '联系时间',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datepicker({
						autoclose: true,
						format: 'yyyy-mm-dd',
						orientation : 'auto bottom',
						todayBtn: true
                    });
				}
			}
		}, {
			name : 'recordNTime',
			index : 'recordNTime',
			label : '下次联系时间',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datepicker({
						autoclose: true,
						format: 'yyyy-mm-dd',
						orientation : 'auto bottom'
                    });
				}
			}
		}, {
			name : 'recordResult',
			index : 'recordResult',
			label : '联系结果',
			width : 100,
			editable : true,
			editrules : {
				required : true
			}
		}
		/* , {
			name : 'recordPhone',
			index : 'recordPhone',
			label : '联系电话',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		}
		, {
			name : 'recordAddress',
			index : 'recordAddress',
			label : '联系地址',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		} */
		, {
			name : 'recordComment',
			index : 'recordComment',
			label : '备注',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			edittype:'textarea',
			editoptions: {rows:"2",cols:"50"}
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 250,
		autowidth : true,
		rownumbers : false,
		pager : '#recordPager',
		//sortname : 'recordId',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#recordGrid").trigger("reloadGrid");
		},
		jsonReader : {
			root : "rows",
			page : "page",
			total : "total",
			records : "records",
			repeatitems : false,
			cell : "cell",
			id : "id"
		},
		onSortCol : function(index, colindex, sortorder) {
		},
	});

	$("#recordGrid").jqGrid('navGrid', '#recordPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});
	
	$("#recordGrid").navButtonAdd('#recordPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addRecordRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加联系记录",
		cursor : "pointer"
	});

	$("#recordGrid").navButtonAdd('#recordPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editRecordRow,
		closeAfterEdit : true,
		position : "last",
		title : "编辑联系记录",
		cursor : "pointer"
	});
});

function addRecordRow() {
	// Get the currently selected row
	$('#recordGrid').jqGrid('editGridRow', 'new', {
		url : '${addRecordUrl}?custCode='+$('#custCode').val(),
		editData : {},
		serializeEditData : function(data) {
			data.id = 0;
			return $.param(data);
		},
		recreateForm : true,
		beforeShowForm : function(form) {
			$('#pData').hide();
			$('#nData').hide();
		},
		beforeInitData : function(form) {
		},
		closeAfterAdd : true,
		reloadAfterSubmit : true,
		afterSubmit : function(response, postdata) {
			var result = eval('(' + response.responseText + ')');
			var errors = "";

			if (result.success == false) {
				for (var i = 0; i < result.message.length; i++) {
					errors += result.message[i] + "<br/>";
				}
			} else {
				$.teninedialog({
                    title:'系统提示',
                    content:'添加客户联系方式成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editRecordRow() {
	// Get the currently selected row
	var row = $('#recordGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#recordGrid').jqGrid('editGridRow', row, {
			url : '${editRecordUrl}',
			editData : {},
			recreateForm : true,
			beforeShowForm : function(form) {
				$('#pData').hide();
				$('#nData').hide();
			},
			beforeInitData : function(form) {
			},
			closeAfterEdit : true,
			reloadAfterSubmit : true,
			afterSubmit : function(response, postdata) {
				var result = eval('(' + response.responseText + ')');
				var errors = "";

				if (result.success == false) {
					for (var i = 0; i < result.message.length; i++) {
						errors += result.message[i] + "<br/>";
					}
				} else {
					$.teninedialog({
	                    title:'系统提示',
	                    content:'修改客户联系记录成功。'
	                });
				}
				// only used for adding new records
				var newId = null;

				return [ result.success, errors, newId ];
			}
		});
	} else {
		$.teninedialog({
            title:'警告',
            content:'请先选择需要修改的记录!'
        });
	}
}
</script>
</html>