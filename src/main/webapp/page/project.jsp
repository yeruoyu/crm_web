<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/project/records" var="recordsUrl"/>
<c:url value="/project/create" var="addUrl"/>
<c:url value="/project/update" var="editUrl"/>
<c:url value="/project/delete" var="deleteUrl"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/jquery-ui/pepper-grinder/jquery-ui-1.8.16.custom.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/ui.jqgrid-4.3.1.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/style.css"/>'/>
	
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>

	
	<title>用户信息</title>
</head>
<body>
<h1 id='banner'>用户信息</h1>
	
	<div id='jqgrid'>
		<table id='grid'></table>
		<div id='pager'></div>
	</div>
	
	<div id='msgbox' title='' style='display:none'></div>
</body>

	<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui-1.8.16.custom.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/grid.locale-en-4.3.1.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery.jqGrid.min.4.3.1.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/custom.js"/>'></script>

<script type='text/javascript'>
	$(function() {
		$("#grid").jqGrid({
		   	url:'${recordsUrl}',
			datatype: 'json',
			mtype: 'GET',
		   	colNames:['项目ID', '项目编码','项目名称','项目说明','项目费用','对应学校ID','对应学校','对应国家ID','对应国家','项目状态','停止日期'],
		   	colModel:[
		   		{name:'projectId',index:'projectId', width:55, editable:true, editrules:{required:true},editoptions:{readonly:true, size:10}},
		   		{name:'projectCode',index:'projectCode', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'projectName',index:'projectName', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'projectDesc',index:'projectDesc', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'projectPrice',index:'projectPrice', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		
		   		{name:'countryCode',index:'countryCode', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'countryName',index:'countryName', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'schoolId',index:'schoolId', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'schoolName',index:'schoolName', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}},
		   		{name:'projectStatus',index:'projectStatus', width:50, editable:true, editrules:{required:true}, 
		   			edittype:"select", formatter:'select', stype: 'select', 
		   			editoptions:{value:"1:启用;0:禁用"},
		   			formatoptions:{value:"1:启用;0:禁用"}, 
		   			searchoptions: {sopt:['eq'], value:":;1:启用;0:禁用"}},
		   		{name:'stopDate',index:'stopDate', width:100, editable:true, editrules:{required:true}, editoptions:{size:10}}
		   	],
		   	postData: {},
			rowNum:10,
		   	rowList:[5,10,20,40,60],
		   	height: 240,
		   	autowidth: true,
			rownumbers: true,
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
				{edit:false, add:false, del:false, search:false},
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
					buttonicon:"ui-icon-plus", 
					onClickButton: addRow,
					position: "last", 
					title:"Add User", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
				{ 	caption:"修改", 
					buttonicon:"ui-icon-pencil", 
					onClickButton: editRow,
					position: "last", 
					title:"Edit User", 
					cursor: "pointer"
				} 
		);
		
		$("#grid").navButtonAdd('#pager',
			{ 	caption:"删除", 
				buttonicon:"ui-icon-trash", 
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
				        	$('#msgbox').text('Entry has been added successfully');
							$('#msgbox').dialog( 
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");} 
										}
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
			            	$('#msgbox').text('修改成功。');
							$('#msgbox').dialog( 
									{	title: '成功',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");} 
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;
			        	
						return [result.success, errors, newId];
					}
				});
		} else {
			$('#msgbox').text('请先选择需要修改的记录!');
			$('#msgbox').dialog( 
					{	title: '警告',
						modal: true,
						buttons: {"Ok": function()  {
							$(this).dialog("close");} 
						}
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
				        $(".delmsg").replaceWith('<span style="white-space: pre;">' +
				        		'Delete selected record?' + '</span>');
		            	//hide arrows
				        $('#pData').hide();  
				        $('#nData').hide();
				    },
	          		reloadAfterSubmit:true,
	          		closeAfterDelete: true,
	          		serializeDelData: function (postdata) {
		          	      var rowdata = $('#grid').getRowData(postdata.id);
		          	      // append postdata with any information 
		          	      return {id: postdata.id, oper: postdata.oper, projectId: rowdata.projectId};
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
			            	$('#msgbox').text('Entry has been deleted successfully');
							$('#msgbox').dialog( 
									{	title: 'Success',
										modal: true,
										buttons: {"Ok": function()  {
											$(this).dialog("close");} 
										}
									});
		                }
				    	// only used for adding new records
				    	var newId = null;
			        	
						return [result.success, errors, newId];
					}
	          	});
		else {
			$('#msgbox').text('You must select a record first!');
			$('#msgbox').dialog( 
					{	title: 'Error',
						modal: true,
						buttons: {"Ok": function()  {
							$(this).dialog("close");} 
						}
					});
		}
	}
	</script>
</html>