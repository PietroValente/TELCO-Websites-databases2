package manager;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.Optionalproductsalesreport;
import model.Packsalesreport;
import model.Purchasesalesreport;
import model.Usersalesreport;
import model.Validityperiodsalesreport;

import java.util.List;

import javax.ejb.LocalBean;

@Stateless
@LocalBean
public class SalesReportManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public SalesReportManager() {

	}

	// Returns the list of all Usersalesreport
	public List<Usersalesreport> allUsersalesreport() {
		em.clear();
		return em.createNamedQuery("Usersalesreport.findAll", Usersalesreport.class).getResultList();
	}
	
	// Returns the list of all Validityperiodsalesreport
	public List<Validityperiodsalesreport> allValidityperiodsalesreport() {
		em.clear();
		return em.createNamedQuery("Validityperiodsalesreport.findAll", Validityperiodsalesreport.class).getResultList();
	}
	
	// Returns the list of all Purchasesalesreport
	public List<Purchasesalesreport> allPurchasesalesreport() {
		em.clear();
		return em.createNamedQuery("Purchasesalesreport.findAll", Purchasesalesreport.class).getResultList();
	}
	
	// Returns the list of all Packsalesreport
	public List<Packsalesreport> allPacksalesreport() {
		em.clear();
		return em.createNamedQuery("Packsalesreport.findAll", Packsalesreport.class).getResultList();
	}
	
	// Returns the list of all Optionalproductsalesreport
	public List<Optionalproductsalesreport> allOptionalproductsalesreport() {
		em.clear();
		return em.createNamedQuery("Optionalproductsalesreport.findAll", Optionalproductsalesreport.class).getResultList();
	}
}
