package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-05-02T19:19:47.781+0200")
@StaticMetamodel(Packsalesreport.class)
public class Packsalesreport_ {
	public static volatile SingularAttribute<Packsalesreport, Long> pack;
	public static volatile SingularAttribute<Packsalesreport, Float> averageproduct;
	public static volatile SingularAttribute<Packsalesreport, Integer> purchasesnoop;
	public static volatile SingularAttribute<Packsalesreport, Integer> purchasesop;
	public static volatile SingularAttribute<Packsalesreport, Pack> packBean;
}
