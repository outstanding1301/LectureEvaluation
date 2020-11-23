package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.UserVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		UserVO user = new UserVO();
		user.setId(id);
		user.setUsername(username);
		user.setTest(new Date().toLocaleString());
		session.setAttribute("user", user);
		response.sendRedirect("home.jsp");
	}
}
