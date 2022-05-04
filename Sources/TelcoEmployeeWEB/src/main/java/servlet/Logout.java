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

import manager.SessionManager;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		SessionManager = new SessionManager();
	}

	public Logout() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			SessionManager.deleteSessionID(request.getCookies());
			Cookie AccessSession = new Cookie("AccessSession", null);
			response.addCookie(AccessSession);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
