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
- Follow the configuration instructions in the Configuration/SoftwareInstallationGuide.pdf file, in the Configuration folder you will find all the necessary files (JARs, Server, DB connector)
- Before running a WEB, go to Properties -> Web Deployment Assembly and enter the TelcoEJB folder
- Then Run As -> Run on Server and select the "Tomcat v9.0 Server at localhost" created

## Team
- Pietro Valente
- Andrea Seghetto
