<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 게시물</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<% String category = request.getParameter("category"); %>
	<% String postid = request.getParameter("postid"); %>
	<%=category %>, <%=postid %> 게시물
</body>
</html>