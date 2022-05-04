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

import manager.PackageManager;
import manager.SessionManager;
import model.Pack;
import model.Validityperiod;
import util.AddableHttpRequest;

/**
 * Servlet implementation class Buy_Service
 */
@WebServlet("/BuyService.do")
public class BuyService extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/PackageManager")
	PackageManager manager;

	@EJB(name = "manager/SessionManager")
	SessionManager session;

	@PostConstruct
	public void init() {
		manager = new PackageManager();
		session = new SessionManager();
	}

	public BuyService() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null) {
			req.addParameter("username", username);
		} else {
			req.addParameter("username", "MyTELCO");
		}
		List<Pack> allPackage = manager.allPackage();
		req.addParameter("allPackageSize", Integer.toString(allPackage.size()));
		for (int i = 0; i < allPackage.size(); i++) {
			List<Validityperiod> prices = allPackage.get(i).getValidityperiods();
			float bestPrice = prices.get(0).getFee();
			if (bestPrice > prices.get(1).getFee()) {
				bestPrice = prices.get(1).getFee();
			}
			if (bestPrice > prices.get(2).getFee()) {
				bestPrice = prices.get(2).getFee();
			}
			req.addParameter("PackageID" + i, Long.toString(allPackage.get(i).getId()));
			req.addParameter("PackageName" + i, allPackage.get(i).getName());
			req.addParameter("PackageBestPrice" + i, Float.toString(bestPrice));
			if (allPackage.get(i).getFeature1() != null) {
				req.addParameter("Feature1" + i, allPackage.get(i).getFeature1());
			}
			if (allPackage.get(i).getFeature2() != null) {
				req.addParameter("Feature2" + i, allPackage.get(i).getFeature2());
			}
			if (allPackage.get(i).getFeature3() != null) {
				req.addParameter("Feature3" + i, allPackage.get(i).getFeature3());
			}
		}
		RequestDispatcher view = req.getRequestDispatcher("pages/BuyService.jsp");
		view.forward(req, response);

	}

}
