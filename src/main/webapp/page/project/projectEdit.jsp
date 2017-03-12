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
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/bootstrap.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-core.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-forms.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-components.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-skins.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/custom.css"/>'/>
	
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>
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
							<a href="<c:url value='/project/projectList'/>">项目管理</a>
						</li>
						<li class="active">
							<strong>项目列表</strong>
						</li>
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
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</div>
	
	<!-- Bottom Scripts -->
	<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/TweenMax.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/resizeable.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/joinable.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/xenon-api.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/xenon-toggles.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/rwd-table/js/rwd-table.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/xenon-custom.js"/>'></script>
</body>
</html>