package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.LogInManager;
import manager.PackageManager;
import manager.SessionManager;
import model.Optionalproduct;
import model.Pack;
import model.Service;
import model.Validityperiod;
import util.AddableHttpRequest;

/**
 * Servlet implementation class Confirmation
 */
@WebServlet("/Confirmation.do")
public class Confirmation extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB(name = "manager/PackageManager")
	private PackageManager pack;
	@EJB(name = "manager/SessionManager")
	private SessionManager session;
	@EJB(name = "manager/LogInManager")
	private LogInManager loginBean;
	@EJB(name = "manager/SessionManager")
	private SessionManager sessionBean;

	boolean flag = false;

	@PostConstruct
	public void init() {
		pack = new PackageManager();
		session = new SessionManager();
		loginBean = new LogInManager();
		sessionBean = new SessionManager();
	}

	public Confirmation() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if (username != null || flag) {
			if (flag) {
				username = "dummy";
			}
			req.addParameter("username", username);
		} else {
			req.addParameter("username", "MyTELCO");
		}
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
		req.addParameter("PackageName", p.getName());

		List<Service> services = p.getServices();
		req.addParameter("allServiceSize", Integer.toString(services.size()));
		List<Optionalproduct> products = p.getOptionalproducts();
		req.addParameter("allProductSize", Integer.toString(products.size()));
		List<Validityperiod> periods = p.getValidityperiods();

		for (int i = 0; i < services.size(); i++) {
			req.addParameter("quantity" + i, Long.toString(pack.quantity(p.getId(), services.get(i).getId())));
			req.addParameter("serviceID" + i, Long.toString(services.get(i).getId()));
			req.addParameter("serviceName" + i, services.get(i).getName());
			req.addParameter("serviceType" + i, services.get(i).getType());
			if (services.get(i).getType().equalsIgnoreCase("mobileinternet")
					|| services.get(i).getType().equalsIgnoreCase("fixedinternet")) {
				if (services.get(i).getGiga() == -1) {
					req.addParameter("gigaBytes" + i, "Unlimited");
				} else {
					req.addParameter("gigaBytes" + i, Integer.toString(services.get(i).getGiga()));
					req.addParameter("extraGigafee" + i, Float.toString(services.get(i).getExtragiga()));
				}
			} else if (services.get(i).getType().equalsIgnoreCase("mobilephone")) {
				if (services.get(i).getMin() == -1) {
					req.addParameter("minutes" + i, "Unlimited");
				} else {
					req.addParameter("minutes" + i, Integer.toString(services.get(i).getMin()));
					req.addParameter("extraMinutesfee" + i, Float.toString(services.get(i).getExtraminute()));
				}
				if (services.get(i).getSms() == -1) {
					req.addParameter("sms" + i, "Unlimited");
				} else {
					req.addParameter("sms" + i, Integer.toString(services.get(i).getSms()));
					req.addParameter("extraSmsfee" + i, Float.toString(services.get(i).getExtrasms()));
				}
			}
		}

		Float totalproduct = (float) 0;
		for (int i = 0; i < products.size(); i++) {
			if (request.getParameter(products.get(i).getName()) != null) {
				req.addParameter("productID" + i, Long.toString(products.get(i).getId()));
				req.addParameter("productName" + i, products.get(i).getName());
				req.addParameter("productFee" + i, Float.toString(products.get(i).getFee()));
				totalproduct = totalproduct + products.get(i).getFee();
			}
		}

		req.addParameter("costProduct", Float.toString(totalproduct));
		String s = request.getParameter("validityperiod");
		int months = Integer.parseInt(s);
		req.addParameter("totalProduct", Float.toString(totalproduct * months));
		String s1 = null;
		Float totalperiod = null;
		req.addParameter("validityMonth", s);
		for (int i = 0; i < periods.size(); i++) {
			if (periods.get(i).getId().getMonthnumber().equals(s)) {
				s1 = Float.toString(periods.get(i).getFee());
				totalperiod = periods.get(i).getFee() * months;
			}
		}
		req.addParameter("validityFee", s1);
		req.addParameter("totalPeriod", Float.toString(totalperiod));
		req.addParameter("total", Float.toString(totalproduct * months + totalperiod));
		String start = request.getParameter("date");
		LocalDate startdate;
		try {
			startdate = LocalDate.of(Integer.parseInt(start.substring(0, 4)), Integer.parseInt(start.substring(5, 7)),
					Integer.parseInt(start.substring(8, 10)));
		} catch (Exception e) {
			startdate = LocalDate.now();
		}
		LocalDate enddate = startdate.plusMonths(months);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String end = dtf.format(enddate);
		req.addParameter("startdate", startdate.toString());
		req.addParameter("enddate", end);
		RequestDispatcher view = req.getRequestDispatcher("pages/Confirmation.jsp");
		view.forward(req, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AddableHttpRequest req = new AddableHttpRequest(request);
		try {
			loginBean.validateUser(username, password);
			if (username.compareTo("") == 0 || password.compareTo("") == 0) {
				throw new IllegalArgumentException();
			}
			long sessionID = sessionBean.getSessionID(username);
			Cookie AccessSession = new Cookie("AccessSession", Long.toString(sessionID));
			response.addCookie(AccessSession);
			req.addParameter("succcessMessage", "<strong>Welcome back!</strong>");
			flag = true;
		} catch (Exception e) {
			req.addParameter("dangerMessage", "<strong>Wrong username or password</strong>");
		}
		doGet(req, response);
	}

}
