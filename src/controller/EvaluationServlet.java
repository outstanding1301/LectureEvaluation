package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EvaluationDAO;
import vo.EvaluationVO;
import vo.UserVO;

@WebServlet("/EvaluationServlet")
public class EvaluationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("delete") != null) {
			int lectureId = Integer.parseInt(request.getParameter("lec_id"));
			HttpSession session = request.getSession();
			UserVO user = (UserVO) session.getAttribute("user");

			EvaluationDAO dao = new EvaluationDAO();
			EvaluationVO vo = dao.checkDuplicated(user.getId(), lectureId);
			
			if (vo != null) {
				dao.removeEvaluation(vo);
			}
			response.sendRedirect("lecture?lec_id="+lectureId);
			return;
		}
		
		
		int rating = Integer.parseInt(request.getParameter("rating"));
		int lectureId = Integer.parseInt(request.getParameter("lec_id"));
		String comment = request.getParameter("comment");
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO) session.getAttribute("user");
		
		EvaluationDAO dao = new EvaluationDAO();
		EvaluationVO vo = dao.checkDuplicated(user.getId(), lectureId);
		if (vo != null) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('이미 해당 강의의 강의평을 작성했습니다!'); location.href='"+"lecture?lec_id="+lectureId+"';</script>");
			out.close();
			return;
		}
		
		dao.addEvaluation(lectureId, rating, user.getId(), comment);
		response.sendRedirect("lecture?lec_id="+lectureId);
	}
}
