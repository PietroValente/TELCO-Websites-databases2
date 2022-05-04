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
import manager.OptionalProductManager;
import manager.ViewDataManager;
import manager.PurchaseManager;
import model.Alert;
import model.Optionalproduct;
import model.Pack;
import model.Purchase;
import model.User;
import model.Validityperiod;
import util.AddableHttpRequest;

/**
 * Servlet implementation class SalesReport
 */
@WebServlet("/SalesReport.do")
public class SalesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/PackageManager")
	PackageManager manager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@EJB(name = "manager/OptionalProduct")
	OptionalProductManager OptionalProduct;
	
	@EJB(name = "manager/ViewDataManager")
	ViewDataManager ViewDataManager;
	
	@EJB(name = "manager/PurchaseManager")
	PurchaseManager PurchaseManager;

	@PostConstruct
	public void init() {
		manager = new PackageManager();
		SessionManager = new SessionManager();
		OptionalProduct = new OptionalProductManager();
		ViewDataManager = new ViewDataManager();
		PurchaseManager = new PurchaseManager();
	}

	public SalesReport() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			AddableHttpRequest req = new AddableHttpRequest(request);
			req.addParameter("username", username);
			List<Pack> p = manager.allPackage();
			req.addParameter("PackSize", Integer.toString(p.size()));
			for (int i = 0; i < p.size(); i++) {
				List<Validityperiod> vp = p.get(i).getValidityperiods();
				req.addParameter(i + "Pack" + vp.get(0).getId().getMonthnumber(),
						Integer.toString(vp.get(0).getValidityperiodsalesreport().getQuantity()));
				req.addParameter(i + "Pack" + vp.get(1).getId().getMonthnumber(),
						Integer.toString(vp.get(1).getValidityperiodsalesreport().getQuantity()));
				req.addParameter(i + "Pack" + vp.get(2).getId().getMonthnumber(),
						Integer.toString(vp.get(2).getValidityperiodsalesreport().getQuantity()));
				req.addParameter("Pack" + i, p.get(i).getName());
				int totPurchases = p.get(i).getPacksalesreport().getPurchasesop() + p.get(i).getPacksalesreport().getPurchasesnoop();
				req.addParameter("PackN" + i, Integer.toString(totPurchases));
				req.addParameter("PackNop" + i, Integer.toString(p.get(i).getPacksalesreport().getPurchasesop()));
				req.addParameter("PackNnoop" + i, Integer.toString(p.get(i).getPacksalesreport().getPurchasesnoop()));
				req.addParameter("Average" + i, Float.toString(p.get(i).getPacksalesreport().getAverageproduct()));
			}
			List<Optionalproduct> op = OptionalProduct.allOptionalProduct();
			Optionalproduct bestSeller = op.get(0);
			for (int i = 1; i < op.size(); i++) {
				if (op.get(i).getOptionalproductsalesreport().getAmountsold() > bestSeller.getOptionalproductsalesreport().getAmountsold()) {
					bestSeller = op.get(i);
				}
			}
			req.addParameter("BestSeller", bestSeller.getName());
			req.addParameter("AmountSold", Integer.toString(bestSeller.getOptionalproductsalesreport().getAmountsold()));
			List<User> users = ViewDataManager.allUsers();
			int size = 0;
			for(int i=0; i<users.size(); i++) {
				if(!users.get(i).getUsersalesreport().getSolvent()) {
					req.addParameter("InsolventUser"+size, users.get(i).getUsername());
					size++;
				}
			}
			req.addParameter("InsolventUserSize", Integer.toString(size));
			List<Purchase> purchases = PurchaseManager.allPurchases();
			size = 0;
			for(int i=0; i<purchases.size(); i++) {
				if(purchases.get(i).getPurchasesalesreport().getRejected() != 0) {
					req.addParameter("suspendedOrder"+size, Long.toString(purchases.get(i).getId()));
					req.addParameter("suspendedOrderU"+size, purchases.get(i).getUserBean().getUsername());
					size++;
				}
			}
			req.addParameter("suspendedOrderSize", Integer.toString(size));
			List<Alert> alerts = ViewDataManager.allAlerts();
			req.addParameter("alertsSize", Integer.toString(alerts.size()));
			for(int i=0; i<alerts.size(); i++) {
				req.addParameter("AlertU" + i, alerts.get(i).getUser());
				req.addParameter("AlertE" + i, alerts.get(i).getEmail());
				req.addParameter("AlertA" + i, Float.toString(alerts.get(i).getAmount()));
				req.addParameter("AlertT" + i, alerts.get(i).getTimestamp().toString());
			}
			RequestDispatcher view = req.getRequestDispatcher("pages/SalesReport.jsp");
			view.forward(req, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}
}