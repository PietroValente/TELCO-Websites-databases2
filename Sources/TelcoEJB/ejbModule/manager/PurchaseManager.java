package manager;

import java.util.ArrayList;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.Optionalproduct;
import model.Pack;
import model.Purchase;
import model.Purchasesalesreport;
import model.User;

@LocalBean
@Stateless
public class PurchaseManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	public PurchaseManager() {
		// TODO Auto-generated constructor stub
	}

	// Returns the list of all purchases
	public List<Purchase> allPurchases() {
		em.clear();
		return em.createNamedQuery("Purchase.findAll", Purchase.class).getResultList();
	}

	// Create a new purchase
	public void createPurchase(Date endperiod, Date startperiod, Timestamp timestamp, String username, Pack pack,
			List<Optionalproduct> products, Float price, int rejected) {
		em.clear();
		Purchase p = new Purchase();
		p.setStartperiod(startperiod);
		p.setEndperiod(endperiod);
		p.setTimestamp(timestamp);
		p.setPrice(price);
		List<Optionalproduct> op = new ArrayList<Optionalproduct>();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		for (int i = 0; i < products.size(); i++) {
			Optionalproduct pro = em.merge(em.find(Optionalproduct.class, products.get(i).getId()));
			op.add(pro);
		}
		User u = new User();
		u = em.merge(em.find(User.class, username));
		pack = em.merge(em.find(Pack.class, pack.getId()));
		p.setPackBean(pack);
		p.setUserBean(u);
		em.persist(p);
		em.refresh(pack);
		em.refresh(u);
		tx.commit();
		
		EntityTransaction tx1 = em.getTransaction();
		tx1.begin();
		em.refresh(p);
		p = em.merge(p);
		p.setOptionalproducts(op);
		tx1.commit();
		
		EntityTransaction tx2 = em.getTransaction();
		tx2.begin();
		em.refresh(p);
		em.refresh(u);
		em.refresh(pack);
		Purchasesalesreport psr = new Purchasesalesreport();
		psr.setPurchase(p.getId());
		psr.setPrice(price);
		psr.setRejected(rejected);
		psr.setOptionalproduct(products.size());
		psr.setUser(u);
		psr.setPackBean(pack);
		em.persist(psr);
		tx2.commit();
	}

	// Retry to purchase an order
	public void retryPurchase(long id, boolean status) {
		em.clear();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		Purchasesalesreport psr = em.find(Purchasesalesreport.class, id);
		if (status) {
			psr.setRejected(0);
		} else {
			int rejected = psr.getRejected();
			psr.setRejected(rejected + 1);
		}
		em.merge(psr);
		tx.commit();
	}
}
