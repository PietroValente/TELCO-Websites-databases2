package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.*;
import model.Optionalproduct;
import model.Service;
import util.AddableHttpRequest;

/**
 * Servlet implementation class CreatePackage
 */
@WebServlet("/CreatePackage.do")
public class CreatePackage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/PackageManager")
	PackageManager PackageManager;

	@EJB(name = "manager/ServiceManager")
	ServiceManager ServiceManager;

	@EJB(name = "manager/OptionalProductManager")
	OptionalProductManager OptionalProductManager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		PackageManager = new PackageManager();
		ServiceManager = new ServiceManager();
		OptionalProductManager = new OptionalProductManager();
		SessionManager = new SessionManager();
	}

	public CreatePackage() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			String name = request.getParameter("PackageName");
			String fee12 = request.getParameter("PackageFee12");
			String fee24 = request.getParameter("PackageFee24");
			String fee36 = request.getParameter("PackageFee36");
			String feature1 = request.getParameter("PackageFeature1");
			String feature2 = request.getParameter("PackageFeature2");
			String feature3 = request.getParameter("PackageFeature3");

			if (feature1.compareTo("") == 0) {
				feature1 = null;
			}
			if (feature2.compareTo("") == 0) {
				feature2 = null;
			}
			if (feature3.compareTo("") == 0) {
				feature3 = null;
			}

			Hashtable<Service, Integer> service = new Hashtable<Service, Integer>();
			List<Service> allService = ServiceManager.allService();
			for (int i = 0; i < allService.size(); i++) {
				if ((request.getParameter(allService.get(i).getName()).compareTo("") != 0)
						&& (request.getParameter(allService.get(i).getName()).compareTo("0") != 0)) {
					service.put(allService.get(i), Integer.parseInt(request.getParameter(allService.get(i).getName())));
				}
			}

			List<Optionalproduct> allOptionalProduct = OptionalProductManager.allOptionalProduct();
			List<Optionalproduct> OptionalProduct = new ArrayList<Optionalproduct>();
			for (int i = 0; i < allOptionalProduct.size(); i++) {
				if (request.getParameter(allOptionalProduct.get(i).getName()) != null) {
					OptionalProduct.add(allOptionalProduct.get(i));
				}
			}

			AddableHttpRequest req = new AddableHttpRequest(request);
			try {
				if (name.compareTo("") == 0 || fee12.compareTo("") == 0 || fee24.compareTo("") == 0
						|| fee36.compareTo("") == 0) {
					throw new IllegalArgumentException();
				}
				if(service.size() == 0) {
					throw new IllegalArgumentException();
				}
				PackageManager.addPackage(name, Float.parseFloat(fee12), Float.parseFloat(fee24),
						Float.parseFloat(fee36), feature1, feature2, feature3, service, OptionalProduct);
				req.addParameter("succcessMessage", "<strong>Package added successfully!</strong>");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			} catch (Exception e) {
				e.printStackTrace();
				req.addParameter("dangerMessage",
						"<strong>Package add failed</strong><br> Check that you have entered all the data and remember that two services cannot have the same name!");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			}
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}
}