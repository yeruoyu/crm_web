<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="/course/records" var="recordsUrl" />
<c:url value="/course/create" var="addUrl" />
<c:url value="/course/update" var="editUrl" />
<c:url value="/course/delete" var="deleteUrl" />

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
						<li><a href="<c:url value='/teacher/teacherList'/>">教师管理</a>
						</li>
						<li class="active"><strong>教师列表</strong></li>
					</ol>
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">教师列表</h3>
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

<script type='text/javascript'>
	$(function() {
		$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		$("#grid").jqGrid({
		   	url:'${recordsUrl}',
			datatype: 'json',
			mtype: 'GET',
		   	colNames:['课程代码','课程名称','课时数','课程价格','课程状态'],
		   	colModel:[
		   		{
					name:'courseCode',
					index:'courseCode',
					width :80,
					editable:true, 
					editrules:{required:true}
				},
		   		{
					name:'courseName',
					index:'courseName',
					width : 120,
					editable:true,
					editrules:{required:true}
				},
		   		{
					name:'courseHour',
					index:'courseHour',
					editable:true,
					editrules:{required:true}
				},
		   		{
					name:'coursePrice',
					index:'coursePrice',
					width : 80,
					editable:true,
					formatter: 'currency',
					formatoptions: {prefix: "￥" },
					editrules:{required:true}
				},
		   		{
	   				name:'courseStatus',
	   				index:'courseStatus',
	   				editable:true,
	   				width : 60,
	   				editrules:{required:true}, 
		   			edittype:"select", formatter:'select', stype: 'select', 
		   			editoptions:{value:"1:有效;0:无效"},
		   			formatoptions:{value:"1:有效;0:无效"}, 
		   			searchoptions: {sopt:['eq'], value:":;1:有效;0:无效"}
		   		}
		   	],
		   	postData: {},
			rowNum:10,
		   	rowList:[5,10,20,40,60],
		   	height: 500,
		   	autowidth: true,
			//rownumbers: true,
		   	pager: '#pager',
		   	sortname: 'courseCode',
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
					title:"添加课程", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
				{ 	caption:"修改", 
					buttonicon : "glyphicon-edit",
					onClickButton: editRow,
					position: "last", 
					title:"修改课程", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
			{ 	caption:"删除", 
			buttonicon : "glyphicon-trash",
				onClickButton: deleteRow,
				position: "last", 
				title:"删除课程", 
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