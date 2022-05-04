package model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the alert database table.
 * 
 */
@Entity
@Table(name="alert")
@NamedQuery(name="Alert.findAll", query="SELECT a FROM Alert a")
public class Alert implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, insertable=false, updatable=false, length=20)
	private String user;

	@Column(insertable=false, updatable=false, length=40)
	private float amount;

	@Column(nullable=false, insertable=false, updatable=false, length=40)
	private String email;

	@Column(nullable=false, insertable=false, updatable=false)
	private Timestamp timestamp;

	//bi-directional many-to-one association to User
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="user", referencedColumnName="username", nullable=false, insertable=false, updatable=false)
	private User userBean;

	public Alert() {
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public float getAmount() {
		return this.amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getTimestamp() {
		return this.timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public User getUserBean() {
		return this.userBean;
	}

	public void setUserBean(User userBean) {
		this.userBean = userBean;
	}

}