<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
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
	<a href="authtest.jsp">AUTH TEST</a>
	<%
		UserDAO userDAO = new UserDAO();
		ArrayList<UserVO> users = userDAO.selectAll();
		
		for (UserVO user : users) {
			out.println(user.toString()+"<br>");
		}
	%>
</body>
</html>