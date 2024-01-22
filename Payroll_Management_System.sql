			-- Creating the database
DROP DATABASE IF EXISTS Payroll_management_system;
CREATE DATABASE Payroll_management_system;

			-- use database
USE `Payroll_management_system`;

			-- Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee ( 
    EmpID INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL
);

			-- Add gender column to employee table 
ALTER TABLE Employee ADD column Gender VARCHAR(50) NOT NULL;

			-- Department table
DROP TABLE IF EXISTS department;
CREATE TABLE department(
    DeptID INT PRIMARY KEY,
    Dept_name VARCHAR(50) NOT NULL
);

		-- EmployeeDepartment junction table
        -- Assuming an EmpID can be associated to multiple departments
DROP TABLE IF EXISTS employee_department;
CREATE TABLE employee_department (
    EmpID INT,
    DeptID INT,
    PRIMARY KEY (EmpID, DeptID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
			-- PayrollTransactionn table
DROP TABLE IF EXISTS payroll;
CREATE TABLE payroll ( 
    Payroll_ID INT PRIMARY KEY,
    EmpID INT ,
    DeptID INT,
    Hourly_rate INT,
    Monthly_rate INT,
    Overtime_hours INT,
    Bonus_amount DECIMAL(10, 2),
    Deductions DECIMAL(10, 2),
    Net_pay DECIMAL(10, 2),
    Payroll_date DATE,
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY(DeptID) REFERENCES Department(DeptID)
);
			-- Creating TaxDetails 
DROP TABLE IF EXISTS tax_details;
CREATE TABLE tax_details(
    TaxID INT PRIMARY KEY,
    Tax_code VARCHAR(50) NOT NULL,
    National_insurance INT, 
    NIN VARCHAR(50) NOT NULL,
    EmpID INT,
    DeptID INT,
    FOREIGN KEY(EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY(DeptID) REFERENCES Department(DeptID)
);







