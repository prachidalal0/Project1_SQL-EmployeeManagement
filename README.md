# Project 1: SQL Group Project - MySQL Workbench Forward Engineering

## Class
ITSS 4300

## Date
Fall 2021

## Description:
This project focused on designing and implementing a relational database to manage employee information. This included departments, health plans, job categories, salaries, and payroll details. The schema was created using MySQL Workbench, with careful attention to data relationships, normalization, and ensuring the system could scale effectively for large datasets. The objective was to establish a robust backend infrastructure for an employee management system, where data integrity was prioritized through the use of foreign key constraints and indexing.

We modeled tables to represent various components of the business logic, such as employee details, job categories, health plans, overtime pay, federal and state taxes, and payroll deductions. The relational structure of the database allows for efficient querying and the ability to run complex payroll calculations, such as deductions for tax, Medicare, Social Security, and retirement savings. 

This system also facilitates easy data updates, ensuring that employee records, payroll information, and tax details are kept current. The use of SQL features like triggers, indexes, and foreign keys ensures that the data remains consistent and optimized for querying.

## Technologies Used:
- MySQL Workbench
- SQL
- Database Design
- Foreign Key Constraints
- Indexing

## Key Features:
- Forward engineering of a comprehensive employee management database schema
- Strong data integrity enforced through foreign key constraints
- Optimized querying using indexes for faster retrieval of employee and payroll data
- Flexible payroll calculations, including deductions for taxes, Medicare, Social Security, and retirement
- Detailed schema design to handle multiple departments, job categories, and employee-specific data
- Scalable structure capable of handling large employee datasets with efficient data relationships

## Methods Used:
- **Forward Engineering**: Used MySQL Workbench to design and forward engineer the schema, creating tables and relationships based on the defined business requirements.
- **Normalization**: Applied normalization principles to minimize data redundancy and improve data consistency across tables.
- **Foreign Key Constraints**: Implemented foreign key constraints to establish relationships between tables, ensuring referential integrity and preventing orphaned records.
- **Indexing**: Created indexes on frequently queried columns to enhance performance, particularly for joins and lookups on employee, payroll, and tax data.
- **SQL Triggers**: Utilized SQL triggers to automate certain actions, such as updating the salary audit and handling changes in employee status.
- **Join Operations**: Implemented various join operations (INNER JOIN, LEFT JOIN) to aggregate data from multiple tables efficiently for payroll calculations and employee data reporting.
- **Complex Queries**: Wrote complex SQL queries for aggregating payroll data, including calculating deductions, overtime pay, and tax withholdings, based on employee records and job categories.