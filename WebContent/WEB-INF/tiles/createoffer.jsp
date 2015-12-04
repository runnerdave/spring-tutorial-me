<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>	
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
