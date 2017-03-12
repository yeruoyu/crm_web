<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 联系方式信息 -->
<c:url value="/contactInfo/custContacts" var="custContactsUrl"/>
<c:url value="/contactInfo/create" var="addContUrl" />
<c:url value="/contactInfo/update" var="editContUrl" />

<!-- 项目信息 -->
<c:url value="/project/enableProject" var="enableProjectUrl" />
<c:url value="/custProject/custProjects" var="custProjectsUrl"/>
<c:url value="/custProject/create" var="addCustProjectUrl" />
<c:url value="/custProject/update" var="editCustProjectUrl" />

<!-- 联系记录信息 -->
<c:url value="/custRecord/custRecords" var="custRecordsUrl"/>
<c:url value="/custRecord/create" var="addRecordUrl" />
<c:url value="/custRecord/update" var="editRecordUrl" />

<!-- 活动信息 -->
<c:url value="/custActivity/custActivitys" var="custActivitysUrl"/>
<c:url value="/activity/enableActivity" var="enableActivityUrl" />
<c:url value="/custActivity/create" var="addCustActivityUrl" />
<c:url value="/custActivity/update" var="editCustActivityUrl" />

<!-- 合约信息 -->
<c:url value="/custContract/custContracts" var="custContractsUrl"/>
<c:url value="/custContract/create" var="addContractUrl"/>
<c:url value="/custContract/update" var="editContractUrl"/>

<!-- 客户信息 -->
<c:url value="/customer/saveCustomer" var="saveCustomer"/>
<c:url value="/customer/customerEdit" var="createNext"/>
<c:url value="/customer/customerList" var="customerList"/>

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
							<strong>${customerTitle}</strong>
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
							<form role="form" id="customerInfoForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户代码</label>
									<input type="hidden" value="${customerEdit }" id="customerEdit" />
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${customerDto.customerCode }" id="customerCode" name="customerCode" readonly="readonly" placeholder="客户代码">
										<input type="hidden" value="${customerDto.customerCode }" id="custCode">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户姓名</label>
									
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${customerDto.customerName }" id="customerName" name="customerName" placeholder="客户姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户手机(客户唯一性校验)</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" value="${customerDto.customerMobile }" id="customerMobile" name="customerMobile" placeholder="客户手机">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">专业</label>
									<div class="col-sm-6">
										<select  id="couseCode" name="customerCourse" value="${customerDto.customerCourse}" class="form-control">
											<option value="">无</option>
											<c:if test="${customerEdit }">
												<c:forEach items="${curseDtos}" var="course">
													<c:if test="${customerDto.customerCourse==course.distCode}">
														<option value="${course.distCode}" selected="selected">${course.distValue }</option>
													</c:if>
													<c:if test="${customerDto.customerCourse!=course.distCode}">
														<option value="${course.distCode}">${course.distValue }</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${!customerEdit }">
												<c:forEach items="${curseDtos}" var="course">
													<option value="${course.distCode}">${course.distValue }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">来源渠道</label>
									<div class="col-sm-6">

										<select id="channelCode" name="channelCode"
											value="${customerDto.channelCode}" class="form-control">
											<option value="">--</option>
											<c:if test="${customerEdit }">
												<c:forEach items="${channelDtos}" var="channel">
													<c:if
														test="${customerDto.channelCode==channel.channelCode}">
														<option value="${channel.channelCode}" selected="selected">${channel.channelName }</option>
													</c:if>
													<c:if
														test="${customerDto.channelCode!=channel.channelCode}">
														<option value="${channel.channelCode}">${channel.channelName }</option>
													</c:if>

												</c:forEach>
											</c:if>
											<c:if test="${!customerEdit }">
												<c:forEach items="${channelDtos}" var="channel">
													<option value="${channel.channelCode}">${channel.channelName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">对应团队</label>
									<div class="col-sm-6">
										<select  id="groupId" name="groupCode" value="${customerDto.groupCode}" class="form-control">
											<option value="">--</option>
											<c:if test="${customerEdit }">
												<c:forEach items="${schoolDtos}" var="school">
													<c:if test="${customerDto.groupCode==school.schoolCode}">
														<option value="${school.schoolCode}" selected="selected">${school.schoolName }</option>
													</c:if>
													<c:if test="${customerDto.groupCode!=school.schoolCode}">
														<option value="${school.schoolCode}">${school.schoolName }</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${!customerEdit }">
												<c:forEach items="${schoolDtos}" var="school">
													<option value="${school.schoolCode}">${school.schoolName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户对应员工</label>
									<div class="col-sm-6">

										<select  id="userCode" name="userCode" value="${customerDto.userCode}" class="form-control">
											<option value="">--</option>
											<c:if test="${customerEdit }">
												<c:forEach items="${userDtos}" var="user">
													<c:if test="${customerDto.userCode==user.userCode}">
														<option value="${user.userCode}" selected="selected">${user.userName }</option>
													</c:if>
													<c:if test="${customerDto.userCode!=user.userCode}">
														<option value="${user.userCode}">${user.userName }</option>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${!customerEdit }">
												<c:forEach items="${userDtos}" var="user">
													<option value="${user.userCode}">${user.userName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户锁定状态</label>
									
									<div class="col-sm-6">
										<c:if test="${customerEdit }">
											<select id="customerLocked" name="customerLocked" value="${customerDto.customerLocked}" class="form-control">
												<option value="">--</option>
												<c:if test="${customerDto.customerLocked==1}">
													<option value="1" selected="selected">已锁定</option>
												</c:if>
												<c:if test="${customerDto.customerLocked!=1}">
													<option value="1">已锁定</option>
												</c:if>
												<c:if test="${customerDto.customerLocked==0}">
													<option value="0" selected="selected">未锁定</option>
												</c:if>
												<c:if test="${customerDto.customerLocked!=0}">
													<option value="0">未锁定</option>
												</c:if>
											</select>
										</c:if>
										<c:if test="${!customerEdit }">
											<select id="customerLocked" name="customerLocked" value="${customerDto.customerLocked}" class="form-control">
												<option value="">--</option>
												<option value="1">已锁定</option>
												<option value="0">未锁定</option>
											</select>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">客户状态</label>
									<div class="col-sm-6">
										<c:if test="${customerEdit }">
											<select id="customerStatus" name="customerStatus" value="${customerDto.customerStatus}" class="form-control">
												<option value="">--</option>
												<c:if test="${customerDto.customerStatus==1}">
													<option value="1" selected="selected">正常</option>
												</c:if>
												<c:if test="${customerDto.customerStatus!=1}">
													<option value="1">正常</option>
												</c:if>
												<c:if test="${customerDto.customerStatus==0}">
													<option value="0" selected="selected">停用</option>
												</c:if>
												<c:if test="${customerDto.customerStatus!=0}">
													<option value="0">停用</option>
												</c:if>
												<c:if test="${customerDto.customerStatus==0}">
													<option value="-1" selected="selected">注销</option>
												</c:if>
												<c:if test="${customerDto.customerStatus!=0}">
													<option value="-1">注销</option>
												</c:if>
											</select>
										</c:if>
										<c:if test="${!customerEdit }">
											<select id="customerStatus" name="customerStatus" value="${customerDto.customerStatus}" class="form-control">
												<option value="">--</option>
												<option value="1">正常</option>
												<option value="0">停用</option>
												<option value="-1">注销</option>
											</select>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">备注信息</label>
									<div class="col-sm-6">
										<textarea class="form-control" id="customerComments" name="customerComments" rows="3" placeholder="请填写备注信息">${customerDto.customerComments}</textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回客户列表</span>
										</button>
										<c:if test="${customerEdit }">
										<button type="button" class="btn btn-turquoise btn-icon pull-right" style="margin-left: 10px" id="createNext">
											<i class="fa-hand-o-right"></i>
											<span>添加下一个客户</span>
										</button>
										</c:if>
										<button type="button" class="btn btn-secondary btn-icon pull-right" id="saveCustomer">
											<i class="fa-check"></i>
											<span>保存客户信息</span>
										</button>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 客户联系信息 -->
			<div class="row clsEdit">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">联系方式</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<table id='contGrid' ></table>
							<div id='contPager'></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 客户感兴趣项目 -->
			<div class="row clsEdit">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">客户感兴趣项目</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<table id='projGrid' ></table>
							<div id='projPager'></div>
						</div>
					</div>
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
							<table id='recordGrid' ></table>
							<div id='recordPager'></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 活动记录 -->
			<div class="row clsEdit">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">活动记录</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- 活动记录 -->
							<table id='activityGrid' ></table>
							<div id='activityPager'></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 签约信息 -->
			<div class="row clsEdit">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">签约信息</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
							</div>
						</div>
						<div class="panel-body">
							<!-- 签约信息 -->
							<table id='contractGrid' ></table>
							<div id='contractPager'></div>
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
<script type='text/ecmascript' src='<c:url value="/resources/js/jquery.json-2.4.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/i18n/grid.locale-cn.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/jquery.jqGrid.js"/>'></script>

<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"/>'></script>

<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap3-typeahead.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/jquery.bootstrap.teninedialog.v3.js"/>'></script>

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
	$(function(){
		//var editFlag = $("#customerEdit").val();
		var editFlag = ${customerEdit };
		if(editFlag){
			 $(".clsEdit").css("display","inline");
		}else{
			 $(".clsEdit").css("display","none");
		}
	});
	//添加下一条记录
	$("#createNext").click(function(){
		
		var url = '${createNext}';
		window.location.href= url;
	});
	
	//返回到客户列表
	$("#backToList").click(function(){
		var url='${customerList}';
		window.location.href= url;
	});
	
	// 保存客户信息
	$("#saveCustomer").click(function(){
		var customerDto = $.toJSON($('#customerInfoForm').serializeObject());
		$.ajax({
			url : "${saveCustomer}",  
			type : "POST",  
			datatype:"json",  
			contentType: "application/json; charset=utf-8",  
			data : customerDto,  
			success :function(response, postdata) {
				var result = response.success;
				var errors = "";
				if (result == false) {
					for (var i = 0; i < response.message.length; i++) {
						errors += response.message[i] + "<br/>";
					}
					$.teninedialog({
	                    title:'系统提示',
	                    content:'用户保存失败：'+errors
	                });
				} else {
					$.teninedialog({
						title:'系统提示',
						content:'用户保存成功。'
					});
					$(".clsEdit").css("display","inline");
				}
			}
		});
	});

	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>
<!-- 联系方式 -->
<script type="text/ecmascript">
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
	$("#contGrid").jqGrid({
		url : '${custContactsUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'contactId',
			name : 'contactId',
			label : 'ID',
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
		},{
			name : 'customerCode',
			index : 'customerCode',
			label : '客户代码',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				readonly : true,
				value:$('#custCode').val()
			}
		}, {
			name : 'contactName',
			index : 'contactName',
			label : '联系人',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactLocal',
			index : 'contactLocal',
			label : '地区',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactAddress',
			index : 'contactAddress',
			label : '联系地址',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactZip',
			index : 'contactZip',
			label : '邮编',
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
			name : 'contactPhone',
			index : 'contactPhone',
			label : '联系电话',
			width : 100,
			editable : true,
			editrules : {
				required : false,
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactMobile',
			index : 'contactMobile',
			label : '联系手机',
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
			name : 'contactEmail',
			index : 'contactEmail',
			label : 'Email',
			width : 100,
			editable : true,
			editrules : {
				required : false,
				email:true
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactQq',
			index : 'contactQq',
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
			name : 'contactWebchat',
			index : 'contactWebchat',
			label : '微信',
			width : 100,
			editable : true,
			editrules : {
				required : false,
			},
			editoptions : {
				size : 10
			}
		}, {
			name : 'contactStatus',
			index : 'contactStatus',
			label : '状态',
			width : 100,
			editable : true,
			editrules : {
				required : false,
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : "1:有效;0:无效"
			},
			formatoptions : {
				value : "1:有效;0:无效"
			}
			
		} ],
		postData : {},
		rowNum : 10,
		rowList : [10, 20],
		
		autowidth : true,
		rownumbers : false,
		pager : '#contPager',
		//sortname : 'contactId',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#contGrid").trigger("reloadGrid");
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

	$("#contGrid").jqGrid('navGrid', '#contPager', {
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

	$("#contGrid").navButtonAdd('#contPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addContRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加联系方式",
		cursor : "pointer"
	});

	$("#contGrid").navButtonAdd('#contPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editContRow,
		closeAfterEdit : true,
		position : "last",
		title : "编辑联系方式",
		cursor : "pointer"
	});
});

function addContRow() {
	// Get the currently selected row
	$('#contGrid').jqGrid('editGridRow', 'new', {
		url : '${addContUrl}?custCode='+$('#custCode').val(),
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
                    content:'添加用户联系成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editContRow() {
	// Get the currently selected row
	var row = $('#contGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#contGrid').jqGrid('editGridRow', row, {
			url : '${editContUrl}',
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
	                    content:'修改客户联系方式成功。'
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
<!-- 项目信息 -->
<script type="text/ecmascript">
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
	$("#projGrid").jqGrid({
		url : '${custProjectsUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'cpId',
			name : 'cpId',
			label : 'ID',
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
		},{
			index : 'customerCode',
			name : 'customerCode',
			label : '客户代码',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
				readonly : true,
				value:$('#custCode').val()
			}
		}, {
			name : 'projectCode',
			index : 'projectCode',
			label : '项目代码',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : getEnableProject()
			}
		}, {
			name : 'projectName',
			index : 'projectName',
			label : '项目名称',
			width : 100,
			editable : false
		}, {
			name:'projectPrice',
			index:'projectPrice',
			label : '项目价格',
			width : 80,
			editable:false,
			formatter: 'currency',
			formatoptions: {prefix: "￥" }
		}, {
			name:'schoolName',
			index:'schoolName',
			label : '对应学校',
			width : 80,
			editable:false
		},
   		{
			name : 'countryName',
			index : 'countryName',
			label : '对应国家',
			width : 80,
			editable:false
		},
		{
			name : 'startDate',
			index : 'startDate',
			label:'开始日期',
			width : 80,
			editable:false
		},
		{
			name : 'stopDate',
			index : 'stopDate',
			label:'结束日期',
			width : 80,
			editable:false
		},
  		{
			name:'projectStatus',
			index:'projectStatus',
			label:'项目状态',
			editable:false,
			width : 60,
			formatter:'select',
  				formatoptions:{value:"1:启用;0:禁用"}
   		},
		{
			name : 'comments',
			index : 'comments',
			label:'备注',
			width : 80,
			editable:true
		}],
		postData : {},
		rowNum : 10,
		rowList : [10, 20],
		
		autowidth : true,
		rownumbers : false,
		pager : '#projPager',
		//sortname : 'cpId',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#projGrid").trigger("reloadGrid");
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

	$("#projGrid").jqGrid('navGrid', '#projPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});

	$("#projGrid").navButtonAdd('#projPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addProjRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加项目",
		cursor : "pointer"
	});

	$("#projGrid").navButtonAdd('#projPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editProjRow,
		closeAfterEdit : true,
		position : "last",
		title : "修改项目",
		cursor : "pointer"
	});
});

function addProjRow() {
	// Get the currently selected row
	$('#projGrid').jqGrid('editGridRow', 'new', {
		url : '${addCustProjectUrl}?custCode='+$('#custCode').val(),
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
                    content:'客户感兴趣的项目添加成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editProjRow() {
	// Get the currently selected row
	var row = $('#projGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#projGrid').jqGrid('editGridRow', row, {
			url : '${editCustProjectUrl}',
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
	                    content:'客户感兴趣的项目修改成功。'
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
		height : 200,
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
<!-- 活动记录 -->
<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#activityGrid").jqGrid({
		url : '${custActivitysUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'caId',
			name : 'caId',
			label : 'ID',
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
			name : 'customerName',
			index : 'customerName',
			label : '客户姓名',
			width : 80,
			editable : false
		}, {
			index : 'activityCode',
			name : 'activityCode',
			label : '活动代码',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : getEnableActivity()
			}
		}, {
			name : 'activityTitle',
			index : 'activityTitle',
			label : '活动标题',
			width : 100,
			editable : false
		}, {
			name : 'activityAddress',
			index : 'activityAddress',
			label : '活动地址',
			width : 100,
			editable : false
		}, {
			name : 'activityStartDate',
			index : 'activityStartDate',
			label : '开始时间',
			width : 100,
			editable : false
		}, {
			name : 'activityStopDate',
			index : 'activityStopDate',
			label : '结束时间',
			width : 80,
			editable : false
		},{
			name:'activityStatus',
			index:'activityStatus',
			label:'活动状态',
			editable:false,
			width : 60,
			formatter:'select',
  				formatoptions:{value:"1:进行中;0:已结束"}
   		},
		{
			name : 'comments',
			index : 'comments',
			label:'备注',
			width : 80,
			editable:true
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#activityPager',
		//sortname : 'recordId',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#activityGrid").trigger("reloadGrid");
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

	$("#activityGrid").jqGrid('navGrid', '#activityPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});
	$("#activityGrid").navButtonAdd('#activityPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addActivityRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加活动",
		cursor : "pointer"
	});

	$("#activityGrid").navButtonAdd('#activityPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editActivityRow,
		closeAfterEdit : true,
		position : "last",
		title : "修改轰动",
		cursor : "pointer"
	});
});

function addActivityRow() {
	// Get the currently selected row
	$('#activityGrid').jqGrid('editGridRow', 'new', {
		url : '${addCustActivityUrl}?custCode='+$('#custCode').val(),
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
                    content:'客户感兴趣的活动添加成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editActivityRow() {
	// Get the currently selected row
	var row = $('#activityGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {
		$('#activityGrid').jqGrid('editGridRow', row, {
			url : '${editCustActivityUrl}',
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
	                    content:'客户感兴趣的活动修改成功。'
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
<!-- 签约记录 -->
<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#contractGrid").jqGrid({
		url : '${custContractsUrl}'+'?customerCode='+$('#customerCode').val(),
		datatype : 'json',
		mtype : 'GET',
		colModel : [ {
			index : 'ccId',
			name : 'ccId',
			label : 'ID',
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
		},{
			index : 'customerCode',
			name : 'customerCode',
			label : '客户代码',
			hidden:false,
			width : 55,
			editable : true,
			editrules : {
				required : false,
			},
			editoptions : {
				readonly : true,
			}
		}, {
			name : 'customerName',
			index : 'customerName',
			label : '客户姓名',
			width : 80,
			editable : false,
			
		}, {
			name : 'contractCode',
			index : 'contractCode',
			label : '合同代码',
			width : 100,
			editable : true,
			editrules : {
				required : true,
			}
		}, {
			name : 'signedTime',
			index : 'signedTime',
			label : '签约时间',
			width : 100,
			editable : true,
			editrules : {
				required : false
			},
			editoptions : {
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
			}
		}, {
			name : 'comments',
			index : 'comments',
			label : '备注',
			width : 100,
			editable : true,
			editrules : {
				required : false,
			}
		}],
		postData : {},
		rowNum : 5,
		rowList : [ 5, 10, 20, 40, 60 ],
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#contractPager',
		//sortname : 'recordId',
		viewrecords : true,
		sortable : true,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#contractGrid").trigger("reloadGrid");
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

	$("#contractGrid").jqGrid('navGrid', '#contractPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});
	
	$("#contractGrid").navButtonAdd('#contractPager', {
		caption : "添加",
		buttonicon : "glyphicon-plus",
		onClickButton : addContractRow,
		closeAfterEdit : true,
		position : "last",
		title : "添加合约",
		cursor : "pointer"
	});

	$("#contractGrid").navButtonAdd('#contractPager', {
		caption : "修改",
		buttonicon : "glyphicon-edit",
		onClickButton : editContractRow,
		closeAfterEdit : true,
		position : "last",
		title : "编辑合约",
		cursor : "pointer"
	});
});

function addContractRow() {
	// Get the currently selected row
	$('#contractGrid').jqGrid('editGridRow', 'new', {
		url : '${addContractUrl}?custCode='+$('#custCode').val(),
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
                    content:'添加合约成功。'
                });
			}
			// only used for adding new records
			var newId = null;

			return [ result.success, errors, newId ];
		}
	});
} // end of addRow

function editContractRow() {
	// Get the currently selected row
	var row = $('#contractGrid').jqGrid('getGridParam', 'selrow');
	
	if (row != null) {

		$('#contractGrid').jqGrid('editGridRow', row, {
			url : '${editContractUrl}',
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
	                    content:'修改合约成功。'
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

function getEnableProject(){
	var str=":;";
	$.ajax({
		type:'post',
		async:false,
		url:'${enableProjectUrl}',
		success:function(data){
			if (data != null) {
				var length=data.length;
				for(var i=0;i<length;i++){
					if(i!=length-1){
						str+=data[i].projectCode+":"+data[i].projectName+";";
					}else{ 
						str+=data[i].projectCode+":"+data[i].projectName;
					}
				}
			}
		}
	});
	return str;
}

function getEnableActivity(){
	var str=":;";
	$.ajax({
		type:'post',
		async:false,
		url:'${enableActivityUrl}',
		success:function(data){
			if (data != null) {
				var length=data.length;
				for(var i=0;i<length;i++){
					if(i!=length-1){
						str+=data[i].activityCode+":"+data[i].activityTitle+";";
					}else{ 
						str+=data[i].activityCode+":"+data[i].activityTitle;
					}
				}
			}
		}
	});
	return str;
}
</script>
</html>