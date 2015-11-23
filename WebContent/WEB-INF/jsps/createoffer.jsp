<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" media="all" />
<title>Insert title here</title>
</head>
<body>


	<sf:form action="${pageContext.request.contextPath}/docreate" method="post" commandName="offer">
		<table class="formtable">

			<tr>
				<td class="label">Name: </td>
				<td><sf:input name="name" type="text" class="control" path="name" /><br/>
				<sf:errors path="name" cssClass="error"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">Email: </td>
				<td><sf:input name="email" type="text" class="control" path="email"/><br/>
				<sf:errors path="email" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="label">Your offer: </td>
				<td><sf:textarea cols="10" rows="10" name="text" class="control" path="text"></sf:textarea><br/>
				<sf:errors path="text" cssClass="error"/></td>
			</tr>
			<tr>
				<td class="label"> </td>
				<td><input value="create advert" type="submit" class="control" /></td>
			</tr>
		</table>
	</sf:form>


</body>
</html>