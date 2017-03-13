<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/customer/myRecords" var="recordsUrl" />
<c:url value="/channel/allChannel" var="channelUrl" />
<c:url value="/user/allUser" var="userUrl" />

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
							<strong>我的客户</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">我的客户</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<div id="jgrid">
								<table id='grid' ></table>
								<div id='pager'></div>
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
		
	$("#grid").jqGrid({
		url : '${recordsUrl}',
		datatype : 'json',
		mtype : 'GET',
		colModel : [{
			index : 'customerCode',
			name : 'customerCode',
			label : '客户Code',
			width : 100,
			editable : false
		}, {
			name : 'customerName',
			index : 'customerName',
			label : '客户姓名',
			formatter : formatViewLink,
			width : 100,
			editable : false
		}, {
			name : 'intentionMajor',
			index : 'intentionMajor',
			label : '意向专业',
			width : 100,
			editable : false
		}, {
			name : 'intentionContry',
			index : 'intentionContry',
			label : '意向国家',
			width : 100,
			editable : false
		}, {
			name : 'channelCode',
			index : 'channelCode',
			label : '来源渠道',
			width : 100,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : getAllChannel()
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : getAllChannel()
			}
		}, {
			name : 'createUserCode',
			index : 'createUserCode', 
			label : '录入人',
			width : 100,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : getAllUser()
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : getAllUser()
			}
		}, {
			name : 'createTime',
			index : 'createTime',
			label : '录入时间',
			width : 100,
			editable : false,
			
		}, {
			name : 'principalCode',
			index : 'principalCode',
			label : '负责人',
			width : 100,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : getAllUser()
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : getAllUser()
			}
		}, {
			name : 'lastContactTime',
			index : 'lastContactTime',
			label : '最后联系时间',
			width : 100,
			editable : false,
			
		}, {
			name : 'customerLocked',
			index : 'customerLocked',
			label : '客户锁定',
			width : 80,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : "1:锁定;0:未锁定"
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : ":;1:锁定;0:未锁定"
			}
		}, {
			name : 'customerStatus',
			index : 'customerStatus',
			label : '客户状态',
			width : 80,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : "1:活动;0:停用;-1:注销"
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : ":;1:活动;0:停用;-1:注销"
			}
		}
		/* ,{
			name : 'execEdit',
			index : 'execEdit',
			label : '操作',
			width : 120,
			editable : false,
			formatter : formatEditLink
		} */ 
		],
		postData : {},
		rowNum : 10,
		rowList : [ 1,2,5,10, 20, 40, 60 ],
		height : 500,
		autowidth : true,
		rownumbers : false,
		pager : '#pager',
		sortname : 'lastContactTime',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "desc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#grid").trigger("reloadGrid");
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

	$("#grid").jqGrid('navGrid', '#pager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : false,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, { // search
		sopt : [ 'cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' ],
		closeOnEscape : true,
		multipleSearch : true,
		closeAfterSearch : true
	});

	// Toolbar Search
	$("#grid").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : true,
		defaultSearch : "cn"
	});
});

function getAllChannel(){
	var str=":;";
	$.ajax({
		type:'post',
		async:false,
		url:'${channelUrl}',
		success:function(data){
			if (data != null) {
				var length=data.length;
				for(var i=0;i<length;i++){
					if(i!=length-1){
						str+=data[i].channelCode+":"+data[i].channelName+";";
					}else{ 
						str+=data[i].channelCode+":"+data[i].channelName;
					}
				}
			}
		}
	});
	return str;
}

function getAllUser(){
	var str=":;";
	$.ajax({
		type:'post',
		async:false,
		url:'${userUrl}',
		success:function(data){
			if (data != null) {
				var length=data.length;
				for(var i=0;i<length;i++){
					if(i!=length-1){
						str+=data[i].userCode+":"+data[i].userName+";";
					}else{ 
						str+=data[i].userCode+":"+data[i].userName;
					}
				}
			}
		}
	});
	return str;
}

function formatViewLink(cellvalue, options, rowObject) {
	return "<a href=/crm_web/customer/customerDetail?returnUrl=myCustomerList&customerCode="+ rowObject.customerCode + ">"+ rowObject.customerName + "</a>";
}

/* function formatEditLink(cellvalue, options, rowObject) {
	return "<a href=/crm_web/customer/customerContact?customerCode="+ rowObject.customerCode + " class='btn btn-success btn-sm'>联系</a>"
    +" <a href=/crm_web/customer/customerEdit?customerCode="+ rowObject.customerCode + " class='btn btn-success btn-sm'>修改</a>";
} */
</script>
</html>