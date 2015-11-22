<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" media="all" />
<title>Insert title here</title>
</head>
<body>


	<form action="${pageContext.request.contextPath}/docreate" method="post">
		<table class="formtable">

			<tr>
				<td class="label">Name: </td>
				<td><input name="name" type="text" class="control" /></td>
			</tr>
			<tr>
				<td class="label">Email: </td>
				<td><input name="email" type="text" class="control" /></td>
			</tr>
			<tr>
				<td class="label">Your offer: </td>
				<td><textarea cols="10" rows="10" name="text" class="control"></textarea> </td>
			</tr>
			<tr>
				<td class="label"> </td>
				<td><input value="create advert" type="submit" class="control" /></td>
			</tr>
		</table>
	</form>


</body>
</html>