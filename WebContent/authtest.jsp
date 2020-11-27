<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<h1>인증 테스트!</h1>
	<% UserVO user = (UserVO) session.getAttribute("user"); %>
	<p>ID : <%=user.getId() %></p>
	<p>username : <%=user.getUsername() %></p>
</body>
</html>