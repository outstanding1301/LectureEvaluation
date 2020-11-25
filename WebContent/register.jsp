<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 회원 가입</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
	<div class="register__container">
		<div class="register__form_container">
			<h1>회원가입</h1>
			<form name="regform" action="RegisterServlet" method="post">
				<div class="form-row">
				  <div class="form-group col-9">
				    <label for="regfrom_id">ID</label>
				    <div>
				    <input name="id" type="text" class="form-control" id="regfrom_id" placeholder="ID...">
				    </div>
				  </div>
				  <div class="form-group col">
				    <label for="regform_confirm_id">　</label>
			  		<input type="button" class="btn btn-primary mb-2 form-control" id="regform_confirm_id" value="중복확인">
			  	  </div>
			  	</div>
			  	
			  <div class="form-group">
			    <label for="regfrom_username">이름</label>
			    <input name="username" type="text" class="form-control" id="regfrom_username" placeholder="이름...">
			  </div>
			  
			  <div class="form-row">
				  <div class="form-group col">
				    <label for="regfrom_pw">비밀번호</label>
				    <input name="password" type="text" class="form-control" id="regfrom_pw" placeholder="비밀번호...">
				  </div>
				  <div class="form-group col">
				    <label for="regfrom_pw_confirm">비밀번호 확인</label>
				    <input type="text" class="form-control" id="regfrom_pw_confirm" placeholder="비밀번호 확인...">
				  </div>
			  </div>
			  <div class="form-group">
			    <label for="regfrom_sid">학번</label>
			    <input name="student_id" type="text" class="form-control" id="regfrom_sid" placeholder="학번...">
			  </div>
			  <div class="form-group">
			    <label for="regfrom_major">학과/전공</label>
			    <select name="major" class="form-control" id="exampleFormControlSelect1">
			      <option value="0">학과/전공 선택...</option>
			      <option value="1">컴퓨터공학과</option>
			      <option value="2">에너지전기공학과</option>
			    </select>
			  </div>
			  <div class="form-group">
			    <label for="regfrom_email">E-mail</label>
			    <input name="email" type="text" class="form-control" id="regfrom_email" placeholder="example@kpu.ac.kr">
			  </div>
			  <div class="form-group">
			    <label for="regfrom_phone">전화번호</label>
			    <input name="phone" type="text" class="form-control" id="regfrom_phone" placeholder="010-0000-0000">
			  </div>
			  <button type="submit" class="btn btn-primary">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>