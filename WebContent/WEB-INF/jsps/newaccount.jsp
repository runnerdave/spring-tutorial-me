<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" media="all" />
<title>Create account</title>
</head>
<body>

<h2>Create account</h2>

	<sf:form action="${pageContext.request.contextPath}/createaccount" method="post" commandName="user">
		<table class="formtable">

			<tr>
				<td class="label">Name: </td>
				<td><sf:input name="username" type="text" class="control" path="username" /><br/>
				<sf:errors path="username" cssClass="error"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">Email: </td>
				<td><sf:input name="email" type="text" class="control" path="email"/><br/>
				<sf:errors path="email" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="label">Password: </td>
				<td><sf:input name="password" type="text" class="control" path="password"/><br/>
				<sf:errors path="email" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="label">Confirm Password: </td>
				<td><input name="confirmpass" type="text" class="control"/>
				</td>
			</tr>
			<tr>
				<td class="label"> </td>
				<td><input value="create account" type="submit" class="control" /></td>
			</tr>
		</table>
	</sf:form>


</body>
</html>