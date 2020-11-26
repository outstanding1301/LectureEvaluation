<%@tag body-content="empty" pageEncoding="UTF-8" %>
<%@attribute name="value" required="true" type="java.lang.Integer"%>

<%
for (int i=0;i<value;i++) {
	%>
		<span class="fa fa-star star_checked"></span>
	<%
}
for (int i=0;i<5-value;i++) {
	%>
		<span class="fa fa-star"></span>
	<%
}
%>