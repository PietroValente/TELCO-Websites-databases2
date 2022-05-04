package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-30T16:41:12.377+0200")
@StaticMetamodel(Pack.class)
public class Pack_ {
	public static volatile SingularAttribute<Pack, Long> id;
	public static volatile SingularAttribute<Pack, String> feature1;
	public static volatile SingularAttribute<Pack, String> feature2;
	public static volatile SingularAttribute<Pack, String> feature3;
	public static volatile SingularAttribute<Pack, String> name;
	public static volatile ListAttribute<Pack, Optionalproduct> optionalproducts;
	public static volatile ListAttribute<Pack, Packageservice> packageservices;
	public static volatile ListAttribute<Pack, Purchase> purchases;
	public static volatile ListAttribute<Pack, Purchasesalesreport> purchasesalesreports;
	public static volatile ListAttribute<Pack, Validityperiod> validityperiods;
	public static volatile SingularAttribute<Pack, Packsalesreport> packsalesreport;
	public static volatile ListAttribute<Pack, Service> services;
}
