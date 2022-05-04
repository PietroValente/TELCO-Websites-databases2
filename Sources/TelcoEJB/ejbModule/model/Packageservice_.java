package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.159+0200")
@StaticMetamodel(Packageservice.class)
public class Packageservice_ {
	public static volatile SingularAttribute<Packageservice, PackageservicePK> id;
	public static volatile SingularAttribute<Packageservice, Integer> quantity;
	public static volatile SingularAttribute<Packageservice, Pack> packBean;
	public static volatile SingularAttribute<Packageservice, Service> serviceBean;
}
