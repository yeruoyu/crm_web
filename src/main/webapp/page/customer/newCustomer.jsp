<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/customer/saveNewCustomer" var="saveNewCustomer"/>
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
<style>
.error{
	color:red;
}
</style>
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
							<strong>添加</strong>
						</li>
					</ol>		
				</div>
			</div>
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
							<form role="form" id="customerForm" class="form-horizontal col-sm-10 "> <!-- validate -->
								<div class="form-group">
									<!-- 客户代码 -->
									<label class="col-sm-2 control-label" for="field-1">客户代码</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerCode" name="customerCode" readonly="readonly">
									</div>
									<!-- 客户姓名 -->
									<label class="col-sm-2 control-label" for="field-1">客户姓名</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerName" name="customerName" placeholder="请输入客户姓名">
									</div>
								</div>
								<div class="form-group">
									<!-- 客户英文名 -->
									<label class="col-sm-2 control-label" for="field-1">客户英文名/昵称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerEName" name="customerEName" placeholder="请输入客户英文名/昵称">
									</div>
									<!-- 客户性别 -->
									<label class="col-sm-2 control-label" for="field-1">客户性别</label>
									<div class="col-sm-4">
										<select id="customerSex" name="customerSex"  class="form-control">
											<option value="0">女</option>
											<option value="1">男</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 身份证 -->
									<label class="col-sm-2 control-label" for="field-1">身份证 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerCredit" name="customerCredit" placeholder="请输入证件号">
									</div>
									<!-- 出生年月 -->
									<label class="col-sm-2 control-label" for="field-1">出生年月</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerBirthday" name="customerBirthday" placeholder="请输入出生年月">
									</div>
								</div>
								<div class="form-group">
									<!-- 目前所在学校-->
									<label class="col-sm-2 control-label" for="field-1">目前所在学校 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerSchool" name="customerSchool" placeholder="请输入所在学校 " />
									</div>
									<!-- 目前年级-->
									<label class="col-sm-2 control-label" for="field-1">年级 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerGrade" name="customerGrade" placeholder="请输入年级" />
									</div>
								</div>
								<div class="form-group">
									<!-- 目前现在专业-->
									<label class="col-sm-2 control-label" for="field-1">现在专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerMajor" name="customerMajor" placeholder="请输入现在专业" />
									</div>
									<!-- 意向专业-->
									<label class="col-sm-2 control-label" for="field-1">意向专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="intentionMajor" name="intentionMajor" placeholder="请输入意向专业" />
									</div>
								</div>
								
								<div class="form-group">
									<!-- 意向国家-->
									<label class="col-sm-2 control-label" for="field-1">意向国家 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="intentionContry" name="intentionContry" placeholder="请输入意向国家" />
									</div>
									<!-- 意向状态-->
									<label class="col-sm-2 control-label" for="field-1">意向状态 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="intentionStatus" name="intentionStatus" placeholder="请输入意向状态" />
									</div>
								</div>
								<div class="form-group">
									<!-- 负责人-->
									<label class="col-sm-2 control-label" for="field-1">负责人 </label>
									<div class="col-sm-4">
										<select id="principalCode" name="principalCode"  class="form-control"
											><!-- data-validate="required" data-message-required="负责人那必须输入。" -->
											<option value="">无</option>
											<c:forEach items="${principalList }" var="principal">
												<option value="${principal.userCode}">${principal.userName}</option>
											</c:forEach>
										</select>
									</div>
									<!-- 所属团队 -->
									<label class="col-sm-2 control-label" for="field-1">所属团队 </label>
									<div class="col-sm-4">
										<select id="customerGroupCode" name="customerGroupCode"  class="form-control">
											<option value="">无</option>
											<c:forEach items="${groupList}" var="group">
												<option value="${group.groupCode}">${group.groupName}</option>
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
												<option value="${channel.channelCode}">${channel.channelName}</option>
											</c:forEach>
										</select>
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">E-Mail</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerEmail" name="customerEmail" placeholder="请输入EMAIL地址">
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">联系电话1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerPhone1" name="customerPhone1" placeholder="联系电话1">
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">联系电话2</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerPhone2" name="customerPhone2" placeholder="联系电话2">
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerMobile1" name="customerMobile1" placeholder="请输入手机号1"
										><!-- data-validate="required" data-message-required="手机号必须输入。" -->
									</div>
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机2 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerMobile2" name="customerMobile2" placeholder="请输入手机号2">
									</div>
								</div>
								<div class="form-group">
									<!-- QQ-->
									<label class="col-sm-2 control-label" for="field-1">QQ </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerQq" name="customerQq" placeholder="请输入QQ号">
									</div>
									<!-- 微信 -->
									<label class="col-sm-2 control-label" for="field-1">微信</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerWeiChat" name="customerWeiChat" placeholder="请输入微信地址">
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
													<option value="${area.areaCode}">${area.areaName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-xs-6">
											<select id="customerCity" name="customerCity" class="form-control">
												<option value="">无</option>
											</select>
										</div>
									</div>
									<!-- 邮编 -->
									<label class="col-sm-2 control-label" for="field-1">邮编</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="customerZipcode" name="customerZipcode" placeholder="请输入邮编">
									</div>
								</div>
								<div class="form-group">
									<!-- 地址-->
									<label class="col-sm-2 control-label" for="field-1">地址 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="" id="customerAddress" name="customerAddress" placeholder="请输入地址" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">备注信息</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" id="customerComments" name="customerComments"></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-12">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回客户列表</span>
										</button>
										<button type="submit" class="btn btn-secondary btn-icon pull-right" id="saveCustomer">
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
<script type="text/ecmascript" src='<c:url value="/resources/jquery-validate/jquery.validate.min.js"/>'></script>


<script type="text/javascript">
jQuery.prototype.serializeObject=function(){  
    var obj=new Object();  
    $.each(this.serializeArray(),function(index,param){  
        if(!(param.name in obj)){  
            obj[param.name]=param.value;  
        }  
    });  
    return obj;  
};  
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
	// 保存客户信息
	$().ready(function() {
		// 在键盘按下并释放及提交后验证提交表单
		$("#customerForm").validate({
		onsubmit:true,// 是否在提交是验证 
		onfocusout:false,// 是否在获取焦点时验证 
		onkeyup :false,// 是否在敲击键盘时验证 
		rules: {
			"customerMobile1":{required: true},
			"principalCode":{required: true}
		}, 
		messages:{
			"customerMobile1":{required: "手机号码1不能为空。"},
			"principalCode":{required: "负责人不能为空。"}
		}
		});
	});
	/* 提交数据*/
	$.validator.setDefaults({
	    submitHandler: function() {
	    	var customerDto = $.toJSON($('#customerForm').serializeObject()); //serializeObject	
			$.ajax({
				url : "${saveNewCustomer}",  
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
	    }
	});
	
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
</html>