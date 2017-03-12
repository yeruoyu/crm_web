<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM系统</title>
</head>
<body>
	<nav class="navbar user-info-navbar" role="navigation">
		<!-- <ul class="user-info-menu left-links list-inline list-unstyled">
			<li class="hidden-sm hidden-xs"><a href="#"
				data-toggle="sidebar"> <i class="fa-bars"></i>
			</a></li>
		</ul> -->
		<ul class="user-info-menu right-links list-inline list-unstyled">
			<li class="dropdown user-profile"><a href="#"
				data-toggle="dropdown"> <img
					src="<c:url value='/resources/images/user-4.png'/>"
					alt="user-image" class="img-circle img-inline userpic-32"
					width="28" /> <span> ${user.userName } </span>
			</a></li>
		</ul>
	</nav>
</body>
</html>