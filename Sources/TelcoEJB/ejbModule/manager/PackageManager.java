package manager;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
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
import model.Packageservice;
import model.PackageservicePK;
import model.Service;
import model.Validityperiod;
import model.ValidityperiodPK;

/**
 * Session Bean implementation class PackageManager
 */
@Stateless
@LocalBean
public class PackageManager {

	@PersistenceContext(unitName = "TelcoEJB")
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("TelcoEJB");
	@SuppressWarnings("unused")
	private EntityManager em = emf.createEntityManager();

	/**
	 * Default constructor.
	 */
	public PackageManager() {
		// TODO Auto-generated constructor stub
	}

	// Returns the list of all packages
	public List<Pack> allPackage() {
		return em.createNamedQuery("Pack.findAll", Pack.class).getResultList();
	}

	// Add a package
	public void addPackage(String name, float fee12, float fee24, float fee36, String feature1, String feature2,
			String feature3, Hashtable<Service, Integer> service, List<Optionalproduct> optionalProduct) {
		Pack p = new Pack();
		p.setName(name);
		p.setFeature1(feature1);
		p.setFeature2(feature2);
		p.setFeature3(feature3);
		
		List<Optionalproduct> op = new ArrayList<Optionalproduct>();
		for (int i = 0; i < optionalProduct.size(); i++) {
			op.add(em.find(Optionalproduct.class, optionalProduct.get(i).getId()));
		}
		p.setOptionalproducts(op);
		
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(p);
		tx.commit();
		
		long packageID = p.getId();
		
		ValidityperiodPK pk1 = new ValidityperiodPK();
		pk1.setPack(packageID);
		pk1.setMonthnumber("12");
		Validityperiod vp1 = new Validityperiod();
		vp1.setId(pk1);
		vp1.setFee(fee12);
		vp1.setPackBean(p);
		
		ValidityperiodPK pk2 = new ValidityperiodPK();
		pk2.setPack(packageID);
		pk2.setMonthnumber("24");
		Validityperiod vp2 = new Validityperiod();
		vp2.setId(pk2);
		vp2.setFee(fee24);
		vp2.setPackBean(p);
		
		ValidityperiodPK pk3 = new ValidityperiodPK();
		pk3.setPack(packageID);
		pk3.setMonthnumber("36");
		Validityperiod vp3 = new Validityperiod();
		vp3.setId(pk3);
		vp3.setFee(fee36);
		vp3.setPackBean(p);
		
		EntityTransaction tx1 = em.getTransaction();
		tx1.begin();
		em.persist(vp1);
		em.persist(vp2);
		em.persist(vp3);
		tx1.commit();
		
		em.clear();
		EntityTransaction tx2 = em.getTransaction();
		tx2.begin();
		Enumeration<Service> e = service.keys();
		while (e.hasMoreElements()) {
			Service s = e.nextElement();
			PackageservicePK sk = new PackageservicePK();
			sk.setPack(packageID);
			sk.setService(s.getId());
			Packageservice ps = new Packageservice();
			ps.setId(sk);
			ps.setQuantity(service.get(s));
			em.persist(ps);
		}
		tx2.commit();
	}

	// Filter packages by service type
	public List<Pack> getPackages(String type) {
		em.clear();
		List<Pack> result = new ArrayList<Pack>();
		List<Pack> result1 = em.createNamedQuery("Pack.findAll", Pack.class).getResultList();
		Pack p = new Pack();
		Iterator<Pack> listiterator = result1.listIterator();
		while (listiterator.hasNext()) {
			p = listiterator.next();
			List<Service> services = p.getServices();
			for (int i = 0; i < services.size(); i++) {
				if (services.get(i).getType().equalsIgnoreCase(type)) {
					result.add(p);
					break;
				}
			}
		}
		return result;
	}

	// Returns quantity of package-service
	public int quantity(long packId, long servId) {
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		PackageservicePK pk = new PackageservicePK();
		pk.setPack(packId);
		pk.setService(servId);
		Packageservice ps = em.find(Packageservice.class, pk);
		tx.commit();
		return ps.getQuantity();
	}
}
