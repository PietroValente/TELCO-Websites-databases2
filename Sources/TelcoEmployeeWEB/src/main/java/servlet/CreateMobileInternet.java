package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.*;
import util.AddableHttpRequest;

/**
 * Servlet implementation class CreateMobileInternet
 */
@WebServlet("/CreateMobileInternet.do")
public class CreateMobileInternet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/ServiceManager")
	ServiceManager manager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		manager = new ServiceManager();
		SessionManager = new SessionManager();
	}

	public CreateMobileInternet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			String name = request.getParameter("MobileInternetName");
			String giga = request.getParameter("MobileInternetGIGA");
			String fee = request.getParameter("MobileInternetGIGAFee");
			if (request.getParameter("MobileInternetGIGAUnlimited") != null) {
				giga = "-1";
				fee = "0";
			}
			AddableHttpRequest req = new AddableHttpRequest(request);
			try {
				if (name.compareTo("") == 0 || giga.compareTo("") == 0 || fee.compareTo("") == 0) {
					throw new IllegalArgumentException();
				}
				manager.addMobileInternet(name, Integer.parseInt(giga), Float.parseFloat(fee));
				req.addParameter("succcessMessage", "<strong>Service added successfully!</strong>");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			} catch (Exception e) {
				req.addParameter("dangerMessage",
						"<strong>Service add failed</strong><br> Check that you have entered all the data and remember that two services cannot have the same name!");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			}
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}
}