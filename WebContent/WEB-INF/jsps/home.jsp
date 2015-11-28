<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hi there caballos!

	<p>
		<a href="${pageContext.request.contextPath}/offers">List offers</a>
	</p>

	<p>
		<a href="${pageContext.request.contextPath}/createoffer">Create
			offers</a>
	</p>

	<p>
		<a href="${pageContext.request.contextPath}/newaccount">Create
			account</a>
	</p>
	
	<sec:authorize access="!isAuthenticated()">
	<p>
		<a href="${pageContext.request.contextPath}/login">Login
			</a>
	</p>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<p>
			<a href="${pageContext.request.contextPath}/admin">Admin</a>
		</p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<c:url var="logoutUrl" value="/logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log	out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</sec:authorize>
</body>
</html>