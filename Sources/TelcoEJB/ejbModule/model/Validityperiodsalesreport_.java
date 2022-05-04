package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.175+0200")
@StaticMetamodel(Validityperiodsalesreport.class)
public class Validityperiodsalesreport_ {
	public static volatile SingularAttribute<Validityperiodsalesreport, ValidityperiodsalesreportPK> id;
	public static volatile SingularAttribute<Validityperiodsalesreport, Integer> quantity;
	public static volatile SingularAttribute<Validityperiodsalesreport, Validityperiod> validityperiod;
}
