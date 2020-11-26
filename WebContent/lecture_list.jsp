<%@page import="dao.LectureDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 강의 목록</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<h1>강의 목록</h1>
	<%
	LectureDAO dao = new LectureDAO();
	ArrayList<LectureVO> lectures = dao.selectAll();
	
	for(LectureVO lecture : lectures) {
		%>
		<tags:lecture lecture="<%=lecture%>"/>
		<% 
	}
	%>
</body>
</html>