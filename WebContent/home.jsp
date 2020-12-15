<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<%
	if(request.getAttribute("lectures") == null) response.sendRedirect(request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:useBean id="now" class="java.util.Date"/>
	<div class="container">
		<div class="row">
			<div class="col-sm">
				<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center active">
					<a href="lecture" class="text-white"><strong>강의 랭킹 Top 5</strong></a>
				</li>
				<c:forEach var="lecture" items="${lectures}">
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<a class="text-secondary" href="lecture?lec_id=${lecture.getId()}">${lecture.getName()} <span class="text-primary ml-2">${lecture.getProfessor()}</span> <span class="text-danger ml-2">[${lecture.getEvalCount()}]</span></a>
						<span>
						<tags:star value="${lecture.getRating()}"/>
						<span class="text-secondary ml-1">(<fmt:formatNumber type="number" pattern = "0.00" value="${ lecture.getRating() }"/>)</span>
						</span>
					</li>
				</c:forEach>
				</ul>
		    </div>
		</div>
		<div class="row mt-3">
			<div class="col-sm">
				<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center active">
					<a href="board?category=notice" class="text-white"><strong>공지사항</strong></a>
				</li>
				<c:forEach var="post" items="${notices}">
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<a class="text-secondary" href="post?category=notice&postid=${post.getId()}"><span class="text-primary mr-3">${post.getId()}</span>${post.getTitle()}</a>
						<span class="text-secondary">
						<span class="text-info mr-2">${post.getUsername()}</span>
						<c:choose>
							<c:when test="${post.getPostedDate().getYear() == now.getYear() && post.getPostedDate().getMonth() == now.getMonth() && post.getPostedDate().getDate() == now.getDate()}">
								<fmt:formatDate value="${post.getPostedDate()}" pattern="HH:mm"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${post.getPostedDate()}" pattern="MM/dd"/>
							</c:otherwise>
						</c:choose>
						</span>
					</li>
				</c:forEach>
				
				</ul>
		    </div>
			<div class="col-sm">
				<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center active">
					<a href="board?category=free" class="text-white"><strong>자유게시판</strong></a>
				</li>
				<c:forEach var="post" items="${frees}">
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<a class="text-secondary" href="post?category=free&postid=${post.getId()}"><span class="text-primary mr-3">${post.getId()}</span>${post.getTitle()}</a>
						<span class="text-secondary">
						<span class="text-info mr-2">${post.getUsername()}</span>
						<c:choose>
							<c:when test="${post.getPostedDate().getYear() == now.getYear() && post.getPostedDate().getMonth() == now.getMonth() && post.getPostedDate().getDate() == now.getDate()}">
								<fmt:formatDate value="${post.getPostedDate()}" pattern="HH:mm"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${post.getPostedDate()}" pattern="MM/dd"/>
							</c:otherwise>
						</c:choose>
						</span>
					</li>
				</c:forEach>
				</ul>
		    </div>
		</div>
	</div>
</body>
</html>