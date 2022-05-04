package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import model.Optionalproduct;
import model.Pack;
import model.Service;
import model.Validityperiod;
import util.AddableHttpRequest;

/**
 * Servlet implementation class Detail_Service_Package
 */
@WebServlet("/DetailServicePackage.do")
public class DetailServicePackage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/PackageManager")
	private PackageManager pack;
	@EJB(name = "manager/SessionManager")
	private SessionManager session;
	
	@PostConstruct
	public void init() {
		pack = new PackageManager();
		session = new SessionManager();
	}
	
	public DetailServicePackage() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = session.user(request.getCookies());
		AddableHttpRequest req = new AddableHttpRequest(request);
		if(username != null) {
			req.addParameter("username", username);
		}
		else {
			req.addParameter("username", "MyTELCO");
		}
		String ID = request.getParameter("PackageID");
		req.addParameter("PackageID", ID);
		int number = Integer.parseInt(ID);
		List<Pack> packages = pack.allPackage();
		Pack p = new Pack(); 
		for(int i = 0; i < packages.size(); i++) {
			if(packages.get(i).getId() == number) {
				p = packages.get(i); 
			}
		}
		LocalDate day;
		try {
			day = LocalDate.parse(request.getParameter("date"));
		} catch (Exception e) {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			String t = dtf.format(now);
			day = LocalDate.of(Integer.parseInt(t.substring(0, 4)), Integer.parseInt(t.substring(5, 7)),
					Integer.parseInt(t.substring(8, 10)));
		}
		req.addParameter("Day", day.toString());
		String name = p.getName();
		req.addParameter("PackageName", name);
		List<Service> services = p.getServices();
		req.addParameter("allServiceSize", Integer.toString(services.size()));
		List<Optionalproduct> products = p.getOptionalproducts();
		req.addParameter("allProductSize", Integer.toString(products.size()));
		List<Validityperiod> periods = p.getValidityperiods();
		req.addParameter("allPeriodsSize", Integer.toString(products.size()));

		for(int i = 0; i< services.size(); i++) {
			req.addParameter("quantity"+i, Long.toString(pack.quantity(p.getId(), services.get(i).getId())));
			req.addParameter("serviceID"+i, Long.toString(services.get(i).getId()));
			req.addParameter("serviceName"+i, services.get(i).getName());
			req.addParameter("serviceType"+i, services.get(i).getType());
			if(services.get(i).getType().equalsIgnoreCase("mobileinternet") || services.get(i).getType().equalsIgnoreCase("fixedinternet")) {
				if(services.get(i).getGiga() == -1) {
					req.addParameter("gigaBytes"+i, "Unlimited");
				}
				else {
					req.addParameter("gigaBytes"+i, Integer.toString(services.get(i).getGiga()));
					req.addParameter("extraGigafee"+i, Float.toString(services.get(i).getExtragiga()));
				}	
			}
			else if(services.get(i).getType().equalsIgnoreCase("mobilephone")) {
				if(services.get(i).getMin() == -1){
					req.addParameter("minutes"+i, "Unlimited");
				}
				else {
					req.addParameter("minutes"+i, Integer.toString(services.get(i).getMin()));
					req.addParameter("extraMinutesfee"+i, Float.toString(services.get(i).getExtraminute()));
				}
				if(services.get(i).getSms() == -1){
					req.addParameter("sms"+i, "Unlimited");
				}
				else {
					req.addParameter("sms"+i, Integer.toString(services.get(i).getSms()));
					req.addParameter("extraSmsfee"+i, Float.toString(services.get(i).getExtrasms()));
				}
			}
		}
	
		for(int i = 0; i< periods.size(); i++) {
			if(periods.get(i).getId().getMonthnumber().equals("12")){
				req.addParameter("periodFee1", Float.toString(periods.get(i).getFee()));
			}
			else if(periods.get(i).getId().getMonthnumber().equals("24")){
				req.addParameter("periodFee2", Float.toString(periods.get(i).getFee()));
			}
			else {
				req.addParameter("periodFee3", Float.toString(periods.get(i).getFee()));
			}
		
		}
		
		for(int i = 0; i< products.size(); i++) {
			req.addParameter("productID"+i, Long.toString(products.get(i).getId()));
			req.addParameter("productName"+i, products.get(i).getName());
			req.addParameter("productFee"+i, Float.toString(products.get(i).getFee()));
		}
		
		RequestDispatcher view = req.getRequestDispatcher("pages/DetailServicePackage.jsp");
		view.forward(req, response);
	}

}
