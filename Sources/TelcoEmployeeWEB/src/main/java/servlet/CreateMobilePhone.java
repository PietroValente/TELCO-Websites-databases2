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
 * Servlet implementation class CreateMobilePhone
 */
@WebServlet("/CreateMobilePhone.do")
public class CreateMobilePhone extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/ServiceManager")
	ServiceManager manager;

	@EJB(name = "manager/SessionManager")
	SessionManager SessionManager;

	@PostConstruct
	public void init() {
		manager = new ServiceManager();
		SessionManager = new SessionManager();
	}

	public CreateMobilePhone() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = SessionManager.user(request.getCookies());
		if (username != null) {
			String name = request.getParameter("MobilePhoneName");
			String minutes = request.getParameter("MobilePhoneMinutes");
			String sms = request.getParameter("MobilePhoneSMS");
			String minutesExtraFee = request.getParameter("MobilePhoneMinutesFee");
			String smsExtraFee = request.getParameter("MobilePhoneSMSFee");
			if (request.getParameter("MobilePhoneMinutesUnlimited") != null) {
				minutes = "-1";
				minutesExtraFee = "0";
			}
			if (request.getParameter("MobilePhoneSMSUnlimited") != null) {
				sms = "-1";
				smsExtraFee = "0";
			}
			AddableHttpRequest req = new AddableHttpRequest(request);
			try {
				if (name.compareTo("") == 0 || minutes.compareTo("") == 0 || sms.compareTo("") == 0
						|| minutesExtraFee.compareTo("") == 0 || smsExtraFee.compareTo("") == 0) {
					throw new IllegalArgumentException();
				}
				manager.addMobilePhone(name, Integer.parseInt(minutes), Integer.parseInt(sms),
						Float.parseFloat(minutesExtraFee), Float.parseFloat(smsExtraFee));
				req.addParameter("succcessMessage", "<strong>Service added successfully!</strong>");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			} catch (Exception e) {
				req.addParameter("dangerMessage",
						"<strong>Service add failed</strong><br> Check that you have entered all the data and remember that two services cannot have the same name!");
				RequestDispatcher view = req.getRequestDispatcher("Homepage.do");
				view.forward(req, response);
			}
		} else {
			RequestDispatcher view = request.getRequestDispatcher("Login.do");
			view.forward(request, response);
		}
	}
}