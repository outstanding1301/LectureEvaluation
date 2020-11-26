<%@tag body-content="empty" pageEncoding="UTF-8" %>
<%@attribute name="lecture" required="true" type="vo.LectureVO"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<div class="card" style="width: 30rem;">
  <div class="card-body">
    <h5 class="card-title"><%=lecture.getName() %></h5>
    <h6 class="card-subtitle mb-2 text-muted"><%=lecture.getProfessor() %></h6>
    <p class="card-text">평균 평점 : <tags:star value="<%=(int) lecture.getRating() %>"/> <span style="color: gray">(<%=String.format("%.2f", lecture.getRating()) %>)</span></p>
    <p class="card-text">등록된 평가 수 : <%=lecture.getEvalCount() %></p>
    <a href="lecture?lec_id=<%=lecture.getId()%>" class="card-link">☞ 강의 평가 페이지 바로가기</a>
  </div>
</div>