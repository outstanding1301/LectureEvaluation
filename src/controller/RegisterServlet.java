package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

@WebServlet("/register")
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
		String email = request.getParameter("email");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		UserVO user = new UserVO();
		
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setStudentId(studentId);
		user.setEmail(email);
		user.setPhone(phone);
		
		UserDAO userDAO = new UserDAO();
		boolean success = userDAO.addUser(user);
		
		if (!success) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('회원가입에 실패했습니다.'); location.href='"+request.getContextPath()+"/register';</script>");
			out.close();
			return;
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		out.println("<script>alert('회원가입에 성공했습니다. 로그인 해주세요.'); location.href='"+request.getContextPath()+"';</script>");
		out.close();
	}
}
