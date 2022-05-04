package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the packageservice database table.
 * 
 */
@Entity
@Table(name="packageservice")
@NamedQuery(name="Packageservice.findAll", query="SELECT p FROM Packageservice p")
public class Packageservice implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private PackageservicePK id;

	private int quantity;

	//bi-directional many-to-one association to Pack
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="pack", nullable=false, insertable=true, updatable=true)
	private Pack packBean;

	//bi-directional many-to-one association to Service
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="service", nullable=false, insertable=true, updatable=true)
	private Service serviceBean;

	public Packageservice() {
	}

	public PackageservicePK getId() {
		return this.id;
	}

	public void setId(PackageservicePK id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Pack getPackBean() {
		return this.packBean;
	}

	public void setPackBean(Pack packBean) {
		this.packBean = packBean;
	}

	public Service getServiceBean() {
		return this.serviceBean;
	}

	public void setServiceBean(Service serviceBean) {
		this.serviceBean = serviceBean;
	}

}