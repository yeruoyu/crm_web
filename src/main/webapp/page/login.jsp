<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM系统</title>
	
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/linecons/css/linecons.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/fontawesome/css/font-awesome.min.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>' />
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-core.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-forms.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-components.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-skins.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/custom.css"/>'/>
	
	<script type='text/ecmascript' src='<c:url value="/resources/js/jquery-1.11.0.min.js"/>'></script>
</head>
<body class="page-body login-page">
<div class="login-container">
	
		<div class="row">
		
			<div class="col-sm-6">
			
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						
						
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								userCode: {
									required: true
								},
								
								passwd: {
									required: true
								}
							},
							
							messages: {
								userCode: {
									required: '请输入员工代码.'
								},
								
								passwd: {
									required: '请输入密码.'
								}
							},
							
							// Form Processing via AJAX
							submitHandler: function(form)
							{
								show_loading_bar(70); // Fill progress bar to 70% (just a given value)
								
								var opts = {
									"closeButton": true,
									"debug": false,
									"positionClass": "toast-top-full-width",
									"onclick": null,
									"showDuration": "300",
									"hideDuration": "1000",
									"timeOut": "5000",
									"extendedTimeOut": "1000",
									"showEasing": "swing",
									"hideEasing": "linear",
									"showMethod": "fadeIn",
									"hideMethod": "fadeOut"
								};
									
								$.ajax({
									url: '/crm_web/checkUser',
									method: 'POST',
									dataType: 'json',
									data: {
										do_login: true,
										userCode: $(form).find('#userCode').val(),
										userPassword: $(form).find('#passwd').val(),
									},
									success: function(resp)
									{
										show_loading_bar({
											delay: .5,
											pct: 100,
											finish: function(){
												
												// Redirect after successful login page (when progress bar reaches 100%)
												if(resp)
												{
													window.location.href = '/crm_web/index';
												}else{
													toastr.error("用户名或密码输入错误。", "登录失败!", opts);
													$passwd.select();
												}
																						}
										});
										
																		}
								});
								
							}
						});
						
						// Set Form focus
						$("form#login .form-group:has(.form-control):first .form-control").focus();
					});
				</script>
				
				<!-- Errors container -->
				<div class="errors-container">
						
				</div>
				
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login" action="/crm_web/checkUser" class="login-form fade-in-effect">
					<div class="login-header">
						<a href="index.html" class="logo">
							
							<span>留学用户登录</span>
						</a>
					</div>
	
					
					<div class="form-group">
						<label class="control-label" for="userCode">用户</label>
						<input type="text" class="form-control input-dark" name="userCode" id="userCode" autocomplete="off" />
					</div>
					
					<div class="form-group">
						<label class="control-label" for="passwd">密码</label>
						<input type="password" class="form-control input-dark" name="userPassword" id="passwd" autocomplete="off" />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-dark  btn-block text-left">
							<i class="fa-lock"></i>
							登录
						</button>
					</div>
				</form>
				</div>
			</div>
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
	<script type='text/ecmascript' src='<c:url value="/resources/jquery-validate/jquery.validate.js"/>'></script>
	<script type='text/ecmascript' src='<c:url value="/resources/toastr/toastr.js"/>'></script>
	
	<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-custom.js"/>'></script>

</html>