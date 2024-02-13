# Hospital Management System
It uses XAMPP to create MySQL database.
install XAMPP and then inside xampp folder, go to htdocs folder and there create a new folder name assgn1.
To initiate the web page type followinn in your webpage:
```
http://localhost/assgn1/landing.html
```
To create database within xampp mysql admin,create following table
## Doctor
```mysql
CREATE TABLE Doctor (
    ssn VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    specialty VARCHAR(100),
    Years_exp INT,
    PRIMARY KEY (ssn)
);
```
## Patient
```mysql
CREATE TABLE Patient (
    ssn VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    address VARCHAR(100),
    Age INT,
    Pri_physician VARCHAR(100),
    PRIMARY KEY (ssn),
    FOREIGN KEY (Pri_physician) REFERENCES Doctor(ssn)
);
```
## Pharmaceutical_Company
```mysql
CREATE TABLE Pharmaceutical_Company (
    name VARCHAR(100) NOT NULL,
    Phone_number VARCHAR(100),
    PRIMARY KEY (name)
);
```
## Pharmacy
```mysql
CREATE TABLE Pharmacy (
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    Phone_number VARCHAR(100),
    PRIMARY KEY (name)
);
```
## Drug
```mysql
CREATE TABLE Drug (
    Trade_name VARCHAR(100) NOT NULL,
    formula VARCHAR(100),
    Company_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Trade_name, Company_name),
    FOREIGN KEY (Company_name) REFERENCES Pharmaceutical_Company(name)
);
```
## Prescribes
```mysql
CREATE TABLE Drug (
    Trade_name VARCHAR(100) NOT NULL,
    formula VARCHAR(100),
    Company_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Trade_name, Company_name),
    FOREIGN KEY (Company_name) REFERENCES Pharmaceutical_Company(name)
);
```
## sells
```mysql
CREATE TABLE Sells (
    drug_Trade_name VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    pharmacy_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    PRIMARY KEY (pharmacy_name,drug_Trade_name,name),
    FOREIGN KEY (drug_Trade_name,name) REFERENCES Drug(Trade_name,Company_name),
    FOREIGN KEY (pharmacy_name) REFERENCES Pharmacy(name)
);
```
## Contracts_with
```mysql
CREATE TABLE Contracts_with (
    pharmaceutical_company_name VARCHAR(100) NOT NULL,
    pharmacy_name VARCHAR(100) NOT NULL,
    Start_date DATE,
    end_date DATE,
    supervisor VARCHAR(100),
    text Text,
    PRIMARY KEY (pharmaceutical_company_name, pharmacy_name),
    FOREIGN KEY (pharmaceutical_company_name) REFERENCES Pharmaceutical_Company(name),
    FOREIGN KEY (pharmacy_name) REFERENCES Pharmacy(name)
);
```
## Users
```mysql
CREATE TABLE USERS(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_data VARCHAR(100) NOT NULL,
    role enum('Patient','Doctor','Pharmacist','Company') NOT NULL,
    PRIMARY KEY (id)
);
```
