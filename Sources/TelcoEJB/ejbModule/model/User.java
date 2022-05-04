package model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="user")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private String username;
	
	@Column(nullable=false, length=40)
	private String email;

	@Column(nullable=false, length=20)
	private String firstname;

	@Column(nullable=false, length=20)
	private String lastname;

	@Column(nullable=false, length=15)
	private String password;

	@Column(nullable=false, length=10)
	private String role;

	//bi-directional many-to-one association to Alert
	@OneToOne(mappedBy="userBean", cascade={CascadeType.PERSIST})
	private Alert alerts;

	//bi-directional many-to-one association to Purchase
	@OneToMany(mappedBy="userBean", cascade={CascadeType.PERSIST})
	private List<Purchase> purchases;

	//bi-directional many-to-one association to Session
	@OneToMany(mappedBy="userBean", cascade={CascadeType.PERSIST})
	private List<Session> sessions;

	//bi-directional one-to-one association to Usersalesreport
	@OneToOne(mappedBy="userBean", cascade={CascadeType.PERSIST})
	private Usersalesreport usersalesreport;
	
	//bi-directional many-to-one association to Purchasesalesreport
	@OneToMany(mappedBy="userBean", cascade={CascadeType.PERSIST})
	private List<Purchasesalesreport> purchasesalesreports;

	public User() {
	}
	
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Alert getAlerts() {
		return this.alerts;
	}

	public void setAlerts(Alert alerts) {
		this.alerts = alerts;
	}

	public List<Purchase> getPurchases() {
		return this.purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public Purchase addPurchas(Purchase purchas) {
		getPurchases().add(purchas);
		purchas.setUserBean(this);

		return purchas;
	}

	public Purchase removePurchas(Purchase purchas) {
		getPurchases().remove(purchas);
		purchas.setUserBean(null);

		return purchas;
	}

	public List<Session> getSessions() {
		return this.sessions;
	}

	public void setSessions(List<Session> sessions) {
		this.sessions = sessions;
	}

	public Session addSession(Session session) {
		getSessions().add(session);
		session.setUserBean(this);

		return session;
	}

	public Session removeSession(Session session) {
		getSessions().remove(session);
		session.setUserBean(null);

		return session;
	}

	public Usersalesreport getUsersalesreport() {
		return this.usersalesreport;
	}

	public void setUsersalesreport(Usersalesreport usersalesreport) {
		this.usersalesreport = usersalesreport;
	}
	
	public List<Purchasesalesreport> getPurchasesalesreports() {
		return this.purchasesalesreports;
	}

	public void setPurchasesalesreport(List<Purchasesalesreport> purchasesalesreports) {
		this.purchasesalesreports = purchasesalesreports;
	}

}