<%@page import="vo.PostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 게시물</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<div class="container">
		<h2 style="margin-top: 30px;">${post.getTitle()}</h2>
		<h6 style="margin-bottom: 10px;">
			<span style="color: #777777">작성자 </span>
			<span style="color: #47b8e0">${ post.getUsername() }</span>
			<span style="float: right; color: #888888">
				<fmt:formatDate value="${post.getPostedDate()}" pattern="yyyy/MM/dd HH:mm:ss"/>
			</span>
		</h6>
		<hr/>
		<p style="margin-top: 10px; margin-bottom: 10px;">${ post.getContent() }</p>
		<hr/>
		<div>
			<a class="btn btn-outline-primary" href="board?category=${ post.getCategory() }">목록</a>
			<a style="float: right;" class="btn btn-outline-primary" href="posting?category=${ post.getCategory() }">글쓰기</a>
		</div>
	</div>
</body>
</html>