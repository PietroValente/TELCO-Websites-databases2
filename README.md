# TELCO | ConsumerWEB - EmployeeWEB - EJB

<p align="center">
    <img src="https://i.imgur.com/mPb3Qbd.gif" width="180" alt="Politecnico di Milano"/>
</p>

## Overview

A telco company offers pre-paid online services to web users. Two client applications using the same database need to be developed:

- **TelcoEmployeeWEB:** allows the authorized employees of the telco company to create services, optional products and packages. Furthermore Sales Report page allows the employee to inspect the essential data about the sales and about the users over the entire lifespan of the application.

- **TelcoConsumerWEB:** allows customers to browse the site and view available packages. Through MyTELCO they can register or log in, which allows to purchase a package.

- **TelcoEJB:** allows the communication of the WEB sites with the database.

The architecture uses the Model-View-Controller (MVC) logical subdivision which involves the use of servlets in the WEB parts that interface with the bean (EJB side) to access the database.

The part concerning the EJB was entirely developed using the concepts of Java Persistence API (JPA), thanks to the tool EclipseLink that made this possible.

On database side, triggers have been implemented that automatically fill tables that hold sales data (which are shown in a TelcoEmployeeWEB section).

## TelcoEmployeeWEB

## TelcoConsumerWEB

## Compile and usability


## Team
- Pietro Valente
- Andrea Seghetto
