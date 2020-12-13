<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<meta charset="UTF-8">
<title>강의 평가 사이트 - 회원 가입</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="value" value="test"/>
	</jsp:include>
<div class="container">
	<div class="register__container">
		<div class="register__form_container">
			<h1>회원가입</h1>
			<form name="regform" action="register" method="post">
				<div class="form-group">
				    <label for="regfrom_id">ID</label>
				    <input name="id" type="text" maxlength="15" class="form-control" id="regfrom_id" placeholder="ID...">
			  	</div>
			  	
			  <div class="form-group">
			    <label for="regfrom_username">이름</label>
			    <input name="username" type="text" maxlength="15" class="form-control" id="regfrom_username" placeholder="이름...">
			  </div>
			  
			  <div class="form-row">
				  <div class="form-group col">
				    <label for="regfrom_pw">비밀번호</label>
				    <input name="password" type="password" class="form-control" id="regfrom_pw" placeholder="비밀번호...">
				  </div>
				  <div class="form-group col">
				    <label for="regfrom_pw_confirm">비밀번호 확인</label>
				    <input name="password_confirm" type="password" class="form-control" id="regfrom_pw_confirm" placeholder="비밀번호 확인...">
				  </div>
			  </div>
			  <div class="form-group">
			    <label for="regfrom_sid">학번</label>
			    <input name="student_id" type="text" class="form-control" id="regfrom_sid" placeholder="학번...">
			  </div>
			  <div class="form-group">
			    <label for="regfrom_email">E-mail</label>
			    <input name="email" type="email" class="form-control" id="regfrom_email" placeholder="example@kpu.ac.kr">
			  </div>
			  <div class="form-row">
				<div class="form-group col">
			    	<label for="regform_phone1">휴대전화번호</label>
				    <select name="phone1" id="regform_phone1" class="form-control">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				    </select>
			    </div>
				<div class="form-group col">
			    	<label for="regform_phone2">　</label>
			    	<input name="phone2" id="regform_phone2" maxlength="4" size="4" type="text" class="form-control" id="regfrom_phone" placeholder="0000">
			    </div>
				<div class="form-group col">
			    	<label for="regform_phone3">　</label>
			    	<input name="phone3" id="regform_phone3" maxlength="4" size="4"  type="text" class="form-control" id="regfrom_phone" placeholder="0000">
			    </div>
			  </div>
			  <button type="button" class="btn btn-primary" onclick="onSubmitRegform()" style="margin-top: 30px; width: 100%;">회원가입</button>
			</form>
		</div>
	</div>
</div>
	<script>
		function onSubmitRegform() {
			var form = document.regform;
			
			var id = form.id;
			var name = form.username;
			var passwd = form.password;
			var passwd_confirm = form.password_confirm;
			var student_id = form.student_id;
			var email = form.email;
			var phone1 = form.phone1;
			var phone2 = form.phone2;
			var phone3 = form.phone3;
			var phone = phone1.value + "-" + phone2.value + "-" + phone3.value;
			console.log(phone);
			
			var regExpId = /^[a-z0-9]*$/;
			var regExpName = /^[가-힣]*$/;
			var regExpPasswd = /^[0-9a-zA-Z]*$/;
			var regExpSid = /^[0-9]*$/;
			var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			var regExpEmail = /^[0-9a-zA-z]([-_\.]?[0-9a-zA-z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-z])*\.[a-zA-Z]{2,3}$/i;
			
			if (!regExpId.test(id.value) || id.value.length < 4) {
				alert("아이디는 4자 이상의 알파벳 소문자와 숫자로만 입력해주세요.");
				id.select();
				return;
			}
			
			if (!regExpName.test(name.value) || name.value.length < 1) {
				alert("이름은 한글만 입력해주세요.");
				name.select();
				return;
			}
			
			if (!regExpPasswd.test(passwd.value) || passwd.value.length < 6) {
				alert("비밀번호는 6자 이상의 영어/숫자만 입력해주세요.");
				passwd.select();
				return;
			}
			
			if (passwd.value != passwd_confirm.value) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				passwd_confirm.select();
				return;
			}
			
			if (!regExpSid.test(student_id.value) || student_id.value.length != 10) {
				alert("학번은 10자리 숫자만 입력해주세요.");
				student_id.select();
				return;
			}
			
			if (!regExpEmail.test(email.value) || email.value.length < 3) {
				alert("이메일 형식을 확인해주세요.");
				email.select();
				return;
			}
			if (!regExpPhone.test(phone)) {
				alert("휴대전화번호 형식을 확인해주세요.");
				phone2.select();
				return;
			}
			
			passwd.value = crypto(passwd.value);
			form.submit();
		}
	</script>
</body>
</html>