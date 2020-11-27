package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.findUser(id);
		
		if (user == null) {
//			request.setAttribute("message", "존재하지 않는 ID입니다.");
//			request.getRequestDispatcher("error.jsp").forward(request, response);
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('존재하지 않는 ID입니다.'); location.href='"+request.getContextPath()+"';</script>");
			out.close();
			return;

		}
		else if (!user.getPassword().equals(password)) {
//			request.setAttribute("message", "비밀번호가 틀렸습니다.");
//			request.getRequestDispatcher("error.jsp").forward(request, response);
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('비밀번호가 틀렸습니다.'); location.href='"+request.getContextPath()+"';</script>");
			out.close();
			return;
		}

		session.setAttribute("user", user);
		response.sendRedirect("/LectureEvaluation");
	}
}
