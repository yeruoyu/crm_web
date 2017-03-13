<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 公告信息 -->
<c:url value="/role/saveRole" var="saveRole"/>
<c:url value="/role/roleList" var="roleList"/>

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
							<a href="<c:url value='/customer/customerList'/>">角色管理</a>
						</li>
						<li class="active">
							<strong>角色信息</strong>
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
							<h3 class="panel-title">角色信息</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="roleForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">角色Code</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${roleDto.roleCode }" id="roleCode" name="roleCode" readonly="readonly" placeholder="角色Code">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">角色名称</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${roleDto.roleName }" id="roleName" name="roleName" placeholder="角色标题">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">角色状态</label>
									<div class="col-sm-6">
										<select  id="roleStatus" name="roleStatus" value="${roleDto.roleStatus }" class="form-control">
											<c:if test="${roleDto.roleStatus==1}">
													<option value="1" selected="selected">有效</option>
													<option value="0">无效</option>
											</c:if>
											<c:if test="${roleDto.roleStatus==0}">
													<option value="1">有效</option>
													<option value="0" selected="selected">无效</option>
											</c:if>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="tagsinput-1">指定功能</label>	
									<div class="col-sm-6">
										
										<script type="text/javascript">
											jQuery(document).ready(function($)
											{
												$("#multi-select").multiSelect({
													afterInit: function()
													{
														// Add alternative scrollbar to list
														this.$selectableContainer.add(this.$selectionContainer).find('.ms-list').perfectScrollbar();
													},
													afterSelect: function()
													{
														// Update scrollbar size
														this.$selectableContainer.add(this.$selectionContainer).find('.ms-list').perfectScrollbar('update');
													}
												});
											});
										</script>
										<select class="form-control" multiple="multiple" id="multi-select" name="">
											<c:forEach items="${menuDtos}" var="menu">
												<c:if test="${menu.selFlag==1}">
													<option value="${menu.menuCode }" selected="selected">${menu.menuDisName }</option>
												</c:if>
												<c:if test="${menu.selFlag!=1}">
													<option value="${menu.menuCode }">${menu.menuDisName }</option>
												</c:if>
											</c:forEach>
										</select>
										<input type="hidden" name="selMenus" id="selMenus"/>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回角色列表</span>
										</button>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="saveRole">
											<i class="fa-check"></i>
											<span>保存角色信息</span>
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
		var url='${roleList}';
		window.location.href= url;
	});
	
	// 保存客户信息
	$("#saveRole").click(function(){
		$("#selMenus").val($('#multi-select').val());
		
		var roleDto = $.toJSON($('#roleForm').serializeObject()); //serializeObject
		$.ajax({
			url : "${saveRole}",  
			type : "POST",  
			datatype:"json",  
			contentType: "application/json; charset=utf-8",  
			data : roleDto,  
			success :function(response, postdata) {
				var result = response.success;
				var errors = "";
				if (result == false) {
					for (var i = 0; i < response.message.length; i++) {
						errors += response.message[i] + "<br/>";
					}
					$.teninedialog({
	                    title:'系统提示',
	                    content:'公告保存失败：'+errors
	                });
				} else {
					$.teninedialog({
						title:'系统提示',
						content:'公告保存成功。'
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