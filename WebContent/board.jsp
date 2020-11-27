<%@page import="vo.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 게시판</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<% 
		String category = request.getParameter("category"); 
		String category_kr = category;
		if (category.equals("free")) category_kr = "자유게시판";
		else if (category.equals("notice")) category_kr = "공지사항";
		
		System.out.println(request.getAttribute("posts"));
	%>
	<jsp:useBean id="now" class="java.util.Date"/>
	<div class="container">
		<h2><%=category_kr %></h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 50%">제목</th>
					<th style="width: 30%">작성자</th>
					<th style="width: 20%">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${ posts }">
					<tr>
						<td>${post.getId()}</td>
						<td><a href="post?category=<%=category %>&postid=${post.getId()}">${post.getTitle()}</a></td>
						<td>${post.getUsername()}</td>
						<td>
						<c:choose>
							<c:when test="${post.getPostedDate().getYear() == now.getYear() && post.getPostedDate().getMonth() == now.getMonth() && post.getPostedDate().getDate() == now.getDate()}">
								<fmt:formatDate value="${post.getPostedDate()}" pattern="HH:mm"/>
							</c:when>
							<c:when test="${post.getPostedDate().getYear() != now.getYear()}">
								<fmt:formatDate value="${post.getPostedDate()}" pattern="yy/MM/dd"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${post.getPostedDate()}" pattern="MM/dd"/>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr/>
		<a style="float: right;" class="btn btn-outline-primary" href="posting?category=<%=category %>">글쓰기</a>
	</div>
</body>
</html>