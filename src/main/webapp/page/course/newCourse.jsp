<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/course/createCourse" var="createUrl" />
<c:url value="/course/courseList" var="courseList"/>

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
<style>
.error{
	color:red;
}
</style>
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
						<li><a href="<c:url value='/course/courseList'/>">课程管理</a>
						</li>
						<li class="active"><strong>添加课程</strong></li>
					</ol>
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">课程信息</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<form role="form" id="courseForm" class="form-horizontal col-sm-10 "> <!-- validate -->
								<div class="form-group">
									<!-- 课程代码 -->
									<label class="col-sm-2 control-label" for="field-1">课程代码</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="courseCode" name="courseCode" readonly="readonly">
									</div>
									<!-- 课程名称 -->
									<label class="col-sm-2 control-label" for="field-1">课程名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="courseName" name="courseName" placeholder="请输入课程名称">
									</div>
								</div>
								<div class="form-group">
									<!-- 客户英文名 -->
									<label class="col-sm-2 control-label" for="field-1">课时数</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="courseHour" name="courseHour" placeholder="请输入课时数">
									</div>
									<!-- 客户性别 -->
									<label class="col-sm-2 control-label" for="field-1">课程价格</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" value="" id="coursePrice" name="coursePrice" placeholder="请输入课程价格">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">课程内容</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" id="courseContent" name="courseContent"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="field-1">课程备注</label>
									
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" id="courseRemark" name="courseRemark"></textarea>
									</div>
								</div>
								<div class="form-group">
									<!-- 课程状态-->
									<label class="col-sm-2 control-label" for="field-1">课程状态 </label>
									<div class="col-sm-4">
										<select  id="courseStatus" name="courseStatus" value="" class="form-control">
											<option value="1">有效</option>
						 					<option value="0">无效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="button" class="btn btn-blue btn-icon pull-right" style="margin-left: 10px" id="backToList">
											<i class="fa-share"></i>
											<span>返回课程列表</span>
										</button>
										<button type="submit" class="btn btn-secondary btn-icon pull-right" id="saveCourse">
											<i class="fa-check"></i>
											<span>保存课程信息</span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>

<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/js/multiselect/css/multi-select.css"/>' />

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
<script type="text/ecmascript" src='<c:url value="/resources/js/multiselect/js/jquery.multi-select.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/jquery-validate/jquery.validate.min.js"/>'></script>

<script type='text/ecmascript'>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>

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

//返回到客户列表
$("#backToList").click(function(){
	var url='${courseList}';
	window.location.href= url;
});

$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	$("#courseForm").validate({
	onsubmit:true,// 是否在提交是验证 
	onfocusout:false,// 是否在获取焦点时验证 
	onkeyup :false,// 是否在敲击键盘时验证 
	rules: {
		"courseName":{required: true},
		"courseHour":{required: true},
		"coursePrice":{required: true},
		"courseContent":{required: true}
		
	}, 
	messages:{
		"courseName":{required: "课程名称不能为空。"},
		"courseHour":{required: "课时数不能为空。"},
		"coursePrice":{required: "课程价格不能为空。"},
		"courseContent":{required: "课程内容不能为空。"},
	}
	});
});
/* 提交数据*/
$.validator.setDefaults({
    submitHandler: function() {
    	var courseDto = $.toJSON($('#courseForm').serializeObject()); //serializeObject	
		$.ajax({
			url : "${createUrl}",  
			type : "POST",
			datatype:"json",  
			contentType: "application/json; charset=utf-8",  
			data : courseDto,  
			success :function(response, postdata) {
				var result = response.success;
				var errors = "";
				if (result == false) {
					for (var i = 0; i < response.message.length; i++) {
						errors += response.message[i] + "<br/>";
					}
					$.teninedialog({
	                    title:'系统提示',
	                    content:'课程保存失败：'+errors
	                });
				} else {
					$.teninedialog({
						title:'系统提示',
						content:'课程保存成功。'
					});
					$(".clsEdit").css("display","inline");
				}
			}
		});
    }
});

</script>
</html>