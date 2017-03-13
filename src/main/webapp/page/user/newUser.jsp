<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 日程信息 -->
<c:url value="/user/saveNewUser" var="saveNewUserUrl" />
<c:url value="/user/userList" var="userListUrl" />


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
							<strong>添加员工</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">添加员工</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="userForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工工号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userCode" name="userCode"  value="${userDto.userCode}" placeholder="请输入员工工号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">初始密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control"  id="userPassword" name="userPassword" value="123456" >
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系电话</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userPhone"  name="userPhone" placeholder="请输入联系电话">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系手机</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userMobile" name="userMobile" placeholder="请输入联系手机">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">Email</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userEmail" name=userEmail placeholder="请输入Email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系地址</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="请输入联系地址">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">QQ号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userQq" name="userQq" placeholder="请输入QQ号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">微信号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userWebchat" name="userWebchat" placeholder="请输入微信号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="roleCode">员工角色</label>
									<div class="col-sm-6">
										<select id="roleCode" name="roleCode" class="form-control">
											<option value="">无</option>
											<c:forEach items="${roleList}" var="role">
												<option value="${role.roleCode}">${role.roleName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userLevel">员工级别</label>
									<div class="col-sm-6">
										<select id="userLevel" name="userLevel" class="form-control">
											<c:forEach items="${levelList}" var="level">
												<option value="${level.distCode}">${level.distValue}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="pUserCode">上级主管</label>
									<div class="col-sm-6">
										<select id="pUserCode" name="pUserCode" class="form-control">
											<option value="">无</option>
											<c:forEach items="${parentList}" var="parent">
												<option value="${parent.userCode}">${parent.userName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="groupCode">所属团队</label>
									<div class="col-sm-6">
										<select id=""groupCode"" name="groupCode" class="form-control">
											<c:forEach items="${groupList}" var="group">
												<option value="${group.groupCode}">${group.groupName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="salesFlag">是否是销售</label>
									<div class="col-sm-6">
										<select id="salesFlag" name="salesFlag" class="form-control">
											<option value="1">是</option>
											<option value="0">否</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userMax">最大锁定客户数</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userMax" name="userMax" placeholder="请输入最大锁定客户数">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userStatus">员工状态</label>
									<div class="col-sm-6">
										<select id="userStatus" name="userStatus" class="form-control">
											<option value="1">有效</option>
											<option value="0">无效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回用户列表</span>
										</button>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="saveUser">
											<i class="fa-check"></i>
											<span>保存用户信息</span>
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
	$("#backToList").click(function(){
		var url='${userListUrl}';
		window.location.href= url;
	});
	
	
	// 保存客户信息
	$("#saveUser").click(function(){
		var userDto = $.toJSON($('#userForm').serializeObject()); //serializeObject
		$.ajax({
			url : "${saveNewUserUrl}",  
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
	                    content:'员工保存失败：'+errors
	                });
				} else {
					$.teninedialog({
						title:'系统提示',
						content:'员工保存成功。'
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