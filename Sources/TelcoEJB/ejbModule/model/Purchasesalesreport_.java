package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-05-02T21:17:37.196+0200")
@StaticMetamodel(Purchasesalesreport.class)
public class Purchasesalesreport_ {
	public static volatile SingularAttribute<Purchasesalesreport, Long> purchase;
	public static volatile SingularAttribute<Purchasesalesreport, Integer> optionalproduct;
	public static volatile SingularAttribute<Purchasesalesreport, Integer> rejected;
	public static volatile SingularAttribute<Purchasesalesreport, Float> price;
	public static volatile SingularAttribute<Purchasesalesreport, Purchase> purchaseBean;
	public static volatile SingularAttribute<Purchasesalesreport, User> userBean;
	public static volatile SingularAttribute<Purchasesalesreport, Pack> packBean;
}
