<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 게시판</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<% String category = request.getParameter("category"); %>
	<%=category %> 게시판<br>
	<a href="post.jsp?category=<%=category %>&postid=1">글1</a><br>
	<a href="posting.jsp?category=<%=category %>">글쓰기</a>
</body>
</html>