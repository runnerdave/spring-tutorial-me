<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<!-- default header name is X-CSRF-TOKEN-->	
<meta name="_csrf_header" content="${_csrf.headerName}"/>	
  
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/script/jquery.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/main.css"
	type="text/css" media="all" />
	
	<tiles:insertAttribute name="includes"></tiles:insertAttribute>

</head>
<body>

	<div class="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>

	<div class="content">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>

	<hr/>
	
	<div class="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>

</body>
</html>