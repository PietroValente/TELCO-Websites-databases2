package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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
import manager.PurchaseManager;
import manager.SessionManager;
import model.Optionalproduct;
import model.Pack;
import model.User;
import util.AddableHttpRequest;

/**
 * Servlet implementation class OrderPack
 */
@WebServlet("/OrderPack")
public class OrderPack extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB(name = "manager/PackageManager")
	private PackageManager pack;

	@EJB(name = "manager/SessionManager")
	private SessionManager session;

	@EJB(name = "manager/LoginManager")
	private LogInManager login;

	@EJB(name = "manager/PurchaseManager")
	private PurchaseManager purchase;

	@PostConstruct
	public void init() {
		pack = new PackageManager();
		session = new SessionManager();
		login = new LogInManager();
		purchase = new PurchaseManager();
	}

	public OrderPack() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null) {
			if (request.getParameter("success") != null) {
				User u = login.getUser(username);
				String PackageID = request.getParameter("PackageID");
				req.addParameter("PackageID", PackageID);
				int number = Integer.parseInt(PackageID);
				List<Pack> packages = pack.allPackage();
				Pack p = new Pack();
				for (int i = 0; i < packages.size(); i++) {
					if (packages.get(i).getId() == number) {
						p = packages.get(i);
					}
				}
				Float totalproduct = (float) 0;
				List<Optionalproduct> allProducts = p.getOptionalproducts();
				List<Optionalproduct> products = new ArrayList<Optionalproduct>();
				req.addParameter("allProductSize", Integer.toString(products.size()));
				for (int i = 0; i < allProducts.size(); i++) {
					if (request.getParameter(allProducts.get(i).getName()) != null) {
						products.add(allProducts.get(i));
					}
				}
				totalproduct = Float.parseFloat(req.getParameter("total"));
				req.addParameter("PackageID", PackageID);
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				String start = req.getParameter("startdate");
				LocalDate s = LocalDate.of(Integer.parseInt(start.substring(0, 4)),
						Integer.parseInt(start.substring(5, 7)), Integer.parseInt(start.substring(8, 10)));
				Date startdate = Date.from(s.atStartOfDay(ZoneId.systemDefault()).toInstant());
				String end = req.getParameter("enddate");
				LocalDate e = LocalDate.of(Integer.parseInt(end.substring(0, 4)), Integer.parseInt(end.substring(5, 7)),
						Integer.parseInt(end.substring(8, 10)));
				Date enddate = Date.from(e.atStartOfDay(ZoneId.systemDefault()).toInstant());
				purchase.createPurchase(enddate, startdate, timestamp, u.getUsername(), p, products, totalproduct, 0);
				req.addParameter("succcessMessage", "Payment done");
			} else if (request.getParameter("unsuccess") != null) {
				User u = login.getUser(username);
				String PackageID = request.getParameter("PackageID");
				req.addParameter("PackageID", PackageID);
				int number = Integer.parseInt(PackageID);
				List<Pack> packages = pack.allPackage();
				Pack p = new Pack();
				for (int i = 0; i < packages.size(); i++) {
					if (packages.get(i).getId() == number) {
						p = packages.get(i);
					}
				}
				Float totalproduct = (float) 0;
				List<Optionalproduct> allProducts = p.getOptionalproducts();
				List<Optionalproduct> products = new ArrayList<Optionalproduct>();
				req.addParameter("allProductSize", Integer.toString(products.size()));
				for (int i = 0; i < allProducts.size(); i++) {
					if (request.getParameter(allProducts.get(i).getName()) != null) {
						products.add(allProducts.get(i));
					}
				}
				totalproduct = Float.parseFloat(req.getParameter("total"));
				req.addParameter("PackageID", PackageID);
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				String start = req.getParameter("startdate");
				LocalDate s = LocalDate.of(Integer.parseInt(start.substring(0, 4)),
						Integer.parseInt(start.substring(5, 7)), Integer.parseInt(start.substring(8, 10)));
				Date startdate = Date.from(s.atStartOfDay(ZoneId.systemDefault()).toInstant());
				String end = req.getParameter("enddate");
				LocalDate e = LocalDate.of(Integer.parseInt(end.substring(0, 4)), Integer.parseInt(end.substring(5, 7)),
						Integer.parseInt(end.substring(8, 10)));
				Date enddate = Date.from(e.atStartOfDay(ZoneId.systemDefault()).toInstant());
				purchase.createPurchase(enddate, startdate, timestamp, u.getUsername(), p, products, totalproduct, 1);
				req.addParameter("dangerMessage", "Payment unsuccessful");
			} else {
				req.addParameter("dangerMessage", "Please log in");
			}
			RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
			view.forward(req, response);
			return;
		}
		req.addParameter("dangerMessage", "Error");
		RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
		view.forward(req, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
