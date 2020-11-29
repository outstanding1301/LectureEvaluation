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
			<c:if test="${isAuthor}">
				<button type="button" style="float: right;" class="btn btn-outline-danger mr-1" data-toggle="modal" data-target="#delModal">삭제</button>
			</c:if>
		</div>
		
		<div class="modal fade" id="delModal" tabindex="-1" aria-labelledby="delModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="delModalLabel">글 삭제</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        정말 삭제하시겠습니까?
		      </div>
		      <form action="post" method="post" class="modal-footer">
		      	<input type="hidden" name="postid" value="${post.getId()}">
		      	<input type="hidden" name="category" value="${post.getCategory()}">
		        <button type="submit" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>