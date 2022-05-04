package model;

import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.121+0200")
@StaticMetamodel(Alert.class)
public class Alert_ {
	public static volatile SingularAttribute<Alert, String> user;
	public static volatile SingularAttribute<Alert, Float> amount;
	public static volatile SingularAttribute<Alert, String> email;
	public static volatile SingularAttribute<Alert, Timestamp> timestamp;
	public static volatile SingularAttribute<Alert, User> userBean;
}
