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

import manager.LogInManager;
import manager.PackageManager;
import manager.SessionManager;
import manager.SalesReportManager;
import model.Optionalproduct;
import model.Pack;
import model.Purchase;
import model.Purchasesalesreport;
import model.User;
import model.Usersalesreport;
import model.Validityperiod;
import util.AddableHttpRequest;

/**
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage.do")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/PackageManager")
	PackageManager manager;
	@EJB(name = "manager/SessionManager")
	SessionManager session;
	@EJB(name = "manager/LogInManager")
	LogInManager login;
	@EJB(name = "manager/SalesReportManager")
	SalesReportManager SalesReportManager;

	@PostConstruct
	public void init() {
		manager = new PackageManager();
		session = new SessionManager();
		login = new LogInManager();
		SalesReportManager = new SalesReportManager();
	}

	public Homepage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null) {
			req.addParameter("username", username);
			List<Usersalesreport> users = SalesReportManager.allUsersalesreport();
			for(int i=0; i<users.size(); i++) {
				if(users.get(i).getUser().compareTo(username) == 0) {
					if (users.get(i).getSolvent()) {
						req.addParameter("solvent", "true");
					} else {
						req.addParameter("solvent", "false");
					}
					break;
				}
			}
			User u = login.getUser(username);
			List<Purchase> p = u.getPurchases();
			List<Purchasesalesreport> psr = u.getPurchasesalesreports();
			int size = 0;
			for (int i = 0; i < psr.size(); i++) {
				Purchase temp = null;
				if (psr.get(i).getRejected() != 0) {
					for (int j = 0; j < p.size(); j++) {
						if(psr.get(i).getPurchase() == p.get(j).getId()) {
							temp = p.get(j);
						}
					}
					req.addParameter("PurchaseID" + size, Long.toString(temp.getId()));
					req.addParameter("PackageRID" + size, Long.toString(temp.getPackBean().getId()));
					req.addParameter("PackageRName" + size, temp.getPackBean().getName());
					req.addParameter("PackageRTimestamp" + size, temp.getTimestamp().toString());
					req.addParameter("PackageRSP" + size, temp.getStartperiod().toString());
					req.addParameter("PackageREP" + size, temp.getEndperiod().toString());
					req.addParameter("PackageRefusedTimes" + size, Integer.toString(psr.get(i).getRejected()));
					req.addParameter("PackageRPrice" + size, Float.toString(temp.getPrice()));
					List<Optionalproduct> op = p.get(i).getOptionalproducts();
					req.addParameter("OPSize"+size, Integer.toString(op.size()));
					for (int j = 0; j < op.size(); j++) {
						req.addParameter(size+"OP"+j, op.get(j).getName());
					}
					size++;
				}
			}
			req.addParameter("allRPackageSize", Integer.toString(size));
		} else {
			req.addParameter("allRPackageSize", Integer.toString(0));
			req.addParameter("username", "MyTELCO");
			req.addParameter("solvent", "true");
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
		RequestDispatcher view = req.getRequestDispatcher("pages/Homepage.jsp");
		view.forward(req, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
