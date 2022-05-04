package servlet;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.OptionalProductManager;
import manager.ServiceManager;
import manager.SessionManager;
import model.Optionalproduct;
import model.Service;
import util.AddableHttpRequest;

/**
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage.do")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/OptionalProductManager")
	OptionalProductManager OptionalProductManager;

	@EJB(name = "manager/ServiceManager")
	ServiceManager ServiceManager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		OptionalProductManager = new OptionalProductManager();
		ServiceManager = new ServiceManager();
		SessionManager = new SessionManager();
	}

	public Homepage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			List<Optionalproduct> allOptionalProduct = OptionalProductManager.allOptionalProduct();
			List<Service> allMobilePhoneService = ServiceManager.allMobilePhoneService();
			List<Service> allMobileInternetService = ServiceManager.allMobileInternetService();
			List<Service> allFixedInternetService = ServiceManager.allFixedInternetService();

			AddableHttpRequest req = new AddableHttpRequest(request);

			req.addParameter("allOptionalProductSize", Integer.toString(allOptionalProduct.size()));
			for (int i = 0; i < allOptionalProduct.size(); i++) {
				req.addParameter("OptionalProductID" + i, Long.toString(allOptionalProduct.get(i).getId()));
				req.addParameter("OptionalProductName" + i, allOptionalProduct.get(i).getName());
			}

			req.addParameter("allMobilePhoneServiceSize", Integer.toString(allMobilePhoneService.size()));
			for (int i = 0; i < allMobilePhoneService.size(); i++) {
				req.addParameter("MobilePhoneServiceID" + i, Long.toString(allMobilePhoneService.get(i).getId()));
				req.addParameter("MobilePhoneServiceName" + i, allMobilePhoneService.get(i).getName());
			}

			req.addParameter("allMobileInternetServiceSize", Integer.toString(allMobileInternetService.size()));
			for (int i = 0; i < allMobileInternetService.size(); i++) {
				req.addParameter("MobileInternetServiceID" + i, Long.toString(allMobileInternetService.get(i).getId()));
				req.addParameter("MobileInternetServiceName" + i, allMobileInternetService.get(i).getName());
			}

			req.addParameter("allFixedInternetServiceSize", Integer.toString(allFixedInternetService.size()));
			for (int i = 0; i < allFixedInternetService.size(); i++) {
				req.addParameter("FixedInternetServiceID" + i, Long.toString(allFixedInternetService.get(i).getId()));
				req.addParameter("FixedInternetServiceName" + i, allFixedInternetService.get(i).getName());
			}
			req.addParameter("username", username);
			RequestDispatcher view = req.getRequestDispatcher("pages/Homepage.jsp");
			view.forward(req, response);
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
