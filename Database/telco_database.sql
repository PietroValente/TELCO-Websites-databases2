CREATE DATABASE TELCO;
USE TELCO;
CREATE TABLE user(
	username VARCHAR (20) PRIMARY KEY,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	password VARCHAR(15) NOT NULL,
	email VARCHAR(40) UNIQUE NOT NULL,
	role ENUM('consumer', 'employee') NOT NULL);

CREATE TABLE session(
	id SERIAL PRIMARY KEY, 
	timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
	user VARCHAR(20) NOT NULL,
	FOREIGN KEY (user) REFERENCES user(username)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE pack(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	feature1 VARCHAR(30),
	feature2 VARCHAR(30),
	feature3 VARCHAR(30));

CREATE TABLE service(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	type ENUM('fixedphone', 'mobilephone', 'fixedinternet', 'mobileinternet') NOT NULL,
	giga INT CHECK (giga >= -1) COMMENT 'giga = -1 unlimited',	
	sms INT CHECK (sms >= -1) COMMENT 'sms = -1 unlimited',
	min INT CHECK (min >= -1) COMMENT 'min = -1 unlimited',
	extragiga FLOAT CHECK (extragiga >= 0) COMMENT 'fee for each extra giga used',
	extrasms FLOAT CHECK (extrasms >= 0) COMMENT 'fee for each extra sms used',
	extraminute FLOAT CHECK (extraminute >= 0) COMMENT 'fee for each extra min used');

CREATE TABLE optionalproduct(
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL,
	fee FLOAT CHECK (fee >= 0) COMMENT 'fee=0 means gratis');

CREATE TABLE packageservice(
	service BIGINT UNSIGNED,
	pack BIGINT UNSIGNED,
	quantity INT CHECK (quantity > 0),
	PRIMARY KEY(service, pack),
	FOREIGN KEY (service) REFERENCES service(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE packageproduct(
	optionalproduct BIGINT UNSIGNED,
	pack BIGINT UNSIGNED,
	PRIMARY KEY(optionalproduct, pack),
	FOREIGN KEY (optionalproduct) REFERENCES optionalproduct(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE purchase(
	id SERIAL PRIMARY KEY,
	price FLOAT CHECK (price>0),
	timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
	startperiod DATE NOT NULL,
	endperiod DATE NOT NULL,
	user VARCHAR(20),
	pack BIGINT UNSIGNED,
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (user) REFERENCES user(username)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE purchaseproduct(
	purchase BIGINT UNSIGNED,
	optionalproduct BIGINT UNSIGNED,
	PRIMARY KEY(optionalproduct, purchase),
	FOREIGN KEY (optionalproduct) REFERENCES optionalproduct(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (purchase) REFERENCES purchase(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE validityperiod(
	monthnumber ENUM('12', '24', '36'),
	pack BIGINT UNSIGNED,
	fee FLOAT CHECK (fee > 0),
	PRIMARY KEY(monthnumber, pack),
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);
	
CREATE TABLE alert(
	user VARCHAR(20) PRIMARY KEY,
	email VARCHAR(40) UNIQUE NOT NULL,
	amount FLOAT CHECK (amount > 0),
	timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
	FOREIGN KEY (user) REFERENCES user(username)
	ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (email) REFERENCES user(email)
	ON DELETE NO ACTION ON UPDATE CASCADE);
	
CREATE TABLE userSalesReport(
	user VARCHAR (20) PRIMARY KEY,	
	rejectedpurchases INT CHECK (rejectedpurchases >= 0),
	solvent BOOL NOT NULL,
	FOREIGN KEY (user) REFERENCES user(username)
	ON DELETE CASCADE ON UPDATE NO ACTION);

CREATE TABLE packSalesReport(
	pack BIGINT UNSIGNED PRIMARY KEY,
	purchasesop INT CHECK (purchasesop >=0),
	purchasesnoop INT CHECK (purchasesnoop >=0),
	averageproduct FLOAT CHECK (averageproduct >=0),
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE optionalproductSalesReport(
	optionalproduct BIGINT UNSIGNED PRIMARY KEY,
	amountsold INT NOT NULL CHECK (amountsold >= 0),
	FOREIGN KEY (optionalproduct) REFERENCES optionalproduct(id)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE purchaseSalesReport(
	purchase BIGINT UNSIGNED PRIMARY KEY,
	rejected INT CHECK (rejected >= 0),
	optionalproduct INT CHECK (optionalproduct >= 0),
	price FLOAT CHECK (price>0),
	user VARCHAR(20),
	pack BIGINT UNSIGNED,
	FOREIGN KEY (purchase) REFERENCES purchase(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (pack) REFERENCES pack(id)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (user) REFERENCES user(username)
	ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE validityperiodSalesReport(
	monthnumber ENUM('12', '24', '36'),
	pack BIGINT UNSIGNED,
	quantity INT,
	PRIMARY KEY(monthnumber, pack),
	FOREIGN KEY (monthnumber, pack) REFERENCES validityperiod(monthnumber,pack)
	ON DELETE NO ACTION ON UPDATE CASCADE);