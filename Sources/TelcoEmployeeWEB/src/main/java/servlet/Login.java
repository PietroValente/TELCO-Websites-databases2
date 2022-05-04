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
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
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

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("pages/Login.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AddableHttpRequest req = new AddableHttpRequest(request);
		try {
			if (username.compareTo("") == 0 || password.compareTo("") == 0) {
				throw new IllegalArgumentException();
			}
			if (!loginBean.validateEmployee(username, password)) {
				throw new IllegalStateException();
			}
			long sessionID = sessionBean.getSessionID(username);
			Cookie AccessSession = new Cookie("AccessSession", Long.toString(sessionID));
			response.addCookie(AccessSession);
			RequestDispatcher view1 = req.getRequestDispatcher("index.jsp");
			view1.forward(req, response);
		} catch (Exception e) {
			req.addParameter("dangerMessage", "Wrong username or password");
			RequestDispatcher view = request.getRequestDispatcher("pages/Login.jsp");
			view.forward(req, response);
		}
	}

}
