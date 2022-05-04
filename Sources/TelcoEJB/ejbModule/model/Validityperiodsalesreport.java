package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the validityperiodsalesreport database table.
 * 
 */
@Entity
@Table(name="validityperiodsalesreport")
@NamedQuery(name="Validityperiodsalesreport.findAll", query="SELECT v FROM Validityperiodsalesreport v")
public class Validityperiodsalesreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ValidityperiodsalesreportPK id;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private int quantity;

	//bi-directional one-to-one association to Validityperiod
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumns({
		@JoinColumn(name="monthnumber", referencedColumnName="monthnumber", nullable=false, insertable=true, updatable=true),
		@JoinColumn(name="pack", referencedColumnName="pack", nullable=false, insertable=true, updatable=true)
		})
	private Validityperiod validityperiod;

	public Validityperiodsalesreport() {
	}

	public ValidityperiodsalesreportPK getId() {
		return this.id;
	}

	public void setId(ValidityperiodsalesreportPK id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Validityperiod getValidityperiod() {
		return this.validityperiod;
	}

	public void setValidityperiod(Validityperiod validityperiod) {
		this.validityperiod = validityperiod;
	}

}