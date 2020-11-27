package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LectureDAO;
import dao.PostDAO;
import vo.LectureVO;
import vo.PostVO;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LectureDAO ldao = new LectureDAO();
		PostDAO pdao = new PostDAO();
		ArrayList<PostVO> frees = pdao.selectByCategory("free", 10);
		ArrayList<PostVO> notices = pdao.selectByCategory("notice", 10);
		ArrayList<LectureVO> lectures = ldao.selectTop10();

		request.setAttribute("frees", frees);
		request.setAttribute("notices", notices);
		request.setAttribute("lectures", lectures);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

}
