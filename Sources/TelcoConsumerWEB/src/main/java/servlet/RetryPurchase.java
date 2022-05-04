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

import manager.PurchaseManager;
import manager.SessionManager;
import util.AddableHttpRequest;

/**
 * Servlet implementation class RetryPurchase
 */
@WebServlet("/RetryPurchase.do")
public class RetryPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(name = "manager/SessionManager")
	private SessionManager session;

	@EJB(name = "manager/PurchaseManager")
	private PurchaseManager purchase;

	@PostConstruct
	public void init() {
		session = new SessionManager();
		purchase = new PurchaseManager();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RetryPurchase() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null) {
			req.addParameter("username", username);
		}
		boolean status;
		if ("true".compareTo(request.getParameter("status")) == 0) {
			status = true;
			req.addParameter("succcessMessage", "Payment done");
		} else {
			status = false;
			req.addParameter("dangerMessage", "Payment unsuccessful");
		}
		long id = Long.parseLong(request.getParameter("PurchaseID"));
		purchase.retryPurchase(id, status);
		RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
		view.forward(req, response);
	}

}
