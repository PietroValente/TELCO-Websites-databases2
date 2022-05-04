package model;

import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2022-04-29T13:35:17.169+0200")
@StaticMetamodel(Session.class)
public class Session_ {
	public static volatile SingularAttribute<Session, Long> id;
	public static volatile SingularAttribute<Session, Timestamp> timestamp;
	public static volatile SingularAttribute<Session, User> userBean;
}
