<%@tag body-content="empty" pageEncoding="UTF-8" %>
<%@attribute name="lecture" required="true" type="vo.LectureVO"%>
<%@attribute name="lid" type="java.lang.Integer"%>
<%
	System.out.println(lid);
%>
<%-- <div onclick="location.href=lecture.jsp?lec_id=<%=lecture.getId()%>" style="cursor:pointer;">
	<h2><%=lecture.getName() %></h2>
	<h3><%=lecture.getProfessor() %></h3>
	<h3><%=lecture.getRating() %></h3>
</div> --%>

<div onclick="location.href=lecture.jsp?lec_id=1" style="cursor:pointer;">
	<h2>아니 </h2>
	<h3>와이 안되농 </h3>
	<h3>c8</h3>
</div>