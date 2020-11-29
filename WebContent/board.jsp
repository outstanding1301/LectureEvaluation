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
	%>
	<jsp:useBean id="now" class="java.util.Date"/>
	<div class="container">
		<h2><%=category_kr %></h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 15%">번호</th>
					<th style="width: 55%">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">등록일</th>
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
		<div class="board__search_bottom">
			<form action="board" name="sform" method="get" class="form-inline my-2 my-lg-0">
				<input name="category" type="hidden" value="<%=category%>">
				<select name="type" class="form-control">
			      <option value="title">제목</option>
			      <option value="author">작성자</option>
			    </select>	
		      <input name="filter" class="form-control mr-sm-2" type="search" placeholder="검색..." aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		    </form>
			<a style="float: right;" class="btn btn-outline-primary" href="posting?category=<%=category %>">글쓰기</a>
		</div>
	</div>
</body>
</html>