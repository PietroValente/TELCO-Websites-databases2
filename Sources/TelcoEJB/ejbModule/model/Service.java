package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the service database table.
 * 
 */
@Entity
@Table(name="service")
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
@NamedQuery(name="Service.findAllType", query = "SELECT s FROM Service s WHERE s.type = ?1")
public class Service implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private long id;

	private float extragiga;

	private float extraminute;

	private float extrasms;

	private int giga;

	private int min;

	@Column(nullable=false, length=30)
	private String name;

	private int sms;

	@Column(nullable=false, length=15)
	private String type;

	//bi-directional many-to-one association to Packageservice
	@OneToMany(mappedBy="serviceBean", cascade={CascadeType.PERSIST})
	private List<Packageservice> packageservices;

	public Service() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public float getExtragiga() {
		return this.extragiga;
	}

	public void setExtragiga(float extragiga) {
		this.extragiga = extragiga;
	}

	public float getExtraminute() {
		return this.extraminute;
	}

	public void setExtraminute(float extraminute) {
		this.extraminute = extraminute;
	}

	public float getExtrasms() {
		return this.extrasms;
	}

	public void setExtrasms(float extrasms) {
		this.extrasms = extrasms;
	}

	public int getGiga() {
		return this.giga;
	}

	public void setGiga(int giga) {
		this.giga = giga;
	}

	public int getMin() {
		return this.min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSms() {
		return this.sms;
	}

	public void setSms(int sms) {
		this.sms = sms;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Packageservice> getPackageservices() {
		return this.packageservices;
	}

	public void setPackageservices(List<Packageservice> packageservices) {
		this.packageservices = packageservices;
	}

	public Packageservice addPackageservice(Packageservice packageservice) {
		getPackageservices().add(packageservice);
		packageservice.setServiceBean(this);

		return packageservice;
	}

	public Packageservice removePackageservice(Packageservice packageservice) {
		getPackageservices().remove(packageservice);
		packageservice.setServiceBean(null);

		return packageservice;
	}

}