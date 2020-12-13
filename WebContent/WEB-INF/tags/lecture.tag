<%@tag body-content="empty" pageEncoding="UTF-8" %>
<%@attribute name="lecture" required="true" type="vo.LectureVO"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <a href="lecture?lec_id=${lecture.getId()}" class="card-link">☞ 강의 평가 페이지 바로가기</a>
  </div>
</div>

