package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.167+0200")
@StaticMetamodel(Service.class)
public class Service_ {
	public static volatile SingularAttribute<Service, Long> id;
	public static volatile SingularAttribute<Service, Float> extragiga;
	public static volatile SingularAttribute<Service, Float> extraminute;
	public static volatile SingularAttribute<Service, Float> extrasms;
	public static volatile SingularAttribute<Service, Integer> giga;
	public static volatile SingularAttribute<Service, Integer> min;
	public static volatile SingularAttribute<Service, String> name;
	public static volatile SingularAttribute<Service, Integer> sms;
	public static volatile SingularAttribute<Service, String> type;
	public static volatile ListAttribute<Service, Packageservice> packageservices;
}
