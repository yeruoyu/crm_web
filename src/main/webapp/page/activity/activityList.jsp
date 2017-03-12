<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="/activity/records" var="recordsUrl" />
<c:url value="/activity/create" var="addUrl" />
<c:url value="/activity/update" var="editUrl" />
<c:url value="/activity/delete" var="deleteUrl" />

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
		<jsp:include page="../common/menu.jsp" />
		<!-- Content -->
		<div class="main-content">
			<jsp:include page="../common/navbar.jsp" />
			<div class="page-title">
				<div class="breadcrumb-env">
					<ol class="breadcrumb bc-1">
						<li><a href="<c:url value='/index'/>"><i class="fa-home"></i>首页</a>
						</li>
						<li><a href="<c:url value='/project/projectList'/>">活动管理</a>
						</li>
						<li class="active"><strong>活动列表</strong></li>
					</ol>
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">活动列表</h3>
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
			<jsp:include page="../common/footer.jsp" />
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
		colModel : [ {
			index : 'activityCode',
			name : 'activityCode',
			label : '活动Code',
			width : 55,
			key : true,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				readonly : true,
			}
		}, {
			index : 'activityTitle',
			name : 'activityTitle',
			label : '活动标题',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'activityDesc',
			index : 'activityDesc',
			label : '活动说明',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'activityAddress',
			index : 'activityAddress',
			label : '活动地点',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'activityStartDate',
			index : 'activityStartDate',
			label : '活动开始日期',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datetimepicker({
				        //language:  'fr',
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						forceParse: 0,
				        showMeridian: 1
				    });
				}
			},
			searchoptions : {
				dataInit : function(element) {
					$(element).datetimepicker({
				        language:  'fr',
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						minView: 2,
						forceParse: 0
				    });
				}
			}
		}, {
			name : 'activityStopDate',
			index : 'activityStopDate',
			label : '活动结束日期',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datetimepicker({
				        //language:  'fr',
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						forceParse: 0,
				        showMeridian: 1
				    });
				}
			},
			searchoptions : {
				dataInit : function(element) {
					$(element).datetimepicker({
				        language:  'fr',
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						minView: 2,
						forceParse: 0
				    });
				}
			}
		}, {
			name : 'activityAccount',
			index : 'activityAccount',
			label : '参与人数',
			width : 55,
			editable : true,
			editrules : {
				required : false,
				number:true,
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'activityStatus',
			index : 'activityStatus',
			label : '活动状态',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : "1:活动;0:关闭"
			},
			formatoptions : {
				value : "1:活动;0:关闭"
			},
			searchoptions : {
				sopt : [ 'eq' ],
				value : ":;1:活动;0:关闭"
			}
		} ],
		postData : {},
		rowNum : 10,
		rowList : [ 1,2,5,10, 20, 40, 60 ],
		height : 300,
		autowidth : true,
		rownumbers : false,
		pager : '#pager',
		sortname : 'activityCode',
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
		view : true,
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

	$("#grid").navButtonAdd('#pager', {
		caption : "删除",
		buttonicon : "glyphicon-trash",
		onClickButton : deleteRow,
		position : "last",
		title : "Delete User",
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
                    content:'活动添加成功。'
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
	                    content:'修改成功。'
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

function deleteRow() {
	// Get the currently selected row
	var row = $('#grid').jqGrid('getGridParam', 'selrow');

	// A pop-up dialog will appear to confirm the selected action
	if (row != null)
		$('#grid')
				.jqGrid(
						'delGridRow',
						row,
						{
							url : '${deleteUrl}',
							recreateForm : true,
							beforeShowForm : function(form) {
								//Change title
								$(".delmsg").replaceWith(
										'<span style="white-space: pre;">'
												+ '删除所选择的记录?'
												+ '</span>');
								//hide arrows
								$('#pData').hide();
								$('#nData').hide();
							},
							reloadAfterSubmit : true,
							closeAfterDelete : true,
							serializeDelData : function(postdata) {
								var rowdata = $('#grid').getRowData(
										postdata.id);
								// append postdata with any information 
								return {
									id : postdata.id,
									oper : postdata.oper,
									activityCode : rowdata.activityCode
								};
							},
							afterSubmit : function(response, postdata) {
								var result = eval('('
										+ response.responseText + ')');
								var errors = "";

								if (result.success == false) {
									for (var i = 0; i < result.message.length; i++) {
										errors += result.message[i]
												+ "<br/>";
									}
								} else {
									$.teninedialog({
					                    title:'系统提示',
					                    content:'删除成功。'
					                });
								}
								// only used for adding new records
								var newId = null;

								return [ result.success, errors, newId ];
							}
						});
	else {
		$.teninedialog({
            title:'警告',
            content:'请先选择需要修改的记录!'
        });
	}
}
</script>

</html>