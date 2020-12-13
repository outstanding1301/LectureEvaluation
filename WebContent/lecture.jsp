<%@page import="java.util.ArrayList"%>
<%@page import="dao.EvaluationDAO"%>
<%@page import="vo.EvaluationVO"%>
<%@page import="vo.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 강의 평가</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
<div class="container">
<h3>강의평가</h3>
<div class="card">
  <div class="card-body">
    <h5 class="card-title">${ lecture.getName() }</h5>
    <h6 class="card-subtitle mb-2 text-muted">${ lecture.getProfessor() }</h6>
    <p class="card-text">평균 평점 : 
	    <tags:star value="${ lecture.getRating() }"/> 
	    <span style="color: gray">
	    	(<fmt:formatNumber type="number" pattern = "0.00" value="${ lecture.getRating() }"/>)
	    </span>
    </p>
    <p class="card-text">등록된 평가 수 : ${ lecture.getEvalCount() }</p>
  </div>
</div>
	
<div>
	<form name="evalform" action="EvaluationServlet" method="post">
	  <div class="eval_form">
	    <div class="eval_form__box_star">
	      <tags:starPicker/>
	      <input type="hidden" name="rating">
	      <input type="hidden" name="lec_id" value="${ lecture.getId() }">
	    </div>
	    <div class="eval_form__box_input">
	      <input type="text" name="comment" maxlength="30" class="form-control eval_form__input" id="inlineFormInputName" placeholder="강의에 대한 평가를 자유롭게 입력해주세요.">
	    </div>
	    <div class="eval_form__box">
	      <button type="button" class="btn btn-primary" onclick="onEvaluationSubmit()">등록</button>
	    </div>
	  </div>
	</form>
	
	<c:forEach var="evaluation" items="${ evaluations }">
		<tags:evaluation evaluation="${ evaluation }"/>
	</c:forEach>
</div>
</div>
	
</body>
<script>
	function onEvaluationSubmit() {
		var form = document.evalform;
		var rating = form.rating;
		var comment = form.comment;

		if (star_rating < 1) {
			alert("평점을 선택해주세요!")
			return;
		}
		
		if (comment.value.length < 1) {
			alert("평가를 입력해주세요!")
			return;
		}
		
		rating.value = star_rating;
		form.submit();
	}
</script>
</html>