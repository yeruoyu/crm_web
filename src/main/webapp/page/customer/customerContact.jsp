<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/customer/customerList" var="customerList"/>
<c:url value="/customer/customerEdit" var="customerEdit"/>


<!-- 联系记录信息 -->
<c:url value="/custRecord/custRecords" var="custRecordsUrl"/>
<c:url value="/custRecord/create" var="addRecordUrl" />
<c:url value="/custRecord/update" var="editRecordUrl" />

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
							<strong>添加联系记录</strong>
						</li>
					</ol>		
				</div>
			</div>
			<!-- 联系记录 -->
			<div class="row clsEdit">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">联系记录</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- 联系记录 -->
							<div>
								<table id='recordGrid' ></table>
								<div id='recordPager'></div>
								<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-top: 20px;margin-left: 10px" id="backToList">
									<i class="fa-share"></i>
									<span>返回客户列表</span>
								</button>
								<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-top: 20px;margin-left: 10px" id="customerEdit">
									<i class="fa-share"></i>
									<span>跳转客户修改页面</span>
								</button>
							</div>
							
						</div>
					</div>
				</div>
				
			</div>
			<!-- 客户基本信息 -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">客户基本</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="customerForm" class="form-horizontal col-sm-10">
								<div class="form-group">
									<!-- 客户代码 -->
									<label class="col-sm-2 control-label" for="field-1">客户代码</label>
									<div class="col-sm-4">
										<input type="hidden" value="${customerDto.customerCode}" id="custCode" />
										<input type="text" class="form-control" value="${customerDto.customerCode}" id="customerCode" name="customerCode" readonly="readonly">
									</div>
									<!-- 客户姓名 -->
									<label class="col-sm-2 control-label" for="field-1">客户姓名</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerName}" id="customerName" name="customerName" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<!-- 客户英文名 -->
									<label class="col-sm-2 control-label" for="field-1">客户英文名/昵称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerEName}" id="customerEName" name="customerEName" readonly="readonly">
									</div>
									<!-- 客户性别 -->
									<label class="col-sm-2 control-label" for="field-1">客户性别</label>
									<div class="col-sm-4">
										<c:if test="${customerDto.customerSex==1}">
											<input type="text" class="form-control" id="customerSex" name="customerSex" value="男" readonly="readonly"/>
										</c:if>
										<c:if test="${customerDto.customerSex==0}">
											<input type="text" class="form-control" id="customerSex" name="customerSex" value="女" readonly="readonly"/>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<!-- 身份证 -->
									<label class="col-sm-2 control-label" for="field-1">身份证 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerCredit}" id="customerCredit" name="customerCredit" readonly="readonly">
									</div>
									<!-- 出生年月 -->
									<label class="col-sm-2 control-label" for="field-1">出生年月</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerBirthday}" id="customerBirthday" name="customerBirthday" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<!-- 目前所在学校-->
									<label class="col-sm-2 control-label" for="field-1">目前所在学校 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerSchool}" id="customerSchool" name="customerSchool" readonly="readonly" />
									</div>
									<!-- 目前年级-->
									<label class="col-sm-2 control-label" for="field-1">年级 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerGrade}" id="customerGrade" name="customerGrade" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 目前现在专业-->
									<label class="col-sm-2 control-label" for="field-1">现在专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMajor}" id="customerMajor" name="customerMajor" readonly="readonly" />
									</div>
									<!-- 意向专业-->
									<label class="col-sm-2 control-label" for="field-1">意向专业 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionMajor}" id="intentionMajor" name="intentionMajor" readonly="readonly" />
									</div>
								</div>
								
								<div class="form-group">
									<!-- 意向国家-->
									<label class="col-sm-2 control-label" for="field-1">意向国家 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionContry}" id="intentionContry" name="intentionContry" readonly="readonly" />
									</div>
									<!-- 意向状态-->
									<label class="col-sm-2 control-label" for="field-1">意向状态 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.intentionStatus}" id="intentionStatus" name="intentionStatus" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 负责人-->
									<label class="col-sm-2 control-label" for="field-1">负责人 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.principalName}" id="principalName" name="principalName" readonly="readonly" />
									</div>
									<!-- 所属团队 -->
									<label class="col-sm-2 control-label" for="field-1">所属团队 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerGroupName}" id="customerGroupName" name="customerGroupName" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 来源渠道 -->
									<label class="col-sm-2 control-label" for="field-1">来源渠道 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.channelName}" id="channelName" name="channelName" readonly="readonly" />
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">E-Mail</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerEmail}" id="customerEmail" name="customerEmail" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">联系电话1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerPhone1}" id="customerPhone1" name="customerPhone1" readonly="readonly" />
									</div>
									<!-- E-mail -->
									<label class="col-sm-2 control-label" for="field-1">联系电话2</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerPhone2}" id="customerPhone2" name="customerPhone2" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机1 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMobile1}" id="customerMobile1" name="customerMobile1" readonly="readonly">
									</div>
									<!-- 手机-->
									<label class="col-sm-2 control-label" for="field-1">手机2 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerMobile2}" id="customerMobile2" name="customerMobile2" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<!-- QQ-->
									<label class="col-sm-2 control-label" for="field-1">QQ </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerQq}" id="customerQq" name="customerQq" readonly="readonly" />
									</div>
									<!-- 微信 -->
									<label class="col-sm-2 control-label" for="field-1">微信</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerWeiChat}" id="customerWeiChat" name="customerWeiChat" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 省份 -->
									<label class="col-sm-2 control-label" for="field-1">省市 </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${province.areaName} ${city.cityName}" readonly="readonly" />
									</div>
									<!-- 邮编 -->
									<label class="col-sm-2 control-label" for="field-1">邮编</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="${customerDto.customerZipcode}" id="customerZipcode" name="customerZipcode" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<!-- 地址-->
									<label class="col-sm-2 control-label" for="field-1">地址 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" value="${customerDto.customerAddress}" id="customerAddress" name="customerAddress" readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">备注信息</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" id="customerComments" name="customerComments" readonly="readonly">${customerDto.customerComments}</textarea>
									</div>
								</div>
								<div class="form-group">
									<!-- 客户锁定状态 -->
									<label class="col-sm-2 control-label" for="field-1">锁定状态</label>
									<div class="col-sm-4">
										<c:if test="${customerDto.customerLocked==1}">
											<input type="text" class="form-control" id="customerLocked" name="customerLocked" value="锁定" readonly="readonly"/>
										</c:if>
										<c:if test="${customerDto.customerLocked==0}">
											<input type="text" class="form-control" id="customerLocked" name="customerLocked" value="未锁定" readonly="readonly"/>
										</c:if>
									</div>
									<!-- 客户状态 -->
									<label class="col-sm-2 control-label" for="field-1">客户性别</label>
									<div class="col-sm-4">
										<c:if test="${customerDto.customerStatus==1}">
											<input type="text" class="form-control" id="customerStatus" name="customerStatus" value="有效" readonly="readonly"/>
										</c:if>
										<c:if test="${customerDto.customerStatus==0}">
											<input type="text" class="form-control" id="customerStatus" name="customerStatus" value="无效" readonly="readonly"/>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<!-- 签约状态 -->
									<label class="col-sm-2 control-label" for="field-1">签约状态</label>
									<div class="col-sm-4">
										<c:if test="${customerDto.accountStatus==1}">
											<input type="text" class="form-control" id="accountStatus" name="accountStatus" value="签约" readonly="readonly"/>
										</c:if>
										<c:if test="${customerDto.accountStatus==0}">
											<input type="text" class="form-control" id="accountStatus" name="accountStatus" value="未签约" readonly="readonly"/>
										</c:if>
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
<script type='text/ecmascript' src='<c:url value="/resources/js/datepicker/bootstrap-datepicker.js"/>'></script>
<%-- 
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"/>'></script>
 --%>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap3-typeahead.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/jquery.bootstrap.teninedialog.v3.js"/>'></script>	

<script type='text/ecmascript'>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
	
	//返回到客户列表
	$("#backToList").click(function(){
		var url='${customerList}';
		window.location.href= url;
	});
	
	$("#customerEdit").click(function(){
		var custCode=$('#custCode').val();
		var url='${customerEdit}?customerCode='+custCode;
		window.location.href= url;
	});
</script>
<!-- 联系记录 -->
<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#recordGrid").jqGrid({
		url : '${custRecordsUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'recordId',
			name : 'recordId',
			label : '联系ID',
			hidden:true,
			width : 55,
			key : true,
			editable : true,
			editrules : {
				required : false,
				edithidden:true
			},
			editoptions : {
				readonly : true,
			}
		}, {
			name : 'customerCode',
			index : 'customerCode',
			label : '客户代码',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				readonly : true,
				value:$('#custCode').val()
			}
		}, {
			name : 'recordName',
			index : 'recordName',
			label : '联系人姓名',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		}, {
			index : 'recordType',
			name : 'recordType',
			label : '联系类型',
			width : 100,
			editable : true,
			editrules : {
				required : true
			}
			
		}, {
			name : 'recordTime',
			index : 'recordTime',
			label : '联系时间',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datepicker({
						autoclose: true,
						format: 'yyyy-mm-dd',
						orientation : 'auto bottom'
                    });
					
					/* $(element).datetimepicker({
				        //language:  'fr',
				        minView: "month", //选择日期后，不会再跳转去选择时分秒 
　　						format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						forceParse: 0,
				        showMeridian: 1
				    }); */
				}
			}
		}, {
			name : 'recordNTime',
			index : 'recordNTime',
			label : '下次联系时间',
			width : 100,
			editable : true,
			editrules : {
				required : true
			},
			editoptions : {
				size : 10,
				dataInit : function(element) {
					$(element).datepicker({
						autoclose: true,
						format: 'yyyy-mm-dd',
						orientation : 'auto bottom'
                    });
					
					/* $(element).datetimepicker({
				        //language:  'fr',
				        minView: "month", //选择日期后，不会再跳转去选择时分秒 
　　						format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
				        weekStart: 1,
				        todayBtn:  1,
						autoclose: 1,
						todayHighlight: 1,
						startView: 2,
						forceParse: 0,
				        showMeridian: 1
				    }); */
				}
			}
		}, {
			name : 'recordResult',
			index : 'recordResult',
			label : '联系结果',
			width : 100,
			editable : true,
			editrules : {
				required : true
			}
		}, {
			name : 'recordPhone',
			index : 'recordPhone',
			label : '联系电话',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		}, {
			name : 'recordAddress',
			index : 'recordAddress',
			label : '联系地址',
			width : 80,
			editable : true,
			editrules : {
				required : false
			}
		}, {
			name : 'recordComment',
			index : 'recordComment',
			label : '备注',
			width : 100,
			editable : true,
			editrules : {
				required : false
			}
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 250,
		autowidth : true,
		rownumbers : false,
		pager : '#recordPager',
		//sortname : 'recordId',
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
	}, {}, {}, {}, {});
	
	$("#recordGrid").navButtonAdd('#recordPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addRecordRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加联系记录",
		cursor : "pointer"
	});

	$("#recordGrid").navButtonAdd('#recordPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editRecordRow,
		closeAfterEdit : true,
		position : "last",
		title : "编辑联系记录",
		cursor : "pointer"
	});
});
function addRecordRow() {
	// Get the currently selected row
	$('#recordGrid').jqGrid('editGridRow', 'new', {
		url : '${addRecordUrl}?custCode='+$('#custCode').val(),
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
                    content:'添加客户联系方式成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editRecordRow() {
	// Get the currently selected row
	var row = $('#recordGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#recordGrid').jqGrid('editGridRow', row, {
			url : '${editRecordUrl}',
			editData : {},
			recreateForm : true,
			beforeShowForm : function(form) {
				$('#pData').hide();
				$('#nData').hide();
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
	                    content:'修改客户联系记录成功。'
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
</script>
</html>