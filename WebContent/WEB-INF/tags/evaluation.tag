<%@tag import="java.text.SimpleDateFormat"%>
<%@tag import="vo.UserVO"%>
<%@tag body-content="empty" pageEncoding="UTF-8" %>
<%@attribute name="evaluation" required="true" type="vo.EvaluationVO"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<style>
	.eval__component_container {
		margin: 0;
		padding: 0;
		padding-top: 9px;
		padding-bottom: 9px;
		margin-top: 1px;
		margin-bottom: 1px;
		background-color: #f7f7f7;
	}
	.eval__component_star {
		padding-left: 10px;
		padding-right: 10px;
	}
	.eval_component_comment {
	
	}
	.eval_component_right {
		float: right;
		margin-right: 10px;
	}
	
	.eval_component_date {
		color: gray;
		font-size: 10pt;
		font-weight: lighter;
	}
	
	.eval_component_delete {
		color: #ff6a6a;
		font-size: 10pt;
		font-weight: bold;
		padding: 10px;
		cursor: pointer;
	}
</style>
<%
	UserVO user = (UserVO) session.getAttribute("user");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<div class="eval__component_container">
	<span class="eval__component_star">
		<tags:star value="<%=evaluation.getRating() %>"/>
	</span>
	<span class="eval_component_comment">
		<%=evaluation.getComment() %>
	</span>
	<span class="eval_component_right">
		<%
		if (user != null && user.getId().equals(evaluation.getUserId())) {
		%>
		<span class="eval_component_delete">
			x
		</span>
		<%
		}
		%>
		<span class="eval_component_date">
			<%=sdf.format(evaluation.getDate()) %>
		</span>
	</span>
</div>
