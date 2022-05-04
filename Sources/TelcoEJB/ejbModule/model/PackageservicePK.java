package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the packageservice database table.
 * 
 */
@Embeddable
public class PackageservicePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=true, updatable=true, unique=true, nullable=false)
	private long service;

	@Column(insertable=true, updatable=true, unique=true, nullable=false)
	private long pack;

	public PackageservicePK() {
	}
	public long getService() {
		return this.service;
	}
	public void setService(long service) {
		this.service = service;
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
		if (!(other instanceof PackageservicePK)) {
			return false;
		}
		PackageservicePK castOther = (PackageservicePK)other;
		return 
			(this.service == castOther.service)
			&& (this.pack == castOther.pack);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + ((int) (this.service ^ (this.service >>> 32)));
		hash = hash * prime + ((int) (this.pack ^ (this.pack >>> 32)));
		
		return hash;
	}
}