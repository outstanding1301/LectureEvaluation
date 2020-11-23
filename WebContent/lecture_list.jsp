<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 강의 평가</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	강의 목록 <br>
	<a href="lecture.jsp?lec_id=1">강의 1</a>
</body>
</html>