<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
							<a href="<c:url value='/user/userList'/>">用户管理</a>
						</li>
						<li class="active">
							<strong>用户列表</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel 用户基本信息 -->
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
									<label class="col-sm-2 control-label" for="field-1">用户代码</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userCode }" id="userCode" readonly="readonly"  placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">用户姓名</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userName }" id="userName" readonly="readonly"  placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">用户密码</label>
									
									<div class="col-sm-6">
										<input type="password" class="form-control" value="${userDto.userPassword }" id="userPassword" readonly="readonly"  placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系电话</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userPhone }" id="userPhone" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系手机</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userMobile }" id="userMobile" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">Email</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userEmail }" id="userEmail" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">联系地址</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userAddress }" id="userAddress" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">QQ号</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userQq }" id="userQq" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">微信号</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${userDto.userWebchat }" id="userQq" placeholder="Placeholder">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="userRole">员工角色</label>
									<div class="col-sm-6">
										<select id="userRole" value="" class="form-control">
											<option value="">请选择</option>
											<option value="Admin">系统管理员</option>
											<option value="Market">市场</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">员工状态</label>
									
									<div class="col-sm-6">
										<select id="userStatus" value="${userDto.userStatus}" class="form-control" disabled="disabled">
											<option value="1">正常</option>
											<option value="0">停用</option>
											<option value="-1">注销</option>
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
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