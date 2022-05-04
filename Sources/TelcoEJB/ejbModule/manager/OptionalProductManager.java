package manager;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.Optionalproduct;

/**
 * Session Bean implementation class OptionalProductManager
 */
@Stateless
@LocalBean
public class OptionalProductManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	/**
	 * Default constructor.
	 */
	public OptionalProductManager() {
		// TODO Auto-generated constructor stub
	}

	// Returns the list of all optional product
	public List<Optionalproduct> allOptionalProduct() {
		em.clear();
		return em.createNamedQuery("Optionalproduct.findAll", Optionalproduct.class).getResultList();
	}

	// Add a Optional Product
	public void addOptionalProduct(String name, float fee) {
		em.clear();
		Optionalproduct p = new Optionalproduct();
		p.setName(name);
		p.setFee(fee);
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(p);
		tx.commit();
	}
}