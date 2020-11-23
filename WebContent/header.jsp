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
<nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="home.jsp">
      <img src="resource/kpu.png" width="112" height="28">
    </a>

    <a id="navbarBurger" role="button" class="navbar-burger burger" onclick="toggleBurger()" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarIndex" class="navbar-menu">
    <div class="navbar-start">
      <a class="navbar-item" href="home.jsp">
        Home
      </a>

      <a class="navbar-item" href="lecture_list.jsp">
        강의평가
      </a>

      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          게시판
        </a>

        <div class="navbar-dropdown">
          <a class="navbar-item" href="board.jsp?category=notice">
			공지사항 
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item" href="board.jsp?category=free">
            자유게시판
          </a>
        </div>
      </div>
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
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
            	<input class="button is-primary header__button" type="button" onclick="register()" value="회원가입">
            </form>
            <!-- <form class="header__form" method="post" action="RegisterServlet">
            </form> -->
        <% } %>
        <!-- 
        <div class="buttons">
          <a class="button is-primary">
            <strong>Sign up</strong>
          </a>
          <a class="button is-light">
            Log in
          </a>
        </div> 
        -->
      </div>
    </div>
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