package model;

import java.sql.Timestamp;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-05-02T16:30:23.659+0200")
@StaticMetamodel(Purchase.class)
public class Purchase_ {
	public static volatile SingularAttribute<Purchase, Long> id;
	public static volatile SingularAttribute<Purchase, Date> endperiod;
	public static volatile SingularAttribute<Purchase, Float> price;
	public static volatile SingularAttribute<Purchase, Date> startperiod;
	public static volatile SingularAttribute<Purchase, Timestamp> timestamp;
	public static volatile ListAttribute<Purchase, Optionalproduct> optionalproducts;
	public static volatile SingularAttribute<Purchase, Pack> packBean;
	public static volatile SingularAttribute<Purchase, User> userBean;
	public static volatile SingularAttribute<Purchase, Purchasesalesreport> purchasesalesreport;
}
