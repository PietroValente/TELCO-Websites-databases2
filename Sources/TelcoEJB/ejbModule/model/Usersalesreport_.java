package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T15:25:57.694+0200")
@StaticMetamodel(Usersalesreport.class)
public class Usersalesreport_ {
	public static volatile SingularAttribute<Usersalesreport, String> user;
	public static volatile SingularAttribute<Usersalesreport, Integer> rejectedpurchases;
	public static volatile SingularAttribute<Usersalesreport, Boolean> solvent;
	public static volatile SingularAttribute<Usersalesreport, User> userBean;
}
