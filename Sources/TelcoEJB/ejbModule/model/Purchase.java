package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the purchase database table.
 * 
 */
@Entity
@Table(name="purchase")
@NamedQuery(name="Purchase.findAll", query="SELECT p FROM Purchase p")
public class Purchase implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private long id;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date endperiod;

	private float price;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date startperiod;

	@Column(nullable=false)
	private Timestamp timestamp;

	//bi-directional many-to-many association to Optionalproduct
	@ManyToMany(cascade={CascadeType.PERSIST})
	@JoinTable(
		name="purchaseproduct"
		, joinColumns={
			@JoinColumn(name="purchase", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="optionalproduct", nullable=false)
			}
		)
	private List<Optionalproduct> optionalproducts;

	//bi-directional many-to-one association to Pack
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="pack")
	private Pack packBean;

	//bi-directional many-to-one association to User
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="user", referencedColumnName="username")
	private User userBean;

	//bi-directional one-to-one association to Purchasesalesreport
	@OneToOne(mappedBy="purchaseBean", cascade={CascadeType.PERSIST})
	private Purchasesalesreport purchasesalesreport;

	public Purchase() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getEndperiod() {
		return this.endperiod;
	}

	public void setEndperiod(Date endperiod) {
		this.endperiod = endperiod;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getStartperiod() {
		return this.startperiod;
	}

	public void setStartperiod(Date startperiod) {
		this.startperiod = startperiod;
	}

	public Timestamp getTimestamp() {
		return this.timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public List<Optionalproduct> getOptionalproducts() {
		return this.optionalproducts;
	}

	public void setOptionalproducts(List<Optionalproduct> optionalproducts) {
		this.optionalproducts = optionalproducts;
	}

	public Pack getPackBean() {
		return this.packBean;
	}

	public void setPackBean(Pack packBean) {
		this.packBean = packBean;
	}

	public User getUserBean() {
		return this.userBean;
	}

	public void setUserBean(User userBean) {
		this.userBean = userBean;
	}

	public Purchasesalesreport getPurchasesalesreport() {
		return this.purchasesalesreport;
	}

	public void setPurchasesalesreport(Purchasesalesreport purchasesalesreport) {
		this.purchasesalesreport = purchasesalesreport;
	}

}