<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="/project/records" var="recordsUrl" />
<c:url value="/project/create" var="addUrl" />
<c:url value="/project/update" var="editUrl" />
<c:url value="/project/delete" var="deleteUrl" />
<c:url value="/school/allSchool" var="schoolUrl" />
<c:url value="/country/allCountry" var="countryUrl" />
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
						<li><a href="<c:url value='/project/projectList'/>">项目管理</a>
						</li>
						<li class="active"><strong>项目列表</strong></li>
					</ol>
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">项目列表</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<div id='jqgrid'>
								<table id='grid'></table>
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
<script type='text/javascript'>
	$(function() {
		$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		$("#grid").jqGrid({
		   	url:'${recordsUrl}',
			datatype: 'json',
			mtype: 'GET',
		   	colNames:['项目组','项目编码','项目名称','项目说明','项目费用','对应国家','开始日期','停止日期','项目状态'],
		   	colModel:[
		   		{
					name : 'schoolCode',
					index : 'schoolCode',
					width : 120,
					editable : true,
					editrules : {
						required : false
					},
					edittype : "select",
					formatter : 'select',
					stype : 'select',
					editoptions : {
						value : getAllSchool()
					},
					formatoptions : {
						value : getAllSchool()
					},
					searchoptions : {
						sopt : [ 'eq' ],
						value : getAllSchool()
					}
				},
		   		{
					name:'projectCode',
					index:'projectCode',
					width :80,
					editable:true, 
					editrules:{required:true}
				},
		   		{
					name:'projectName',
					index:'projectName',
					width : 120,
					editable:true,
					editrules:{required:true}
				},
		   		{
					name:'projectDesc',
					index:'projectDesc',
					editable:true,
					editrules:{required:true}
				},
		   		{
					name:'projectPrice',
					index:'projectPrice',
					width : 80,
					editable:true,
					formatter: 'currency',
					formatoptions: {prefix: "￥" },
					editrules:{required:true}
				},
		   		{
					name : 'countryName',
					index : 'countryName',
					width : 80,
					editable : true,
					editrules : {
						required : false
					}
				},
				{
	   				name : 'startDate',
	   				index : 'startDate',
	   				width : 80,
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
	   							minView:2,
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
	   			},
				{
	   				name : 'stopDate',
	   				index : 'stopDate',
	   				width : 80,
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
	   							minView:2,
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
	   			},
		   		{
	   				name:'projectStatus',
	   				index:'projectStatus',
	   				editable:true,
	   				width : 60,
	   				editrules:{required:true}, 
		   			edittype:"select", formatter:'select', stype: 'select', 
		   			editoptions:{value:"1:启用;0:禁用"},
		   			formatoptions:{value:"1:启用;0:禁用"}, 
		   			searchoptions: {sopt:['eq'], value:":;1:启用;0:禁用"}
		   		}
		   	],
		   	postData: {},
			rowNum:10,
		   	rowList:[5,10,20,40,60],
		   	height: 500,
		   	autowidth: true,
			//rownumbers: true,
		   	pager: '#pager',
		   	sortname: 'projectCode',
		    viewrecords: true,
		    sortable: true,
		    loadonce: false,
		    sortorder: "asc",
		    emptyrecords: "Empty records",
		    loadComplete: function() {
		    	  jQuery("#grid").trigger("reloadGrid");
		    },
		    jsonReader : {
		        root: "rows",
		        page: "page",
		        total: "total",
		        records: "records",
		        repeatitems: false,
		        cell: "cell",
		        id: "id"
		    },onSortCol: function (index, colindex, sortorder)
            {},

		});

		$("#grid").jqGrid('navGrid','#pager',
				{edit:false, add:false, del:false, search:false,view:true},
				{}, {}, {}, 
				{ 	// search
					sopt:['cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew'],
					closeOnEscape: true, 
					multipleSearch: true, 
					closeAfterSearch: true
				}
		);
		
		$("#grid").navButtonAdd('#pager',
				{ 	caption:"添加", 
					buttonicon : "glyphicon-plus",
					onClickButton: addRow,
					position: "last", 
					title:"Add User", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
				{ 	caption:"修改", 
					buttonicon : "glyphicon-edit",
					onClickButton: editRow,
					position: "last", 
					title:"Edit User", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
			{ 	caption:"删除", 
			buttonicon : "glyphicon-trash",
				onClickButton: deleteRow,
				position: "last", 
				title:"Delete User", 
				cursor: "pointer"
			} 
		);

		// Toolbar Search
		$("#grid").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"cn"});
	});

	function addRow() {
		// Get the currently selected row
		$('#grid').jqGrid('editGridRow','new',
	    		{ 	url: '${addUrl}', 
					editData: {},
	                serializeEditData: function(data){ 
	                    data.id = 0; 
	                    return $.param(data);
	                },
				    recreateForm: true,
				    beforeShowForm: function(form) {
			            $('#pData').hide();  
			            $('#nData').hide();
				    },
					beforeInitData: function(form) {},
					closeAfterAdd: true,
					reloadAfterSubmit:true,
					afterSubmit : function(response, postdata) 
					{ 
				        var result = eval('(' + response.responseText + ')');
						var errors = "";
						
				        if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
				        }  else {
				        	$.teninedialog({
			                    title:'系统提示',
			                    content:'活动添加成功。'
			                });
		                }
				    	// only used for adding new records
				    	var newId = null;
				    	
						return [result.success, errors, newId];
					}
	    		});

   		$("#grid").jqGrid('setColProp', 'password', {hidden: true});
	} // end of addRow


	function editRow() {
		// Get the currently selected row
		var row = $('#grid').jqGrid('getGridParam','selrow');
		
		if( row != null ) {
		
			$('#grid').jqGrid('editGridRow', row,
				{	url: '${editUrl}', 
					editData: {},
			        recreateForm: true,
			        beforeShowForm: function(form) {
			            $('#pData').hide();  
			            $('#nData').hide();
			        },
					beforeInitData: function(form) {},
					closeAfterEdit: true,
					reloadAfterSubmit:true,
					afterSubmit : function(response, postdata) 
					{ 
			            var result = eval('(' + response.responseText + ')');
						var errors = "";
						
			            if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
			            }  else {
			            	$.teninedialog({
			                    title:'系统提示',
			                    content:'修改成功。'
			                });
		                }
				    	// only used for adding new records
				    	var newId = null;
			        	
						return [result.success, errors, newId];
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
	    var row = $('#grid').jqGrid('getGridParam','selrow');

	    // A pop-up dialog will appear to confirm the selected action
		if( row != null ) 
			$('#grid').jqGrid( 'delGridRow', row,
	          	{	url:'${deleteUrl}', 
					recreateForm: true,
				    beforeShowForm: function(form) {
				    	//Change title
				    	$(".delmsg").replaceWith(
								'<span style="white-space: pre;">'
										+ '删除所选择的记录?'
										+ '</span>');
						//hide arrows
						$('#pData').hide();
						$('#nData').hide();
				    },
	          		reloadAfterSubmit:true,
	          		closeAfterDelete: true,
	          		serializeDelData: function (postdata) {
		          	      var rowdata = $('#grid').getRowData(postdata.id);
		          	      // append postdata with any information 
		          	      return {id: postdata.id, oper: postdata.oper, projectCode: rowdata.projectCode};
		          	},
	          		afterSubmit : function(response, postdata) 
					{ 
			            var result = eval('(' + response.responseText + ')');
						var errors = "";
						
			            if (result.success == false) {
							for (var i = 0; i < result.message.length; i++) {
								errors +=  result.message[i] + "<br/>";
							}
			            }  else {
			            	$.teninedialog({
			                    title:'系统提示',
			                    content:'删除成功。'
			                });
		                }
				    	// only used for adding new records
				    	var newId = null;
			        	
						return [result.success, errors, newId];
					}
	          	});
		else {
			$.teninedialog({
	            title:'警告',
	            content:'请先选择需要修改的记录!'
	        });
		}
	}
	
	function getAllCountry(){
		var str=":;";
		$.ajax({
			type:'post',
			async:false,
			url:'${countryUrl}',
			success:function(data){
				if (data != null) {
					var length=data.length;
					for(var i=0;i<length;i++){
						if(i!=length-1){
							str+=data[i].countryCode+":"+data[i].countryName+";";
						}else{ 
							str+=data[i].countryCode+":"+data[i].countryName;
						}
					}
				}
			}
		});
		return str;
	}
	
	function getAllSchool(){
		var str=":;";
		$.ajax({
			type:'post',
			async:false,
			url:'${schoolUrl}',
			success:function(data){
				if (data != null) {
					var length=data.length;
					for(var i=0;i<length;i++){
						if(i!=length-1){
							str+=data[i].schoolCode+":"+data[i].schoolName+";";
						}else{ 
							str+=data[i].schoolCode+":"+data[i].schoolName;
						}
					}
				}
			}
		});
		return str;
	}
	</script>
</html>