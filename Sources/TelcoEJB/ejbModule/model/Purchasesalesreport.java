package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the purchasesalesreport database table.
 * 
 */
@Entity
@Table(name="purchasesalesreport")
@NamedQuery(name="Purchasesalesreport.findAll", query="SELECT p FROM Purchasesalesreport p")
public class Purchasesalesreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private long purchase;

	private int optionalproduct;

	private int rejected;
	
	private float price;

	//bi-directional one-to-one association to Purchase
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="purchase", referencedColumnName="id")
	private Purchase purchaseBean;
	
	//bi-directional many-to-one association to User
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="user", referencedColumnName="username")
	private User userBean;

	//bi-directional many-to-one association to Pack
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="pack")
	private Pack packBean;

	public Purchasesalesreport() {
	}

	public long getPurchase() {
		return this.purchase;
	}

	public void setPurchase(long purchase) {
		this.purchase = purchase;
	}

	public int getOptionalproduct() {
		return this.optionalproduct;
	}

	public void setOptionalproduct(int optionalproduct) {
		this.optionalproduct = optionalproduct;
	}

	public int getRejected() {
		return this.rejected;
	}

	public void setRejected(int rejected) {
		this.rejected = rejected;
	}

	public Purchase getPurchaseBean() {
		return this.purchaseBean;
	}

	public void setPurchaseBean(Purchase purchaseBean) {
		this.purchaseBean = purchaseBean;
	}
	
	public User getUserBean() {
		return this.userBean;
	}

	public void setUser(User userBean) {
		this.userBean = userBean;
	}

	public Pack getPackBean() {
		return this.packBean;
	}

	public void setPackBean(Pack packBean) {
		this.packBean = packBean;
	}
	
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}