package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the optionalproduct database table.
 * 
 */
@Entity
@Table(name="optionalproduct")
@NamedQuery(name="Optionalproduct.findAll", query="SELECT o FROM Optionalproduct o")
public class Optionalproduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private long id;

	private float fee;

	@Column(nullable=false, length=20)
	private String name;

	//bi-directional many-to-many association to Pack
	@ManyToMany(mappedBy="optionalproducts", cascade={CascadeType.PERSIST})
	private List<Pack> packs;

	//bi-directional many-to-many association to Purchase
	@ManyToMany(mappedBy="optionalproducts", cascade={CascadeType.PERSIST})
	private List<Purchase> purchases;

	//bi-directional one-to-one association to Optionalproductsalesreport
	@OneToOne(mappedBy="optionalproductBean", cascade={CascadeType.PERSIST})
	private Optionalproductsalesreport optionalproductsalesreport;

	public Optionalproduct() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public float getFee() {
		return this.fee;
	}

	public void setFee(float fee) {
		this.fee = fee;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Pack> getPacks() {
		return this.packs;
	}

	public void setPacks(List<Pack> packs) {
		this.packs = packs;
	}

	public List<Purchase> getPurchases() {
		return this.purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public Optionalproductsalesreport getOptionalproductsalesreport() {
		return this.optionalproductsalesreport;
	}

	public void setOptionalproductsalesreport(Optionalproductsalesreport optionalproductsalesreport) {
		this.optionalproductsalesreport = optionalproductsalesreport;
	}

}