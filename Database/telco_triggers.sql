USE TELCO;

/*CORRESPONDENCE INSERTION IN THE SALES REPORT TABLES WHEN INSERTING IN THE ORIGINAL TABLES*/

delimiter |
CREATE TRIGGER insert_userSalesReport
AFTER INSERT ON user 
FOR EACH ROW
BEGIN
	INSERT INTO userSalesReport(user, rejectedpurchases, solvent) 
	VALUES(NEW.username, 0, true);
END;
| delimiter ;

delimiter |
CREATE TRIGGER insert_packSalesReport
AFTER INSERT ON pack 
FOR EACH ROW
BEGIN
	INSERT INTO packSalesReport(pack, purchasesop, purchasesnoop, averageproduct) 
	VALUES(NEW.id, 0, 0, 0);
END;
| delimiter ;

delimiter |
CREATE TRIGGER insert_optionalproductSalesReport
AFTER INSERT ON optionalproduct
FOR EACH ROW
BEGIN
	INSERT INTO optionalproductSalesReport(optionalproduct, amountsold) 
	VALUES(NEW.id, 0);
END;
| delimiter ;

delimiter |
CREATE TRIGGER insert_validityperiodSalesReport
AFTER INSERT ON validityperiod
FOR EACH ROW
BEGIN
	INSERT INTO validityperiodSalesReport(monthnumber, pack, quantity) 
	VALUES(NEW.monthnumber, NEW.pack, 0);
END;
| delimiter ;

/*PACKAGE PURCHASE MANAGEMENT WITH OPTIONAL PRODUCT AND WITHOUT*/

delimiter |
CREATE TRIGGER number_of_purchasesnoop
AFTER INSERT ON purchase
FOR EACH ROW
BEGIN
	UPDATE validityperiodSalesReport
	SET quantity = quantity+1
	WHERE CAST(CAST(monthnumber AS CHAR) AS SIGNED) = TIMESTAMPDIFF(MONTH, NEW.startperiod, NEW.endperiod) AND pack = NEW.pack;
	UPDATE packSalesReport
	SET purchasesnoop = purchasesnoop+1
	WHERE pack = NEW.pack;
END;
| delimiter ;

delimiter |
CREATE TRIGGER number_of_purchasesop
AFTER INSERT ON purchaseproduct
FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM purchaseproduct WHERE purchase = NEW.purchase) = 1 THEN
    UPDATE packSalesReport
	SET purchasesop = purchasesop+1, purchasesnoop = purchasesnoop-1
	WHERE pack = (SELECT pack FROM purchase WHERE id = NEW.purchase);		
	END IF;
END;
| delimiter ;

/*MANAGEMENT REJECTED PURCHASES*/
 
delimiter |
CREATE TRIGGER insert_rejectedpurchase
AFTER INSERT ON purchaseSalesReport
FOR EACH ROW
IF NEW.rejected > 0 THEN
BEGIN
	UPDATE userSalesReport
	SET solvent = false, rejectedpurchases = rejectedpurchases + 1 
	WHERE user = NEW.user;
END;
END IF;
| delimiter ;

delimiter |
CREATE TRIGGER update_rejectedpurchase
AFTER UPDATE ON purchaseSalesReport
FOR EACH ROW
IF NEW.rejected > OLD.rejected THEN
BEGIN
	UPDATE userSalesReport
	SET rejectedpurchases = rejectedpurchases + NEW.rejected - OLD.rejected
	WHERE user = NEW.user;
END;
END IF;
| delimiter ;

/*MANAGEMENT ACCEPTED PURCHASES*/

delimiter |
CREATE TRIGGER accepted_purchase
AFTER UPDATE ON purchaseSalesReport 
FOR EACH ROW
IF NEW.rejected = 0 AND OLD.rejected > 0 AND (SELECT COUNT(*) FROM purchaseSalesReport WHERE rejected != 0 AND user = NEW.user) = 0 THEN
BEGIN
	UPDATE userSalesReport
	SET solvent = true
	WHERE user = NEW.user;
END;
END IF;
| delimiter ;

/*MANAGEMENT AMOUNT SOLD OPTIONAL PRODUCTS*/

delimiter |
CREATE TRIGGER amountsold
AFTER INSERT ON purchaseproduct 
FOR EACH ROW
BEGIN
	UPDATE optionalproductSalesReport
	SET amountsold = amountsold+1
	WHERE optionalproduct = NEW.optionalproduct;
END;
|
delimiter ;

/*MANAGEMENT ALERT*/

delimiter |
CREATE TRIGGER create_alert
AFTER UPDATE ON userSalesReport 
FOR EACH ROW
IF NEW.rejectedpurchases % 3 = 0 AND NEW.rejectedpurchases != 0 THEN
BEGIN
	DECLARE alert_price integer;
	DECLARE user_email varchar(40);
	SELECT SUM(price) FROM purchasesalesreport WHERE user = NEW.user AND rejected > 0 INTO alert_price;  
	SELECT email FROM user WHERE username = NEW.user INTO user_email;
    IF (SELECT COUNT(*) FROM alert WHERE user = NEW.user) = 0 THEN
	INSERT INTO alert(user, email, amount) 
	VALUES(NEW.user, user_email, alert_price);
    ELSE 
    UPDATE alert 
    SET timestamp = now(), amount = alert_price
    WHERE user = NEW.user;
    END IF;
END;
END IF;
|
delimiter ;

/*MANAGEMENT AVERAGE PRODUCTS*/

delimiter |
CREATE TRIGGER average_products
AFTER INSERT ON purchaseSalesReport
FOR EACH ROW
BEGIN
	DECLARE total_pack integer;
	DECLARE total_product integer;
	SELECT COUNT(*) FROM purchase WHERE pack = NEW.pack INTO total_pack;  
	SELECT SUM(optionalproduct) FROM purchaseSalesReport WHERE pack = NEW.pack  INTO total_product;	
	UPDATE packSalesReport
	SET averageproduct = total_product/total_pack
	WHERE pack = NEW.pack;
END;
| delimiter ;