package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-05-03T16:12:25.897+0200")
@StaticMetamodel(User.class)
public class User_ {
	public static volatile SingularAttribute<User, String> username;
	public static volatile SingularAttribute<User, String> email;
	public static volatile SingularAttribute<User, String> firstname;
	public static volatile SingularAttribute<User, String> lastname;
	public static volatile SingularAttribute<User, String> password;
	public static volatile SingularAttribute<User, String> role;
	public static volatile ListAttribute<User, Purchase> purchases;
	public static volatile ListAttribute<User, Session> sessions;
	public static volatile SingularAttribute<User, Usersalesreport> usersalesreport;
	public static volatile ListAttribute<User, Purchasesalesreport> purchasesalesreports;
	public static volatile SingularAttribute<User, Alert> alerts;
}
