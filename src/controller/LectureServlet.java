package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LectureDAO;
import vo.LectureVO;

/**
 * Servlet implementation class LectureServlet
 */
@WebServlet("/lecture")
public class LectureServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String _id = request.getParameter("lec_id");
		if(_id == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("lecture_list.jsp");
			dispatcher.forward(request, response);
		}
		else {
			int id = Integer.parseInt(_id);
			LectureDAO dao = new LectureDAO();
			LectureVO lecture = dao.findLecture(id);
			request.setAttribute("lecture", lecture);
			RequestDispatcher dispatcher = request.getRequestDispatcher("lecture.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	}
}
