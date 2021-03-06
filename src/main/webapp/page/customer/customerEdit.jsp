<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/customer/saveCustomer" var="saveCustomer"/>
<c:url value="/customer/customerList" var="customerList"/>
<c:url value="/customer/findCity" var="findCity"/>

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
							<a href="<c:url value='/customer/customerList'/>">客户管理</a>
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
										<input type="text" class="form-control" value="${customerDto.customerCode}" id="customerCode" name="customerCode" readonly="readonly">
									</div>
									<!-- 客户姓名 -->
									<label class="col-sm-2 control-label" for="field-1">客户姓名</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerName}" id="customerName" name="customerName">
									</div>
								</div>
								<div class="form-group">
									<!-- 客户英文名 -->
									<label class="col-sm-2 control-label" for="field-1">客户英文名/昵称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerEName}" id="customerEName" name="customerEName">
									</div>
									<!-- 客户性别 -->
									<label class="col-sm-2 control-label" for="field-1">客户性别</label>
									<div class="col-sm-4">
										<select id="customerSex" name="customerSex"  class="form-control">
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
										<input type="text" class="form-control" value="${customerDto.customerCredit}" id="customerCredit" name="customerCredit" />
									</div>
									<!-- 出生年月 -->
									<label class="col-sm-2 control-label" for="field-1">出生年月</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerBirthday}" id="customerBirthday" name="customerBirthday" />
									</div>
								</div>
								<div class="form-group">
									<!-- 目前所在学校-->
									<label class="col-sm-2 control-label" for="field-1">目前所在学校 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerSchool}" id="customerSchool" name="customerSchool" />
									</div>
									<!-- 目前年级-->
									<label class="col-sm-2 control-label" for="field-1">年级 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerGrade}" id="customerGrade" name="customerGrade" />
									</div>
								</div>
								<div class="form-group">
									<!-- 目前现在专业-->
									<label class="col-sm-2 control-label" for="field-1">现在专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMajor}" id="customerMajor" name="customerMajor" />
									</div>
									<!-- 意向专业-->
									<label class="col-sm-2 control-label" for="field-1">意向专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionMajor}" id="intentionMajor" name="intentionMajor" />
									</div>
								</div>
								
								<div class="form-group">
									<!-- 意向国家-->
									<label class="col-sm-2 control-label" for="field-1">意向国家 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionContry}" id="intentionContry" name="intentionContry" />
									</div>
									<!-- 意向状态-->
									<label class="col-sm-2 control-label" for="field-1">意向状态 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionStatus}" id="intentionStatus" name="intentionStatus" />
									</div>
								</div>
								<div class="form-group">
									<!-- 负责人-->
									<label class="col-sm-2 control-label" for="field-1">负责人 </label>
									<div class="col-sm-4">
										<select id="principalCode" name="principalCode"  class="form-control">
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
										<select id="customerGroupCode" name="customerGroupCode"  class="form-control">
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
									<label class="col-sm-2 control-label" for="field-1">来源渠道 </label>
									<div class="col-sm-4">
										<select id="channelCode" name="channelCode"  class="form-control">
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
									<label class="col-sm-2 control-label" for="field-1">E-Mail</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerEmail}" id="customerEmail" name="customerEmail" />
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">联系电话1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerPhone1}" id="customerPhone1" name="customerPhone1" />
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">联系电话2</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerPhone2}" id="customerPhone2" name="customerPhone2" />
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMobile1}" id="customerMobile1" name="customerMobile1" />
									</div>
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机2 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMobile2}" id="customerMobile2" name="customerMobile2" />
									</div>
								</div>
								<div class="form-group">
									<!-- QQ-->
									<label class="col-sm-2 control-label" for="field-1">QQ </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerQq}" id="customerQq" name="customerQq" />
									</div>
									<!-- 微信 -->
									<label class="col-sm-2 control-label" for="field-1">微信</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerWeiChat}" id="customerWeiChat" name="customerWeiChat" />
									</div>
								</div>
								<div class="form-group">
									<!-- 省份 -->
									<label class="col-sm-2 control-label" for="field-1">省市 </label>
									<div class="col-sm-4">
										<div class="col-xs-6">
											<select id="customerProvince" name="customerProvince" class="form-control" >
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
											<select id="customerCity" name="customerCity" class="form-control">
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
										<input type="text" class="form-control" value="${customerDto.customerZipcode}" id="customerZipcode" name="customerZipcode" />
									</div>
								</div>
								<div class="form-group">
									<!-- 地址-->
									<label class="col-sm-2 control-label" for="field-1">地址 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="${customerDto.customerAddress}" id="customerAddress" name="customerAddress" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">备注信息</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" id="customerComments" name="customerComments" >${customerDto.customerComments}</textarea>
									</div>
								</div>
								
								<div class="form-group">
									<!-- 客户锁定状态 -->
									<label class="col-sm-2 control-label" for="field-1">锁定状态</label>
									<div class="col-sm-4">
										<select id="customerLocked" name="customerLocked"  class="form-control">
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
									<!-- 客户状态 -->
									<label class="col-sm-2 control-label" for="field-1">客户状态</label>
									<div class="col-sm-4">
										<select id="customerStatus" name="customerStatus"  class="form-control">
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
								</div>
								<div class="form-group">
									<!-- 签约状态 -->
									<label class="col-sm-2 control-label" for="field-1">签约状态</label>
									<div class="col-sm-4">
										<select id="customerSex" name="accountStatus"  class="form-control">
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
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>修改客户信息</span>
										</button>
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList" disabled="disabled">
											<i class="fa-share"></i>
											<span>取消保存</span>
										</button>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="saveCustomer" disabled="disabled">
											<i class="fa-check"></i>
											<span>保存客户信息</span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

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

<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"/>'></script>

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
	var url='${customerList}';
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
				$(".clsEdit").css("display","inline");
			}
		}
	});
});

</script>
</html>