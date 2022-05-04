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
import manager.SalesReportManager;
import manager.SessionManager;
import model.Optionalproduct;
import model.Purchase;
import model.Purchasesalesreport;
import model.User;
import util.AddableHttpRequest;

/**
 * Servlet implementation class PurchasedOrders
 */
@WebServlet("/PurchasedOrders.do")
public class PurchasedOrders extends HttpServlet {
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

	public PurchasedOrders() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null) {
			req.addParameter("username", username);
			User u = login.getUser(username);
			List<Purchase> p = u.getPurchases();
			List<Purchasesalesreport> psr = u.getPurchasesalesreports();
			int size = 0;
			for (int i = 0; i < psr.size(); i++) {
				Purchase temp = null;
				if (psr.get(i).getRejected() == 0) {
					for (int j = 0; j < p.size(); j++) {
						if(psr.get(i).getPurchase() == p.get(j).getId()) {
							temp = p.get(j);
						}
					}
					req.addParameter("PurchaseID" + size, Long.toString(temp.getId()));
					req.addParameter("PackagePName" + size, temp.getPackBean().getName());
					req.addParameter("PackagePTimestamp" + size, temp.getTimestamp().toString());
					req.addParameter("PackagePSP" + size, temp.getStartperiod().toString());
					req.addParameter("PackagePEP" + size, temp.getEndperiod().toString());
					req.addParameter("PackagePPrice" + size, Float.toString(temp.getPrice()));
					List<Optionalproduct> op = p.get(i).getOptionalproducts();
					req.addParameter("OPSize"+size, Integer.toString(op.size()));
					for (int j = 0; j < op.size(); j++) {
						req.addParameter(size+"OP"+j, op.get(j).getName());
					}
					size++;
				}
			}
			req.addParameter("allPPackageSize", Integer.toString(size));
		} else {
			req.addParameter("allPPackageSize", Integer.toString(0));
			req.addParameter("username", "MyTELCO");
			req.addParameter("solvent", "true");
			RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
			view.forward(req, response);
			return;
		}
		RequestDispatcher view = req.getRequestDispatcher("pages/PurchasedOrders.jsp");
		view.forward(req, response);
	}
}
