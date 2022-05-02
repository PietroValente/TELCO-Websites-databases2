/*USER*/

INSERT INTO telco.user VALUES ('pietroC','Pietro','Valente','1234','pietro.valente@mail.polimi.it','consumer');
INSERT INTO telco.user VALUES ('pietroE','Pietro','Valente','1234','pietro1.valente@mail.polimi.it','employee');
INSERT INTO telco.user VALUES ('andreaC','Andrea','Seghetto','1234','andrea.seghetto@mail.polimi.it','consumer');
INSERT INTO telco.user VALUES ('andreaE','Andrea','Seghetto','1234','andrea1.seghetto@mail.polimi.it','employee');

INSERT INTO telco.usersalesreport VALUES ('pietroC',0,true);
INSERT INTO telco.usersalesreport VALUES ('pietroE',0,true);
INSERT INTO telco.usersalesreport VALUES ('andreaC',0,true);
INSERT INTO telco.usersalesreport VALUES ('andreaE',0,true);

/*OPTIONAL PRODUCT*/

INSERT INTO telco.optionalproduct (name,fee) VALUES ('NETFLIX',12.99);
INSERT INTO telco.optionalproduct (name,fee) VALUES ('SPOTIFY',10.99);
INSERT INTO telco.optionalproduct (name,fee) VALUES ('SKY',29.99);
INSERT INTO telco.optionalproduct (name,fee) VALUES ('INFINITY',7.99);
INSERT INTO telco.optionalproduct (name,fee) VALUES ('NBA TV',9.99);
INSERT INTO telco.optionalproduct (name,fee) VALUES ('APPLE TV',19.99);

INSERT INTO telco.optionalproductsalesreport VALUES (1,0);
INSERT INTO telco.optionalproductsalesreport VALUES (2,0);
INSERT INTO telco.optionalproductsalesreport VALUES (3,0);
INSERT INTO telco.optionalproductsalesreport VALUES (4,0);
INSERT INTO telco.optionalproductsalesreport VALUES (5,0);
INSERT INTO telco.optionalproductsalesreport VALUES (6,0);

/*SERVICE FIXED PHONE*/

INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('FIXED PHONE DEFAULT','fixedphone',0,0,-1,0,0,0);

/*SERVICE FIXED INTERNET*/

INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('FIXED INTERNET DEFAULT','fixedinternet',0,0,0,1.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('FIXED INTERNET 100 GIGA','fixedinternet',100,0,0,3.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('FIXED INTERNET 200 GIGA','fixedinternet',200,0,0,3.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('FIXED INTERNET UNLIMITED','fixedinternet',-1,0,0,0,0,0);

/*SERVICE MOBILE INTERNET*/

INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE INTERNET DEFAULT','mobileinternet',0,0,0,0.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE INTERNET 50 GIGA','mobileinternet',50,0,0,0.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE INTERNET 100 GIGA','mobileinternet',100,0,0,0.99,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE INTERNET UNLIMITED','mobileinternet',-1,0,0,0,0,0);

/*SERVICE MOBILE PHONE*/

INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE PHONE DEFAULT','mobilephone',0,0,0,0,0.99,0.99);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE PHONE UNLIMITED','mobilephone',0,-1,-1,0,0,0);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE PHONE 100','mobilephone',0,100,100,0,0.99,0.99);
INSERT INTO telco.service (name,type,giga,sms,min,extragiga,extrasms,extraminute) VALUES ('MOBILE PHONE 1000','mobilephone',0,1000,1000,0,0.99,0.99);

/*PACK*/

INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO YOUNG MOBILE','1000 min/sms','100 giga','Under 26 years');
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO BUSINESS MOBILE','All inclusive','Only mobile',NULL);
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO FAMILY','1 fixed phone','1 fixed internet','3 mobile');
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO HOME','1 fixed phone','1 fixed internet',NULL);
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO OFF-SITE STUDENT','1 fixed internet','1 mobile', NULL);
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO OFFICE','3 fixed phone','3 fixed internet','20 mobile');
INSERT INTO telco.pack (name,feature1,feature2,feature3) VALUES ('TELCO UNIVERSITY','7 fixed phone','7 fixed internet','100 mobile');

INSERT INTO telco.packsalesreport VALUES (1,0,0,0);
INSERT INTO telco.packsalesreport VALUES (2,0,0,0);
INSERT INTO telco.packsalesreport VALUES (3,0,0,0);
INSERT INTO telco.packsalesreport VALUES (4,0,0,0);
INSERT INTO telco.packsalesreport VALUES (5,0,0,0);
INSERT INTO telco.packsalesreport VALUES (6,0,0,0);
INSERT INTO telco.packsalesreport VALUES (7,0,0,0);

/*VALIDITY PERIOD*/

INSERT INTO telco.validityperiod VALUES ('12',1,12.99);
INSERT INTO telco.validityperiod VALUES ('24',1,11.99);
INSERT INTO telco.validityperiod VALUES ('36',1,9.99);
INSERT INTO telco.validityperiod VALUES ('12',2,15.99);
INSERT INTO telco.validityperiod VALUES ('24',2,14.99);
INSERT INTO telco.validityperiod VALUES ('36',2,12.99);
INSERT INTO telco.validityperiod VALUES ('12',3,29.99);
INSERT INTO telco.validityperiod VALUES ('24',3,27.99);
INSERT INTO telco.validityperiod VALUES ('36',3,25.99);
INSERT INTO telco.validityperiod VALUES ('12',4,20.99);
INSERT INTO telco.validityperiod VALUES ('24',4,17.99);
INSERT INTO telco.validityperiod VALUES ('36',4,15.99);
INSERT INTO telco.validityperiod VALUES ('12',5,23.99);
INSERT INTO telco.validityperiod VALUES ('24',5,20.99);
INSERT INTO telco.validityperiod VALUES ('36',5,18.99);
INSERT INTO telco.validityperiod VALUES ('12',6,99.99);
INSERT INTO telco.validityperiod VALUES ('24',6,89.99);
INSERT INTO telco.validityperiod VALUES ('36',6,79.99);
INSERT INTO telco.validityperiod VALUES ('12',7,299.99);
INSERT INTO telco.validityperiod VALUES ('24',7,279.99);
INSERT INTO telco.validityperiod VALUES ('36',7,249.99);

INSERT INTO telco.validityperiodsalesreport VALUES ('12',1,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',1,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',1,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',2,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',2,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',2,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',3,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',3,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',3,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',4,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',4,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',4,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',5,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',5,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',5,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',6,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',6,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',6,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('12',7,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('24',7,0);
INSERT INTO telco.validityperiodsalesreport VALUES ('36',7,0);

/*PACKAGE OPTIONAL PRODUCT*/

INSERT INTO telco.packageproduct VALUES (1,1);
INSERT INTO telco.packageproduct VALUES (2,1);
INSERT INTO telco.packageproduct VALUES (5,1);
INSERT INTO telco.packageproduct VALUES (6,1);
INSERT INTO telco.packageproduct VALUES (1,2);
INSERT INTO telco.packageproduct VALUES (2,2);
INSERT INTO telco.packageproduct VALUES (5,2);
INSERT INTO telco.packageproduct VALUES (6,2);
INSERT INTO telco.packageproduct VALUES (1,3);
INSERT INTO telco.packageproduct VALUES (2,3);
INSERT INTO telco.packageproduct VALUES (3,3);
INSERT INTO telco.packageproduct VALUES (4,3);
INSERT INTO telco.packageproduct VALUES (5,3);
INSERT INTO telco.packageproduct VALUES (6,3);
INSERT INTO telco.packageproduct VALUES (1,4);
INSERT INTO telco.packageproduct VALUES (2,4);
INSERT INTO telco.packageproduct VALUES (3,4);
INSERT INTO telco.packageproduct VALUES (4,4);
INSERT INTO telco.packageproduct VALUES (5,4);
INSERT INTO telco.packageproduct VALUES (6,4);
INSERT INTO telco.packageproduct VALUES (1,5);
INSERT INTO telco.packageproduct VALUES (2,5);
INSERT INTO telco.packageproduct VALUES (3,5);
INSERT INTO telco.packageproduct VALUES (4,5);
INSERT INTO telco.packageproduct VALUES (5,5);
INSERT INTO telco.packageproduct VALUES (6,5);
INSERT INTO telco.packageproduct VALUES (2,6);
INSERT INTO telco.packageproduct VALUES (3,6);
INSERT INTO telco.packageproduct VALUES (2,7);
INSERT INTO telco.packageproduct VALUES (3,7);

/*PACKAGE SERVICE*/

INSERT INTO telco.packageservice VALUES (13,1,1);
INSERT INTO telco.packageservice VALUES (8,1,1);
INSERT INTO telco.packageservice VALUES (9,2,1);
INSERT INTO telco.packageservice VALUES (11,2,1);
INSERT INTO telco.packageservice VALUES (1,3,1);
INSERT INTO telco.packageservice VALUES (4,3,1);
INSERT INTO telco.packageservice VALUES (6,3,3);
INSERT INTO telco.packageservice VALUES (13,3,2);
INSERT INTO telco.packageservice VALUES (11,3,2);
INSERT INTO telco.packageservice VALUES (1,4,1);
INSERT INTO telco.packageservice VALUES (5,4,1);
INSERT INTO telco.packageservice VALUES (5,5,1);
INSERT INTO telco.packageservice VALUES (7,5,1);
INSERT INTO telco.packageservice VALUES (12,5,1);
INSERT INTO telco.packageservice VALUES (1,6,3);
INSERT INTO telco.packageservice VALUES (3,6,1);
INSERT INTO telco.packageservice VALUES (4,6,1);
INSERT INTO telco.packageservice VALUES (5,6,1);
INSERT INTO telco.packageservice VALUES (11,6,5);
INSERT INTO telco.packageservice VALUES (12,6,5);
INSERT INTO telco.packageservice VALUES (13,6,10);
INSERT INTO telco.packageservice VALUES (1,7,7);
INSERT INTO telco.packageservice VALUES (3,7,2);
INSERT INTO telco.packageservice VALUES (4,7,3);
INSERT INTO telco.packageservice VALUES (5,7,2);
INSERT INTO telco.packageservice VALUES (11,7,50);
INSERT INTO telco.packageservice VALUES (12,7,15);
INSERT INTO telco.packageservice VALUES (13,7,35);