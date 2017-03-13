<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 日程信息 -->
<c:url value="/user/savePwd" var="savePwdUrl" />
<c:url value="/index" var="indexUrl" />

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
							<a href="<c:url value='/user/userList'/>">员工管理</a>
						</li>
						<li class="active">
							<strong>修改密码</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">修改密码</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="userForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工工号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userCode" name="userCode" readonly="readonly" value="${userDto.userCode}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userName" name="userName" readonly="readonly" value="${userDto.userName}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">原密码:</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userPassword"  name="userPassword" placeholder="请输入原密码">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">新密码:</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userNewPassword" name="userNewPassword" placeholder="请输入新密码">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">确认密码:</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userConfirmPwd" name="userConfirmPwd" placeholder="请再输入一次密码">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToIndex">
											<i class="fa-share"></i>
											<span>返回首页</span>
										</button>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="savePwd">
											<i class="fa-check"></i>
											<span>修改密码</span>
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
	$("#backToIndex").click(function(){
		var url='${indexUrl}';
		window.location.href= url;
	});

	// 保存客户信息
	$("#savePwd").click(function(){
		var userPwd = $('#userPassword').val();
		var newPwd = $('#userNewPassword').val();
		var confirmPwd = $('#userConfirmPwd').val();
		if(userPwd==null || userPwd==""){
			$.teninedialog({
				title:'系统提示',
				content:'请输入原密码。'
			});
			return false;
		}
		if(newPwd==null || newPwd==""){
			$.teninedialog({
				title:'系统提示',
				content:'请输入新密码。'
			});
			return false;
		}
		if(newPwd != confirmPwd){
			$.teninedialog({
				title:'系统提示',
				content:'新密码与确认密码不一致，请重新输入。'
			});
			return false;
		}
		
		var userDto = $.toJSON($('#userForm').serializeObject()); //serializeObject
		$.ajax({
			url : "${savePwdUrl}",  
			type : "POST",  
			datatype:"json",  
			contentType: "application/json; charset=utf-8",  
			data : userDto,  
			success :function(response, postdata) {
				var result = response.success;
				var errors = "";
				if (result == false) {
					for (var i = 0; i < response.message.length; i++) {
						errors += response.message[i] + "<br/>";
					}
					$.teninedialog({
	                    title:'系统提示',
	                    content:'密码变更失败：'+errors
	                });
				} else {
					$.teninedialog({
						title:'系统提示',
						content:'密码变更成功。'
					});
					$(".clsEdit").css("display","inline");
				}
			}
		});
	});

	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
</html>