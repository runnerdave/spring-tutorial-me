<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Administration</h1>

	<table class="formtable">
		<tr>
			<td>Username</td>
			<td>Email</td>
			<td>Role</td>
			<td>Enabled</td>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td><c:out value="${user.username}" /></td>
				<td><c:out value="${user.email}" /></td>
				<td><c:out value="${user.authority}" /></td>
				<td><c:out value="${user.enabled}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>