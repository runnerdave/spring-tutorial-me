<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/jquery.js"></script>

<script type="text/javascript">
	function onLoad() {
		$("#password").keyup(checkPasswordsMatch);
		$("#confirmpass").keyup(checkPasswordsMatch);
		
		$("#details").submit(canSubmit);
	}

	function canSubmit() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		if(password != confirmpass) {
			alert("Passwords do not match");
			return false;
		} else {
			return true;
		}
	}
	
	function checkPasswordsMatch() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		if (password.length > 3 || confirmpass.length > 3) {

			if (password == confirmpass) {
				$("#matchpass").text("<fmt:message key='MatchedPasswords.user.password'></fmt:message>");
				$("#matchpass").addClass("valid");
				$("#matchpass").removeClass("error");
			} else {
				$("#matchpass").text("<fmt:message key='UnmatchedPasswords.user.password'></fmt:message>");
				$("#matchpass").addClass("error");
				$("#matchpass").removeClass("valid");
			}

		}
	}

	$(document).ready(onLoad); 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/main.css"
	type="text/css" media="all" />
<title>Create account</title>
</head>
<body>

	<h2>Create account</h2>

	<sf:form id="details" action="${pageContext.request.contextPath}/createaccount"
		method="post" commandName="user">
		<table class="formtable">

			<tr>
				<td class="label">Name:</td>
				<td><sf:input name="username" type="text" class="control"
						path="username" />
					<div class="error">
						<sf:errors path="username"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Email:</td>
				<td><sf:input name="email" type="text" class="control"
						path="email" />
					<div class="error">
						<sf:errors path="email" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Password:</td>
				<td><sf:input id="password" name="password" type="text"
						class="control" path="password" />
					<div class="error">
						<sf:errors path="password" />
					</div></td>
			</tr>
			<tr>
				<td class="label">Confirm Password:</td>
				<td><input id="confirmpass" name="confirmpass" type="text"
					class="control" />
					<div id="matchpass"></div></td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input value="create account" type="submit" class="control" /></td>
			</tr>
		</table>
	</sf:form>


</body>
</html>