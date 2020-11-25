<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
UserVO user = (UserVO) session.getAttribute("user"); 
%>
<%-- <header class="header__header">
	<div class="header__category">
	    <a class="header__category_item" href="home.jsp">Home</a>
	    <a class="header__category_item" href="lecture_list.jsp">강의평가</a>
	    <a class="header__category_item" href="board.jsp?category=free">자유게시판</a>
	    <a class="header__category_item" href="board.jsp?category=notice">공지사항</a>
	</div>
    <div class="header__userInfo">
    	<% if (user != null) { %>
            <p class="header__userName">
                <span class="header__userName_username"><%=user.getUsername() %></span>
                <span class="header__userName_greeting">님 환영합니다.</span>
            </p>
            <form method="post" action="LogoutServlet">
            	<input class="button is-primary header__button" type="submit" value="로그아웃">
            </form>
        <% }
    	else { %>
            <form class="header__form" method="post" action="LoginServlet">
            	<input class="input header__input" type="text" name="id" placeholder="ID">
            	<input class="input header__input" type="text" name="username" placeholder="username">
            	<input class="button is-primary header__button" type="submit" value="로그인">
            </form>
            <form class="header__form" method="post" action="RegisterServlet">
            	<input class="button is-primary header__button" type="submit" value="회원가입">
            </form>
        <% } %>
    </div>
</header> --%>


<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home.jsp">
  <img src="resource/img/kpu.png" width="112" height="30" class="d-inline-block align-top" alt="logo" loading="lazy">KPU 강의평가</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="lecture_list.jsp">강의평가</a>
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
            <form class="form-inline my-2 my-lg-0" method="post" action="LoginServlet">
            	<input class="form-control mr-sm-2 header__input" type="text" name="id" placeholder="ID">
            	<input class="form-control mr-sm-2 header__input" type="password" name="password" placeholder="Password">
            	<input class="btn btn-outline-light my-2 my-sm-0 header__button" type="submit" value="로그인">
            	<input class="btn btn-outline-light my-2 my-sm-0 header__button" type="button" onclick="register()" value="회원가입">
            </form>
        <% } %>
  </div>
</nav>

<script>
	function toggleBurger() {
		var burger = document.getElementById("navbarBurger");
		var idx = document.getElementById("navbarIndex");
		burger.classList.toggle('is-active');
		idx.classList.toggle('is-active');
	}
	
	function register() {
		window.location.href = 'register.jsp';
	}
</script>