package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import vo.PostVO;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category"); 

		if (category == null) {
			request.setAttribute("message", "올바르지 않은 접근입니다. (카테고리 미선택)");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		String type = request.getParameter("type");
		String filter = request.getParameter("filter");
		
		PostDAO dao = new PostDAO();
		ArrayList<PostVO> posts = null;

		System.out.println(type);
		System.out.println(filter);
		
		if (type != null) {
			if (type.equals("title")) {
				posts = dao.selectByCategoryTitle(category, filter);
			}
			else if (type.equals("author")) {
				posts = dao.selectByCategoryAuthor(category, filter);
			}
			else {
				posts = dao.selectByCategory(category);
			}
		}
		else {
			posts = dao.selectByCategory(category);
		}
		
		request.setAttribute("posts", posts);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("board.jsp");
		dispatcher.forward(request, response);
	}

}