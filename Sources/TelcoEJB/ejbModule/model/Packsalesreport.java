package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the packsalesreport database table.
 * 
 */
@Entity
@Table(name="packsalesreport")
@NamedQuery(name="Packsalesreport.findAll", query="SELECT p FROM Packsalesreport p")
public class Packsalesreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, insertable=false, updatable=false)
	private long pack;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private float averageproduct;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private int purchasesnoop;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private int purchasesop;

	//bi-directional one-to-one association to Pack
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="pack", nullable=false, insertable=false, updatable=false)
	private Pack packBean;

	public Packsalesreport() {
	}

	public long getPack() {
		return this.pack;
	}

	public void setPack(long pack) {
		this.pack = pack;
	}

	public float getAverageproduct() {
		return this.averageproduct;
	}

	public void setAverageproduct(float averageproduct) {
		this.averageproduct = averageproduct;
	}

	public int getPurchasesnoop() {
		return this.purchasesnoop;
	}

	public void setPurchasesnoop(int purchasesnoop) {
		this.purchasesnoop = purchasesnoop;
	}

	public int getPurchasesop() {
		return this.purchasesop;
	}

	public void setPurchasesop(int purchasesop) {
		this.purchasesop = purchasesop;
	}

	public Pack getPackBean() {
		return this.packBean;
	}

	public void setPackBean(Pack packBean) {
		this.packBean = packBean;
	}

}