<%@page import="dao.LectureDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 강의 목록</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<div class="container">
		<h1>강의 목록</h1>
		<c:forEach var="lecture" items="${lectures}">
			<tags:lecture lecture="${lecture}"/>
		</c:forEach>
	</div>
</body>
</html>

