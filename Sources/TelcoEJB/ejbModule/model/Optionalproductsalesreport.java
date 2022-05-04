package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the optionalproductsalesreport database table.
 * 
 */
@Entity
@Table(name="optionalproductsalesreport")
@NamedQuery(name="Optionalproductsalesreport.findAll", query="SELECT o FROM Optionalproductsalesreport o")
public class Optionalproductsalesreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, insertable=false, updatable=false)
	private long optionalproduct;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private int amountsold;

	//bi-directional one-to-one association to Optionalproduct
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="optionalproduct", nullable=false, insertable=false, updatable=false)
	private Optionalproduct optionalproductBean;

	public Optionalproductsalesreport() {
	}

	public long getOptionalproduct() {
		return this.optionalproduct;
	}

	public void setOptionalproduct(long optionalproduct) {
		this.optionalproduct = optionalproduct;
	}

	public int getAmountsold() {
		return this.amountsold;
	}

	public void setAmountsold(int amountsold) {
		this.amountsold = amountsold;
	}

	public Optionalproduct getOptionalproductBean() {
		return this.optionalproductBean;
	}

	public void setOptionalproductBean(Optionalproduct optionalproductBean) {
		this.optionalproductBean = optionalproductBean;
	}

}