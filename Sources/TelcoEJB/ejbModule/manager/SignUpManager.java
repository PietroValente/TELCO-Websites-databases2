package manager;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.User;

//bean that manages sign up
@Stateless
@LocalBean
public class SignUpManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public SignUpManager() {
	}

	// add a new user
	public void addUser(String username, String name, String last_name, String role, boolean solvent, String password,
			String email) {
		em.clear();
		User user = new User();
		user.setUsername(username);
		user.setFirstname(name);
		user.setLastname(last_name);
		user.setRole(role);
		user.setPassword(password);
		user.setEmail(email);
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(user);
		tx.commit();
	}
}
