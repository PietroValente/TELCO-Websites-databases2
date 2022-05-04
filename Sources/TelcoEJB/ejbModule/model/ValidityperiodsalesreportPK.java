package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the validityperiodsalesreport database table.
 * 
 */
@Embeddable
public class ValidityperiodsalesreportPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false, unique=true, nullable=false, length=2)
	private String monthnumber;

	@Column(insertable=false, updatable=false, unique=true, nullable=false)
	private long pack;

	public ValidityperiodsalesreportPK() {
	}
	public String getMonthnumber() {
		return this.monthnumber;
	}
	public void setMonthnumber(String monthnumber) {
		this.monthnumber = monthnumber;
	}
	public long getPack() {
		return this.pack;
	}
	public void setPack(long pack) {
		this.pack = pack;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof ValidityperiodsalesreportPK)) {
			return false;
		}
		ValidityperiodsalesreportPK castOther = (ValidityperiodsalesreportPK)other;
		return 
			this.monthnumber.equals(castOther.monthnumber)
			&& (this.pack == castOther.pack);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.monthnumber.hashCode();
		hash = hash * prime + ((int) (this.pack ^ (this.pack >>> 32)));
		
		return hash;
	}
}