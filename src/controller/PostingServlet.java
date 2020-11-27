package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PostDAO;
import dao.UserDAO;
import vo.PostVO;
import vo.UserVO;

@WebServlet("/posting")
public class PostingServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String category = request.getParameter("category");
		UserVO user = (UserVO) request.getSession().getAttribute("user");
		
		if (category == null) {
			request.setAttribute("message", "올바르지 않은 접근입니다. (카테고리 미선택)");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		else if (category.equals("notice")) {
			if (!user.isAdmin()) {
				request.setAttribute("message", "공지 작성은 관리자만 가능합니다.");
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("posting.jsp");
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		UserVO user = (UserVO) request.getSession().getAttribute("user");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if (category.equals("notice")) {
			if (!user.isAdmin()) {
				request.setAttribute("message", "공지 작성은 관리자만 가능합니다.");
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
			}
		}
		
		PostVO vo = new PostVO();
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setContent(content);
		
		PostDAO dao = new PostDAO();
		int postid = dao.addPost(category, title, content, user.getId());
		
		if (postid == -1) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('글 등록에 실패했습니다.'); location.href='"+request.getContextPath()+"/posting?category="+category+"';</script>");
			out.close();
			return;
		}
		
		response.sendRedirect("post?category="+category+"&postid="+postid);
	}
}
