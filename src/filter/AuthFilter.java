package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.UserVO;

@WebFilter(urlPatterns = {"/authtest.jsp", "/LogoutServlet", "/EvaluationServlet", "/posting","/ImageServlet"})
public class AuthFilter implements Filter {
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init AuthFilter");
	}
	
	public void destroy() {
		System.out.println("destroy AuthFilter");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		if (request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			UserVO user = (UserVO) session.getAttribute("user");
			if(user == null) {
				request.setAttribute("message", "로그인이 필요합니다!");
				request.getRequestDispatcher("error.jsp").forward(req, response);
//				chain.doFilter(req, response);
				return;
			}
			System.out.println(user.getId());
			System.out.println(user.getUsername());
			chain.doFilter(req, response);
			return;
		}
		request.setAttribute("message", "로그인이 필요합니다!");
		request.getRequestDispatcher("error.jsp").forward(request, response);
		chain.doFilter(request, response);
	}

}
