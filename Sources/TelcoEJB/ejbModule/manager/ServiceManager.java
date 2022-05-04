package manager;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import model.Service;

/**
 * Session Bean implementation class ServiceManager
 */
@Stateless
@LocalBean
public class ServiceManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	/**
	 * Default constructor.
	 */
	public ServiceManager() {
		// TODO Auto-generated constructor stub
	}

	// Returns the list of all services
	public List<Service> allService() {
		em.clear();
		return em.createNamedQuery("Service.findAll", Service.class).getResultList();
	}

	// Returns the list of all mobile phone services
	public List<Service> allMobilePhoneService() {
		em.clear();
		return em.createNamedQuery("Service.findAllType", Service.class).setParameter(1, "mobilephone").getResultList();
	}

	// Returns the list of all mobile internet services
	public List<Service> allMobileInternetService() {
		em.clear();
		return em.createNamedQuery("Service.findAllType", Service.class).setParameter(1, "mobileinternet")
				.getResultList();
	}

	// Returns the list of all fixed internet services
	public List<Service> allFixedInternetService() {
		em.clear();
		return em.createNamedQuery("Service.findAllType", Service.class).setParameter(1, "fixedinternet")
				.getResultList();
	}

	// Add a Mobile Phone offer
	public void addMobilePhone(String name, int min, int sms, float extraMinute, float extraSms) {
		em.clear();
		Service s = new Service();
		s.setName(name);
		s.setMin(min);
		s.setSms(sms);
		s.setExtraminute(extraMinute);
		s.setExtrasms(extraSms);
		s.setType("mobilephone");

		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(s);
		tx.commit();
	}

	// Add a Mobile Internet offer
	public void addMobileInternet(String name, int giga, float fee) {
		em.clear();
		Service s = new Service();
		s.setName(name);
		s.setGiga(giga);
		s.setExtragiga(fee);
		s.setType("mobileinternet");

		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(s);
		tx.commit();
	}

	// Add a Fixed Internet offer
	public void addFixedInternet(String name, int giga, float fee) {
		em.clear();
		Service s = new Service();
		s.setName(name);
		s.setGiga(giga);
		s.setExtragiga(fee);
		s.setType("fixedinternet");

		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(s);
		tx.commit();
	}

}
