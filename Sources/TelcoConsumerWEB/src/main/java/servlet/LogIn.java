package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.LogInManager;
import manager.SessionManager;
import util.AddableHttpRequest;

/**
 * Servlet implementation class LogIn
 */
@WebServlet("/loginUser.do")
public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/LogInManager")
	private LogInManager loginBean;
	@EJB(name = "manager/SessionManager")
	private SessionManager sessionBean;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@PostConstruct
	public void init() {
		loginBean = new LogInManager();
		sessionBean = new SessionManager();
	}

	public LogIn() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			if (username.compareTo("") == 0 || password.compareTo("") == 0) {
				throw new IllegalArgumentException();
			}
			if(!loginBean.validateUser(username, password)) {
				throw new IllegalArgumentException();
			}
			long sessionID = sessionBean.getSessionID(username);
			Cookie AccessSession = new Cookie("AccessSession", Long.toString(sessionID));
			response.addCookie(AccessSession);
			RequestDispatcher view1 = request.getRequestDispatcher("index.html");
			view1.forward(request, response);
		} catch (Exception e) {
			AddableHttpRequest req = new AddableHttpRequest(request);
			req.addParameter("dangerMessage", "<strong>Wrong username or password</strong>");
			RequestDispatcher view1 = req.getRequestDispatcher("Homepage.do");
			view1.forward(req, response);
		}
	}
}
