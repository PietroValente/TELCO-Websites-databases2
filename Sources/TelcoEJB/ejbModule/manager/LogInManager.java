package manager;

import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.User;

import javax.ejb.LocalBean;

//bean that manages log in
@Stateful
@LocalBean
public class LogInManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public LogInManager() {

	}

	// check username and password entered for consumer, true if user exist
	public boolean validateUser(String username, String pass) {
		boolean valide = false;
		em.clear();
		User u = em.find(User.class, username);
		em.refresh(u);
		String password = null;
		try {
			password = u.getPassword();
		} catch (Exception e) {
			password = null;
		}
		if (password != null && pass.equals(password) && (u.getRole().compareTo("consumer") == 0)) {
			valide = true;
		}
		return valide;
	}

	// check username and password entered for an employee, true if user exist
	public boolean validateEmployee(String username, String pass) {
		boolean valide = false;
		em.clear();
		User u = em.find(User.class, username);
		String password = null;
		try {
			password = u.getPassword();
		} catch (Exception e) {
			password = null;
		}
		if (password != null && pass.equals(password) && u.getRole().compareTo("employee") == 0) {
			valide = true;
		}
		return valide;
	}

	// returns the user corresponding to the username, null if the user does not
	// exist
	public User getUser(String username) {
		em.clear();
		User user = new User();
		try {
			EntityTransaction tx = em.getTransaction();
			tx.begin();
			user = em.merge(em.find(User.class, username));
			em.refresh(user);
			tx.commit();
		} catch (Exception e) {
			return null;
		}
		return user;
	}

}
