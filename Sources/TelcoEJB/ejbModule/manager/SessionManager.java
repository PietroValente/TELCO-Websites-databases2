package manager;

import java.sql.Timestamp;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Cookie;

import model.Session;
import model.User;

//bean that manages session control
@Stateful
@LocalBean
public class SessionManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public SessionManager() {

	}

	// checks the validity of the AccessSession cookie and returns the associated
	// username,
	// or null if the session does not exist
	public String user(Cookie[] cookies) {
		if (cookies == null) {
			return null;
		}
		long sessionAccess = session(cookies);
		if (sessionAccess == -1) {
			return null;
		}
		em.clear();
		Session s = em.merge(em.find(Session.class, sessionAccess));
		try {
			return s.getUserBean().getUsername();
		} catch (Exception e) {
			return null;
		}

	}

	// extracts the AccessSession cookie code, or returns -1 if it doesn't exist
	public long session(Cookie[] cookies) {
		if (cookies == null) {
			return -1;
		}
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().compareTo("AccessSession") == 0) {
				try {
					return Long.parseLong(cookies[i].getValue());
				} catch (Exception e) {
					return -1;
				}
			}
		}
		return -1;
	}

	// generates a new SessionAccess value to be associated with User u
	// createSessionID
	public long getSessionID(String username) {
		em.clear();
		User usr = new User();
		usr = em.find(User.class, username);
		Session s = new Session();
		s.setTimestamp(new Timestamp(System.currentTimeMillis()));
		s.setUserBean(usr);
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(s);
		tx.commit();
		return s.getId();
	}

	// delete the SessionAccess value
	public void deleteSessionID(Cookie[] cookies) {
		long sessionID = session(cookies);
		em.clear();
		Session s = em.find(Session.class, sessionID);
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		s = em.merge(s);
		em.remove(s);
		tx.commit();
	}

}
