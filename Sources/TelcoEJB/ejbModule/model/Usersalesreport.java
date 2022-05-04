package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the usersalesreport database table.
 * 
 */
@Entity
@Table(name="usersalesreport")
@NamedQuery(name="Usersalesreport.findAll", query="SELECT u FROM Usersalesreport u")
public class Usersalesreport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, insertable=false, updatable=false, length=20)
	private String user;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private int rejectedpurchases;

	@Column(unique=false, nullable=false, insertable=false, updatable=false)
	private boolean solvent;

	//bi-directional one-to-one association to User
	@OneToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="user", referencedColumnName="username", nullable=false, insertable=false, updatable=false)
	private User userBean;

	public Usersalesreport() {
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getRejectedpurchases() {
		return this.rejectedpurchases;
	}

	public void setRejectedpurchases(int rejectedpurchases) {
		this.rejectedpurchases = rejectedpurchases;
	}

	public boolean getSolvent() {
		return this.solvent;
	}

	public void setSolvent(boolean solvent) {
		this.solvent = solvent;
	}

	public User getUserBean() {
		return this.userBean;
	}

	public void setUserBean(User userBean) {
		this.userBean = userBean;
	}

}