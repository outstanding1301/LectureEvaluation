<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
UserVO user = (UserVO) session.getAttribute("user"); 
%>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/LectureEvaluation">
  <img src="resource/img/kpu.png" width="112" height="30" class="d-inline-block align-top" alt="logo" loading="lazy">KPU 강의평가</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/LectureEvaluation">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="lecture">강의평가</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          게시판
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="board.jsp?category=notice">공지사항</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="board.jsp?category=free">자유게시판</a>
        </div>
      </li>
    </ul>
    
     <% if (user != null) { %>
     		<span class="navbar-text header__userName">
                <span class="header__userName_username"><%=user.getUsername() %></span>
                <span class="header__userName_greeting">님 환영합니다.</span>
            </span>
            <form method="post" action="LogoutServlet">
            	<input class="btn btn-outline-light my-2 my-sm-0 header__button" type="submit" value="로그아웃">
            </form>
        <% }
    	else { %>
            <form name="loginform" class="form-inline my-2 my-lg-0" method="post" action="LoginServlet">
            	<input class="form-control mr-sm-2 header__input" type="text" name="id" placeholder="ID">
            	<input class="form-control mr-sm-2 header__input" type="password" name="password" placeholder="Password">
            	<input class="btn btn-outline-light my-2 my-sm-0 header__button" type="button" onclick="login()" value="로그인">
            	<input class="btn btn-outline-light my-2 my-sm-0 header__button" type="button" onclick="register()" value="회원가입">
            </form>
        <% } %>
  </div>
<script>
	function login() {
		var form = document.loginform;
		
		var id = form.id;
		var pw = form.password;
		
		if (id.value.length == 0) {
			alert("아이디를 입력해주세요.");
			return id.select();
		}
		
		if (pw.value.length == 0) {
			alert("비밀번호를 입력해주세요.");
			return pw.select();
		}
		
		pw.value = crypto(pw.value);
		form.submit();
	}
	
	function register() {
		window.location.href = 'register';
	}
</script>
</nav>