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
	<div class="sidebar-menu toggle-others fixed">
		<div class="sidebar-menu-inner">
			<header class="logo-env">
				<!-- logo -->
				<div class="logo">
					<a href="<c:url value='/index'/>" class="logo-expanded"
						style="color: #FFF">
						<h2>CRM系统</h2>
					</a> <a href="<c:url value='/index'/>" class="logo-collapsed"
						style="color: #FFF"> CRM </a>
				</div>
			</header>
			<!-- Menu -->
			<ul id="main-menu" class="main-menu">
				<c:forEach var="menu" items="${menuList }" varStatus="status">
					<c:if test="${menu.menuLevel==1 and status.index<1}">
						<c:if test="${menu.menuCss ==menuCss }">
							<li class="opened active">
						</c:if>
						<c:if test="${menu.menuCss !=menuCss }">
							<li>
						</c:if>
							<a href="${menu.menuUrl }">
								<i class="${menu.menuIcon }"></i> <span class="title">${menu.menuName }</span>
							</a>
							<ul>
					</c:if>
					<c:if test="${menu.menuLevel==1 and status.index>=1}">
							</ul>
						</li>
						<c:if test="${menu.menuCss ==menuCss }">
							<li class="opened active">
						</c:if>
						<c:if test="${menu.menuCss !=menuCss }">
							<li>
						</c:if>
							<a href="${menu.menuUrl }">
								<i class="${menu.menuIcon }"></i> <span class="title">${menu.menuName }</span>
							</a>
							<ul>
					</c:if>
					<c:if test="${menu.menuLevel==2 }">
						<li>
							<a href="<c:url value='${menu.menuUrl }'/>">
								<i class="${menu.menuIcon }"></i><span class="title">${menu.menuName }</span>
							</a>
						</li>
					</c:if>
				</c:forEach>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>