<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/user/records" var="recordsUrl" />
<c:url value="/user/create" var="addUrl" />
<c:url value="/user/update" var="editUrl" />
<c:url value="/user/delete" var="deleteUrl" />

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
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">
				
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">用户列表</h3>
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
			index : 'userCode',
			name : 'userCode',
			label : '工号',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10,
				readonly:true
			}
		}, {
			name : 'userName',
			index : 'userName',
			label : '姓名',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userPassword',
			index : 'userPassword',
			label : '密码',
			hidden:true,
			width : 100,
			editable : true,
			edittype:'password',
			editrules : {
				required : false,
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userEmail',
			index : 'userEmail',
			label : 'Email',
			width : 100,
			editable : true,
			editrules : {
				required : false,
				email:true,
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userPhone',
			index : 'userPhone',
			label : '联系电话',
			width : 100,
			editable : true,
			editrules : {
				required : false,
				number:true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userMobile',
			index : 'userMobile',
			label : '手机',
			width : 100,
			editable : true,
			editrules : {
				required : false,
				number:true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userQq',
			index : 'userQq',
			label : 'QQ',
			width : 100,
			editable : true,
			editrules : {
				required : false,
				number:true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userWebchat',
			index : 'userWebchat',
			label : '微信号',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userAddress',
			index : 'userAddress',
			label : '联系地址',
			width : 55,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'userStatus',
			index : 'useryStatus',
			label : '用户状态',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : "1:活动;0:停用;-1:注销"
			},
			formatoptions : {
				value : "1:活动;0:停用;-1:注销"
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : ":;1:活动;0:停用;-1:注销"
			}
		}, {
			name : 'execView',
			index : 'execView',
			label : '查看',
			width : 100,
			editable : false,
			formatter : formateadorLink
		} ],
		postData : {},
		rowNum : 10,
		rowList : [ 1,2,5,10, 20, 40, 60 ],
		height : 300,
		autowidth : true,
		rownumbers : false,
		pager : '#pager',
		sortname : 'userCode',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
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

	$("#grid").navButtonAdd('#pager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addRow,
		closeAfterEdit : true,
		position : "last",
		title : "Add User",
		cursor : "pointer"
	});

	$("#grid").navButtonAdd('#pager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editRow,
		closeAfterEdit : true,
		position : "last",
		title : "Edit User",
		cursor : "pointer"
	});

	// Toolbar Search
	$("#grid").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : true,
		defaultSearch : "cn"
	});
});

function addRow() {
	// Get the currently selected row
	$('#grid').jqGrid('editGridRow', 'new', {
		url : '${addUrl}',
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
                    content:'活动员工成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editRow() {
	// Get the currently selected row
	var row = $('#grid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#grid').jqGrid('editGridRow', row, {
			url : '${editUrl}',
			editData : {},
			recreateForm : true,
			beforeShowForm : function(form) {
				//$('#pData').hide();
				//$('#nData').hide();
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
	                    content:'修改员工成功。'
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

function formateadorLink(cellvalue, options, rowObject) {
    return "<a href=/crm_web/user/get?userCode="+ rowObject.userCode + ">查看 </a>";
}
</script>
</html>