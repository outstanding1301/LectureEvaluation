package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EvaluationDAO;
import dao.LectureDAO;
import dao.PostDAO;
import vo.EvaluationVO;
import vo.LectureVO;
import vo.PostVO;
import vo.UserVO;

@WebServlet("/post")
public class PostServlet extends HttpServlet {       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String _id = request.getParameter("postid");
		String category = request.getParameter("category");

		if (category == null) {
			request.setAttribute("message", "올바르지 않은 접근입니다. (카테고리 미선택)");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		
		if(_id == null) {
			response.sendRedirect("board?category="+category);
		}
		else {
			int id = Integer.parseInt(_id);
			PostDAO dao = new PostDAO();
			PostVO vo = dao.findPost(id, category);
			request.setAttribute("post", vo);
			UserVO user = (UserVO) request.getSession().getAttribute("user");
			
			if (user != null && user.getId().equals(vo.getUserId())) {
				request.setAttribute("isAuthor", true);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("post.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _id = request.getParameter("postid");
		String category = request.getParameter("category");
		if(_id == null) {
			response.sendRedirect("board?category="+category);
		}
		else {
			int id = Integer.parseInt(_id);
			PostDAO dao = new PostDAO();
			PostVO vo = dao.findPost(id, category);
			request.setAttribute("post", vo);
			UserVO user = (UserVO) request.getSession().getAttribute("user");

			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			
			if (user != null && user.getId().equals(vo.getUserId())) {
				dao.removePost(vo);
				out.println("<script>alert('글을 삭제했습니다.'); location.href='"+request.getContextPath()+"/board?category="+category+"';</script>");
				out.close();
				return;
			}

			out.println("<script>alert('본인이 작성한 글만 지울 수 있습니다.'); location.href='"+request.getContextPath()+"/post?category="+category+"&postid="+id+"';</script>");
			out.close();
		}
	}
}
