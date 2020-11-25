package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password"); // 암호화 필요
		String studentId = request.getParameter("student_id");
		int major = Integer.parseInt(request.getParameter("major")); // 예외처리 필요
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		UserVO user = new UserVO(id, username, password, studentId, major, email, phone);
		
		UserDAO userDAO = new UserDAO();
		userDAO.addUser(user);
		response.sendRedirect("/");
	}
}
