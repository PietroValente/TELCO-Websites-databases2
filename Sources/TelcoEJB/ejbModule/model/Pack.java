package model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the pack database table.
 * 
 */
@Entity
@Table(name="pack")
@NamedQuery(name="Pack.findAll", query="SELECT p FROM Pack p")
public class Pack implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private long id;

	@Column(length=30)
	private String feature1;

	@Column(length=30)
	private String feature2;

	@Column(length=30)
	private String feature3;

	@Column(nullable=false, length=30)
	private String name;

	//bi-directional many-to-many association to Optionalproduct
	@ManyToMany(cascade={CascadeType.PERSIST})
	@JoinTable(
		name="packageproduct"
		, joinColumns={
			@JoinColumn(name="pack", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="optionalproduct", nullable=false)
			}
		)
	private List<Optionalproduct> optionalproducts;

	//bi-directional many-to-one association to Packageservice
	@OneToMany(mappedBy="packBean", cascade={CascadeType.PERSIST})
	private List<Packageservice> packageservices;

	//bi-directional many-to-one association to Purchase
	@OneToMany(mappedBy="packBean", cascade={CascadeType.PERSIST})
	private List<Purchase> purchases;
	
	//bi-directional many-to-one association to Purchasesalesreport
	@OneToMany(mappedBy="packBean", cascade={CascadeType.PERSIST})
	private List<Purchasesalesreport> purchasesalesreports;

	//bi-directional many-to-one association to Validityperiod
	@OneToMany(mappedBy="packBean", cascade={CascadeType.PERSIST})
	private List<Validityperiod> validityperiods;

	//bi-directional one-to-one association to Packsalesreport
	@OneToOne(mappedBy="packBean", cascade={CascadeType.PERSIST})
	private Packsalesreport packsalesreport;
	
	//bi-directional many-to-many association to Service
	@ManyToMany(cascade={CascadeType.PERSIST})
	@JoinTable(
		name="packageservice"
		, joinColumns={
			@JoinColumn(name="pack", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="service", nullable=false)
			}
		)
	private List<Service> services;

	public Pack() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFeature1() {
		return this.feature1;
	}

	public void setFeature1(String feature1) {
		this.feature1 = feature1;
	}

	public String getFeature2() {
		return this.feature2;
	}

	public void setFeature2(String feature2) {
		this.feature2 = feature2;
	}

	public String getFeature3() {
		return this.feature3;
	}

	public void setFeature3(String feature3) {
		this.feature3 = feature3;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Optionalproduct> getOptionalproducts() {
		return this.optionalproducts;
	}

	public void setOptionalproducts(List<Optionalproduct> optionalproducts) {
		this.optionalproducts = optionalproducts;
	}

	public List<Packageservice> getPackageservices() {
		return this.packageservices;
	}

	public void setPackageservices(List<Packageservice> packageservices) {
		this.packageservices = packageservices;
	}

	public Packageservice addPackageservice(Packageservice packageservice) {
		getPackageservices().add(packageservice);
		packageservice.setPackBean(this);

		return packageservice;
	}

	public Packageservice removePackageservice(Packageservice packageservice) {
		getPackageservices().remove(packageservice);
		packageservice.setPackBean(null);

		return packageservice;
	}

	public List<Purchase> getPurchases() {
		return this.purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public Purchase addPurchas(Purchase purchas) {
		getPurchases().add(purchas);
		purchas.setPackBean(this);

		return purchas;
	}

	public Purchase removePurchas(Purchase purchas) {
		getPurchases().remove(purchas);
		purchas.setPackBean(null);

		return purchas;
	}

	public List<Validityperiod> getValidityperiods() {
		return this.validityperiods;
	}

	public void setValidityperiods(List<Validityperiod> validityperiods) {
		this.validityperiods = validityperiods;
	}

	public Validityperiod addValidityperiod(Validityperiod validityperiod) {
		getValidityperiods().add(validityperiod);
		validityperiod.setPackBean(this);

		return validityperiod;
	}

	public Validityperiod removeValidityperiod(Validityperiod validityperiod) {
		getValidityperiods().remove(validityperiod);
		validityperiod.setPackBean(null);

		return validityperiod;
	}

	public Packsalesreport getPacksalesreport() {
		return this.packsalesreport;
	}

	public void setPacksalesreport(Packsalesreport packsalesreport) {
		this.packsalesreport = packsalesreport;
	}

	public List<Service> getServices() {
		return this.services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}
	
	public List<Purchasesalesreport> getPurchasesalesreports() {
		return this.purchasesalesreports;
	}

	public void setPurchasesalesreports(List<Purchasesalesreport> purchasesalesreports) {
		this.purchasesalesreports = purchasesalesreports;
	}

	public Purchasesalesreport addPurchasesalesreport(Purchasesalesreport purchasesalesreport) {
		getPurchasesalesreports().add(purchasesalesreport);
		purchasesalesreport.setPackBean(this);

		return purchasesalesreport;
	}

	public Purchasesalesreport removePurchasesalesreport(Purchasesalesreport purchasesalesreport) {
		getPurchasesalesreports().remove(purchasesalesreport);
		purchasesalesreport.setPackBean(null);

		return purchasesalesreport;
	}
}