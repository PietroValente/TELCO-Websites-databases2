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

import manager.SignUpManager;
import util.AddableHttpRequest;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/signupUser.do")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "manager/SignUpManager")
	private SignUpManager signupBean;

	@PostConstruct
	public void init() {
		signupBean = new SignUpManager();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = "consumer";
		AddableHttpRequest req = new AddableHttpRequest(request);
		try {
			if (firstname.compareTo("") == 0 || lastname.compareTo("") == 0 || email.compareTo("") == 0
					|| username.compareTo("") == 0 || password.compareTo("") == 0) {
				throw new IllegalArgumentException();
			}
			signupBean.addUser(username, firstname, lastname, role, true, password, email);
			req.addParameter("succcessMessage", "<strong>Registration completed succesfully!</strong>");
		} catch (Exception e) {
			req.addParameter("dangerMessage", "<strong>Registration unsuccesfully!</strong><br>Maybe someone already uses the username or email you entered. Try again");
		}
		RequestDispatcher view1 = req.getRequestDispatcher("Homepage.do");
		view1.forward(req, response);
	}

}
