<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



	<p>
		<a href="<c:url value="/offers" />">List offers</a>
	</p>

	<p>
		<a href="<c:url value="/createoffer" />">Create
			offers</a>
	</p>

	<p>
		<a href="<c:url value="/newaccount" />">Create
			account</a>
	</p>	

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<p>
			<a href="<c:url value="/admin" />">Admin</a>
		</p>
	</sec:authorize>

