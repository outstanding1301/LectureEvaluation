<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<%
	String msg = "";
	if (exception != null)
		msg = exception.getMessage();
	if (request.getAttribute("message") != null)
		msg = request.getAttribute("message").toString();
	%>
	<div class="container">
		<h1>에러!</h1>
		<h3><%=msg %></h3>
	</div>
</body>
</html>