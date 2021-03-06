<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/user/userList" var="userListUrl" />
<c:url value="/user/custRecords" var="custRecordsUrl" />
<c:url value="/user/recRecords" var="recRecordsUrl" />

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
							<strong>员工基本信息</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel 员工基本信息 -->
			<div class="row">
				<div class="col-md-12">
				
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">员工基本信息</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工代码</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userCode }" id="userCode" readonly="readonly"  placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工姓名</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userName }" id="userName" readonly="readonly"  placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系电话</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userPhone }" id="userPhone" readonly="readonly" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系手机</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userMobile }" id="userMobile" readonly="readonly" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">Email</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userEmail }" id="userEmail" readonly="readonly" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系地址</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userAddress }" id="userAddress" readonly="readonly" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">QQ号</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userQq }" id="userQq"  readonly="readonly"placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">微信号</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userWebchat }" id="userWebchat" readonly="readonly" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="roleCode">员工角色</label>
									<div class="col-sm-6">
										<select id="roleCode" name="roleCode" class="form-control" readonly="readonly">
											<option value="">无</option>
											<c:forEach items="${roleList}" var="role">
												<c:if test="${role.roleCode==userDto.roleCode }">
													<option value="${role.roleCode}" selected="selected">${role.roleName}</option>
												</c:if>
												<c:if test="${role.roleCode!=userDto.roleCode }">
													<option value="${role.roleCode}">${role.roleName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userLevel" readonly="readonly">员工级别</label>
									<div class="col-sm-6">
										<select id="userLevel" name="userLevel" class="form-control">
											<c:forEach items="${levelList}" var="level">
												<c:if test="${userDto.userLevel==level.distCode }">
													<option value="${level.distCode}" selected="selected">${level.distValue}</option>
												</c:if>
												<c:if test="${userDto.userLevel!=level.distCode }">
													<option value="${level.distCode}">${level.distValue}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="pUserCode" readonly="readonly">上级主管</label>
									<div class="col-sm-6">
										<select id="pUserCode" name="pUserCode" class="form-control">
											<option value="">无</option>
											<c:forEach items="${parentList}" var="parent">
												<c:if test="${parent.userCode==userDto.pUserCode }">
													<option value="${parent.userCode}" selected="selected">${parent.userName}</option>
												</c:if>
												<c:if test="${parent.userCode != userDto.pUserCode }">
													<option value="${parent.userCode}">${parent.userName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="groupCode" readonly="readonly">所属团队</label>
									<div class="col-sm-6">
										<select id=""groupCode"" name="groupCode" class="form-control">
											<c:forEach items="${groupList}" var="group">
												<c:if test="${group.groupCode==userDto.groupCode }">
													<option value="${group.groupCode}" selected="selected">${group.groupName}</option>
												</c:if>
												<c:if test="${group.groupCode != userDto.groupCode }">
													<option value="${group.groupCode}">${group.groupName}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="salesFlag" readonly="readonly">是否是销售</label>
									<div class="col-sm-6">
										<select id="salesFlag" name="salesFlag" class="form-control">
											<c:if test="${userDto.salesFlag==1 }">
												<option value="1" selected="selected">是</option>
												<option value="0">否</option>
											</c:if>
											<c:if test="${userDto.salesFlag!=1}">
												<option value="1">是</option>
												<option value="0" selected="selected">否</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userMax" readonly="readonly">最大锁定客户数</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="userMax" name="userMax" value="${userDto.userMax}" placeholder="请输入最大锁定客户数">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userStatus" readonly="readonly">员工状态</label>
									<div class="col-sm-6">
										<select id="userStatus" name="userStatus" class="form-control">
											<c:if test="${userDto.userStatus==0 }">
												<option value="1">有效</option>
												<option value="0" selected="selected">无效</option>
											</c:if>
											<c:if test="${userDto.userStatus==1 }">
												<option value="1" selected="selected">有效</option>
												<option value="0">无效</option>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回员工列表</span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${showDetailFlag ==1 }"> <!-- 自己或者上级可看 -->
				<!-- Content Panel 客户资源信息 -->
				<div class="row">
					<div class="col-md-12">
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">员工客户信息列表</h3>
								<div class="panel-options">
									<a href="#" data-toggle="panel">
										<span class="collapse-icon">&ndash;</span>
										<span class="expand-icon">+</span>
									</a>
								</div>
							</div>
							<div class="panel-body">
								<!-- Content -->
								<div id="jgrid">
									<table id='custGrid' ></table>
									<div id='custPager'></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Content Panel 客户资源信息 -->
				<div class="row">
					<div class="col-md-12">
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">员工联系记录列表</h3>
								<div class="panel-options">
									<a href="#" data-toggle="panel">
										<span class="collapse-icon">&ndash;</span>
										<span class="expand-icon">+</span>
									</a>
								</div>
							</div>
							<div class="panel-body">
								<!-- Content -->
								<div id="jgrid">
									<table id='recordGrid' ></table>
									<div id='recordPager'></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</div>
</body>
<!-- Bottom Scripts -->
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/TweenMax.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/resizeable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/joinable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-api.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-toggles.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-custom.js"/>'></script>


<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/i18n/grid.locale-cn.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/jquery.jqGrid.js"/>'></script>

<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"/>'></script>

<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap3-typeahead.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/jquery.bootstrap.teninedialog.v3.js"/>'></script>	

<script type='text/ecmascript'>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<script type='text/ecmascript'>
	//返回到客户列表
	$("#backToList").click(function(){
		var url='${userListUrl}';
		window.location.href= url;
	});
</script>

<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#custGrid").jqGrid({
		url : '${custRecordsUrl}'+'?userCode='+$('#userCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [{
			index : 'customerCode',
			name : 'customerCode',
			label : '客户代码',
			width : 100,
			editable : false
			
		}, {
			name : 'customerName',
			index : 'customerName',
			label : '客户姓名',
			width : 100,
			editable : false
		}, {
			name : 'phone',
			index : 'phone',
			label : '联系电话',
			width : 100,
			editable : false
		}, {
			name : 'mobile',
			index : 'mobile',
			label : '手机',
			width : 100,
			editable : false
		}, {
			name : 'customerStatus',
			index : 'customerStatus',
			label : '客户状态',
			width : 80,
			editable : false
		}, {
			name : 'customerLevel',
			index : 'customerLevel',
			label : '客户级别',
			width : 80,
			editable : false
		}, {
			name : 'customerSource',
			index : 'customerSource',
			label : '客户来源',
			width : 80,
			editable : false
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#custPager',
		sortname : 'customerCode',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#custGrid").trigger("reloadGrid");
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

	$("#custGrid").jqGrid('navGrid', '#custPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, { // search
		sopt : [ 'cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' ],
		closeOnEscape : true,
		multipleSearch : true,
		closeAfterSearch : true
	});

	// Toolbar Search
	$("#custGrid").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : true,
		defaultSearch : "cn"
	});
});


</script>

<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#recordGrid").jqGrid({
		url : '${recRecordsUrl}'+'?userCode='+$('#userCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'recordId',
			name : 'recordId',
			label : '联系ID',
			hidden:true,
			width : 55,
			key : true,
			editable : false
		}, {
			name : 'customerName',
			index : 'customerName',
			label : '联系客户',
			width : 80,
			editable : false
		}, {
			index : 'recordType',
			name : 'recordType',
			label : '联系类型',
			width : 100,
			editable : false
			
		}, {
			name : 'recordTime',
			index : 'recordTime',
			label : '联系时间',
			width : 100,
			editable : false
		}, {
			name : 'recordResult',
			index : 'recordResult',
			label : '联系结果',
			width : 100,
			editable : false
		}, {
			name : 'recordComment',
			index : 'recordComment',
			label : '备注',
			width : 100,
			editable : false
		}, {
			name : 'recordPhone',
			index : 'recordPhone',
			label : '联系电话',
			width : 80,
			editable : false
		}, {
			name : 'recordAddress',
			index : 'recordAddress',
			label : '联系地址',
			width : 80,
			editable : false
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#recordPager',
		sortname : 'recordId',
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
	}, {}, {}, {}, { // search
		sopt : [ 'cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' ],
		closeOnEscape : true,
		multipleSearch : true,
		closeAfterSearch : true
	});

	// Toolbar Search
	$("#recordGrid").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : true,
		defaultSearch : "cn"
	});
});
</script>
</html>