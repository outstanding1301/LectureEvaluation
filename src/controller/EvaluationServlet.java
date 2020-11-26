package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EvaluationDAO;
import vo.UserVO;

/**
 * Servlet implementation class EvaluationServlet
 */
@WebServlet("/EvaluationServlet")
public class EvaluationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rating = Integer.parseInt(request.getParameter("rating"));
		int lectureId = Integer.parseInt(request.getParameter("lec_id"));
		String comment = request.getParameter("comment");
		System.out.println("comment: "+comment+", rating: "+rating);
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO) session.getAttribute("user");
		
		EvaluationDAO dao = new EvaluationDAO();
		dao.addEvaluation(lectureId, rating, user.getId(), comment);
		
		// TODO : 중복 강의평가 금지
		
		response.sendRedirect("lecture?lec_id="+lectureId);
	}
}
