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
 * Servlet implementation class CreateOptionalProduct
 */
@WebServlet("/CreateOptionalProduct.do")
public class CreateOptionalProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/OptionalProductManager")
	OptionalProductManager manager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		manager = new OptionalProductManager();
		SessionManager = new SessionManager();
	}

	public CreateOptionalProduct() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			String name = request.getParameter("OptionalProductName");
			String fee = request.getParameter("OptionalProductFee");
			if (request.getParameter("OptionalProductGratis") != null) {
				fee = "0";
			}
			AddableHttpRequest req = new AddableHttpRequest(request);
			try {
				if (name.compareTo("") == 0 || fee.compareTo("") == 0) {
					throw new IllegalArgumentException();
				}
				manager.addOptionalProduct(name, Float.parseFloat(fee));
				req.addParameter("succcessMessage", "<strong>Optional product added successfully!</strong>");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			} catch (Exception e) {
				req.addParameter("dangerMessage",
						"<strong>Optional product add failed</strong><br> Check that you have entered all the data and remember that two services cannot have the same name!");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			}
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}
}