package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.153+0200")
@StaticMetamodel(Optionalproduct.class)
public class Optionalproduct_ {
	public static volatile SingularAttribute<Optionalproduct, Long> id;
	public static volatile SingularAttribute<Optionalproduct, Float> fee;
	public static volatile SingularAttribute<Optionalproduct, String> name;
	public static volatile ListAttribute<Optionalproduct, Pack> packs;
	public static volatile ListAttribute<Optionalproduct, Purchase> purchases;
	public static volatile SingularAttribute<Optionalproduct, Optionalproductsalesreport> optionalproductsalesreport;
}
