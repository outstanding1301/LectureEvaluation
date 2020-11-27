package controller;

import java.io.IOException;
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("post.jsp");
			dispatcher.forward(request, response);
		}
	}
}
