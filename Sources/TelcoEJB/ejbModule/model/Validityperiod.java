package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the validityperiod database table.
 * 
 */
@Entity
@Table(name="validityperiod")
@NamedQuery(name="Validityperiod.findAll", query="SELECT v FROM Validityperiod v")
public class Validityperiod implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ValidityperiodPK id;

	private float fee;

	//bi-directional many-to-one association to Pack
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="pack", nullable=false, insertable=true, updatable=true)
	private Pack packBean;

	//bi-directional one-to-one association to Validityperiodsalesreport
	@OneToOne(mappedBy="validityperiod", cascade={CascadeType.PERSIST})
	private Validityperiodsalesreport validityperiodsalesreport;

	public Validityperiod() {
	}

	public ValidityperiodPK getId() {
		return this.id;
	}

	public void setId(ValidityperiodPK id) {
		this.id = id;
	}

	public float getFee() {
		return this.fee;
	}

	public void setFee(float fee) {
		this.fee = fee;
	}

	public Pack getPackBean() {
		return this.packBean;
	}

	public void setPackBean(Pack packBean) {
		this.packBean = packBean;
	}

	public Validityperiodsalesreport getValidityperiodsalesreport() {
		return this.validityperiodsalesreport;
	}

	public void setValidityperiodsalesreport(Validityperiodsalesreport validityperiodsalesreport) {
		this.validityperiodsalesreport = validityperiodsalesreport;
	}

}