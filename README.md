# TELCO | ConsumerWEB - EmployeeWEB - EJB

<p align="center">
    <img src="https://i.imgur.com/mPb3Qbd.gif" width="180" alt="Politecnico di Milano"/>
</p>

## Overview

A telco company offers pre-paid online services to web users. Two client applications using the same database need to be developed:

- **TelcoEmployeeWEB:** allows the authorized employees of the telco company to create services, optional products and packages. Furthermore Sales Report page allows the employee to inspect the essential data about the sales and about the users over the entire lifespan of the application.

- **TelcoConsumerWEB:** allows customers to browse the site and view available packages. Through MyTELCO they can register or log in, which allows to purchase a package. The payment phase can be successful or not, if it were not the user is flagged as insolvent and displays the orders that have not been successful in the home (where he can buy them back). Otherwise the purchase can be viewed in the Purchased Orders section.

- **TelcoEJB:** allows the communication of the WEB sites with the database.

The architecture uses the Model-View-Controller (MVC) logical subdivision which involves the use of servlets in the WEB parts that interface with the bean (EJB side) to access the database.

The part concerning the EJB was entirely developed using the concepts of Java Persistence API (JPA), thanks to the tool EclipseLink that made this possible.

On database side, triggers have been implemented that automatically fill tables that hold sales data (which are shown in a TelcoEmployeeWEB section).

## TelcoEmployeeWEB
<p align="center">
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/EmployeeHomepage.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/EmployeeHomepage.png" alt="" width="40%"></a>
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/EmployeeSalesReport.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/EmployeeSalesReport.png" alt="" width="40%"></a></p>

## TelcoConsumerWEB
<p align="center">
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerHomepage.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerHomepage.png" alt="" width="40%"></a>
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerPurchasedOrders.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerPurchasedOrders.png" alt="" width="40%"></a></p>
 <br>
 <p align="center">
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerDetailPackage1.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerDetailPackage1.png" alt="" width="40%"></a>
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
 <a href="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerDetailPackage2.png"><img src="https://github.com/pietrovalente/TELCO-Websites-databases2/blob/main/Images/ConsumerDetailPackage2.png" alt="" width="40%"></a></p>

## Usability
- Download Eclipse
- Import TelcoEmployeeWEB, TelcoConsumerWEB and TelcoEJB into Eclipse
- Follow the configuration instructions in "Detailed configuration specifications", in the Configuration folder you will find all the necessary files apart from the server folder that you need to download from the site (https://tomee.apache.org/download-archive.html). It is important that is version 8.0.9. (if you have problems, in Configuration/SoftwareInstallationGuide.pdf file you can find a more detailed explanation of some procedures)
- Before running a WEB, go to Properties -> Web Deployment Assembly and enter the TelcoEJB folder (Only one WEB at a time can have this property, otherwise the server gives an error)
- Every time you want to change the web application you have to delete the server and recreate it as explained in the next section
- Then Run As -> Run on Server and select the "Tomcat v9.0 Server at localhost" created

## Detailed configuration specifications
- MySQL Workbench (File -> Open SQL Script...):
    - Import telco_database.sql and run it
    - Import telco_initial_population.sql and run it
    - Import telco_triggers.sql and run it

- Server:
    - Download apache-tomee-plume-8.0.9
    - Open Eclipse -> Define a New Server -> Apache -> Tomcat v9.0 Server -> Select "apache-tomee-plume-8.0.9" folder downloaded
    - Project Explorer -> Servers -> Tomcat v9.0 Server at localhost-config -> copy here the tomee.xml file (you can find it in my Configuration folder)

- Before adding the JARs, delete the ones marked in red in Properties -> Java Build Path

- JARs for WEB application (Properties -> Java Build Path -> Add external JARs):
    - javaee-api-8.0-5-tomcat.jar (apache-tomee-plume-8.0.9/lib)
    - servlet-api.jar (apache-tomee-plume-8.0.9/lib)
 
- JARs for EJB application (Properties -> Java Build Path -> Add external JARs):
    - all .jar present in TelcoEJB/ejbModule/META-INF/lib
    - eclipselink.jar (Configuration/eclipselink/jlib)
    - javaee-api-8.0-5-tomcat.jar (apache-tomee-plume-8.0.9/lib)
    - Add Library -> User Library -> User Libraries -> New -> Call it: EclipseLink 2.7.9 -> import Configuration/eclipselink/jlib/eclipselink.jar and all Configuration/eclipselink/jlib/jpa/* .jar

- Connect telco database to Eclipse (only after EclipseLink 2.7.9 library is installed, as shown in the previous point):
    - JPA -> Add connection -> Connection Profile Types: MySQL
    
        Database: telco <br>
        URL: jdbc:mysql://localhost:3306/database <br>
        Username: your username <br>
        Password: your password
        
    - Finish (If you have any problems, in particular with the driver setup, look in the appropriate section in the Configuration/SoftwareInstallationGuide.pdf file)

## Team
- Pietro Valente
- Andrea Seghetto
