package manager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.Alert;
import model.Optionalproduct;
import model.Pack;
import model.User;
import model.Validityperiod;
import model.ValidityperiodPK;

@LocalBean
@Stateless
public class ViewDataManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public ViewDataManager() {

	}

	// Returns the list of all packages of a type
	public List<Pack> getPackages(String type) {
		em.clear();
		List<Pack> result = new ArrayList<Pack>();
		List<Pack> result1 = em.createNamedQuery("Pack.findAll", Pack.class).getResultList();
		Pack p = new Pack();
		Iterator<Pack> listiterator = result1.listIterator();
		while (listiterator.hasNext()) {
			p = listiterator.next();
			if (p.getName().equals(type)) {
				result.add(p);
			}
		}
		return result;
	}

	// Compute the total cost of a purchase
	public float computeCost(Optionalproduct product, Validityperiod period) {
		em.clear();
		ValidityperiodPK pk = period.getId();
		int month_number = Integer.parseInt(pk.getMonthnumber());
		float cost = product.getFee() * month_number + period.getFee() * month_number;
		return cost;
	}
	
	// Returns the list of all users
	public List<User> allUsers() {
		em.clear();
		return em.createNamedQuery("User.findAll", User.class).getResultList();
	}
	
	// Returns the list of all alerts
	public List<Alert> allAlerts() {
		em.clear();
		return em.createNamedQuery("Alert.findAll", Alert.class).getResultList();
	}

}
