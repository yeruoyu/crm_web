<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 日程信息 -->
<c:url value="/schedule/saveSchedule" var="saveSchedule"/>
<c:url value="/schedule/myScheduleList" var="scheduleList"/>

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
							<a href="<c:url value='/customer/customerList'/>">日程管理</a>
						</li>
						<li class="active">
							<strong>日程信息</strong>
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
							<h3 class="panel-title">添加日程</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="scheduleForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">日程类型</label>
									<div class="col-sm-6">
										<select  id="scheduleType" name="scheduleType" readonly="readonly" value="${scheduleDto.scheduleType}" class="form-control">
											<c:forEach items="${scheduleTypeDtos}" var="scheduleType">
												<c:if test="${scheduleDto.scheduleType==scheduleType.distCode}">
													<option value="${scheduleType.distCode}" selected="selected">${scheduleType.distValue }</option>
												</c:if>
												<c:if test="${scheduleDto.scheduleType!=scheduleType.distCode}">
													<option value="${scheduleType.distCode}">${scheduleType.distValue }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">日程标题</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${scheduleDto.scheduleTitle}" readonly="readonly" id="scheduleTitle" name="scheduleTitle">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">日程执行人</label>
									<div class="col-sm-6">
										<input type="hidden" value="${scheduleDto.scheduleUserCode}" id="scheduleUserCode" name="scheduleUserCode">
										<input type="text" class="form-control" value="${scheduleDto.scheduleUserName}" readonly="readonly" id="scheduleUserName" name="scheduleUserName">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">开始时间</label>
									<div class="col-sm-6">
										<div class="input-group">
											<input type="text" class="form-control" readonly="readonly" value="${scheduleDto.scheduleStartTime}">
											<div class="input-group-addon">
												<i id="startTime" class="linecons-calendar"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">结束时间</label>
									<div class="col-sm-6">
										<div class="input-group">
											<input type="text" class="form-control" value="${scheduleDto.scheduleEndTime}" readonly="readonly" >
											<div class="input-group-addon">
												<i id="endTime" class="linecons-calendar"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">日程内容</label>
									<div class="col-sm-6">
										<textarea class="form-control" readonly="readonly" rows="3" >${scheduleDto.scheduleDetail}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">日程状态</label>
									<div class="col-sm-6">
										<select  id="scheduleStatus" name="scheduleStatus" readonly="readonly" value="" class="form-control">
											<c:if test="${scheduleDto.scheduleStatus==1}">
													<option value="1" selected="selected">正常</option>
													<option value="2">取消</option>
											</c:if>
											<c:if test="${scheduleDto.scheduleStatus==2}">
													<option value="1">正常</option>
													<option value="2" selected="selected">取消</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="tagsinput-1">指定人员</label>	
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
										<select class="form-control" multiple="multiple" id="multi-select" name="userList">
											<c:forEach items="${userDtos}" var="user">
												<c:if test="${currUser.userCode != user.userCode}">
													<c:if test="${user.subScheduleFlag==1}">
														<option value="${user.userCode }" selected="selected">${user.userName }</option>
													</c:if>
													<c:if test="${user.subScheduleFlag!=1}">
														<option value="${user.userCode }">${user.userName }</option>
													</c:if>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								
								
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回日程列表</span>
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
		var url='${scheduleList}';
		window.location.href= url;
	});
	
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
</html>