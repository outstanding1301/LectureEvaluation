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
<title>강의 평가 사이트 - 강의 평가</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	강의 목록 <br>
	<%
	ArrayList<LectureVO> lectures = new ArrayList<>();
	lectures.add(new LectureVO(1, "테스트1", "테스트교수1", 5));
	lectures.add(new LectureVO(2, "테스트2", "테스트교수2", 7));
	lectures.add(new LectureVO(3, "테스트3", "테스트교수3", 10));
	%>
	<tags:lecture lecture="${lectures.get(0)}" lid="${lectures.get(0).getId()}"/>
</body>
</html>