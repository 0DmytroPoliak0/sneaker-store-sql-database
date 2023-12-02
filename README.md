# sneaker-store-sql-database
Shoetopia Database README

This repository contains SQL scripts for creating and populating the Shoetopia database, a sample database for managing a sneaker store. The database includes tables for categories, suppliers, sneakers, employees, customers, purchase orders, and reviews.

Database Schema

Tables
Category
categoryID (VARCHAR, Primary Key)
categoryName (VARCHAR)
descriptionCont (TEXT)
Supplier
supplierID (VARCHAR, Primary Key)
supplierName (VARCHAR)
phone (VARCHAR)
email (VARCHAR)
address (TEXT)
pricing (TEXT)
leadTimes (TEXT)
Sneaker
sneakerID (VARCHAR, Primary Key)
brand (VARCHAR)
model (VARCHAR)
size (VARCHAR)
colour (VARCHAR)
quantityAvailable (INT)
price (DECIMAL)
categoryID (VARCHAR, Foreign Key)
supplierID (VARCHAR, Foreign Key)
Employee
employeeID (VARCHAR, Primary Key)
firstName (VARCHAR)
lastName (VARCHAR)
email (VARCHAR)
address (TEXT)
position (VARCHAR)
employmentDate (DATE)
dateOfBirth (DATE)
hourRate (DECIMAL)
Customer
customerID (VARCHAR, Primary Key)
firstName (VARCHAR)
lastName (VARCHAR)
email (VARCHAR)
paymentInfo (TEXT)
postalCode (VARCHAR)
PurchaseOrder
orderID (VARCHAR, Primary Key)
sneakerID (VARCHAR, Foreign Key)
customerID (VARCHAR, Foreign Key)
employeeID (VARCHAR, Foreign Key)
quantity (INT)
totalAmount (DECIMAL)
paymentInfo (TEXT)
orderStatus (VARCHAR)
Review
reviewID (VARCHAR, Primary Key)
sneakerID (VARCHAR, Foreign Key)
customerID (VARCHAR, Foreign Key)
comment (TEXT)
Sample Data
The SQL script also includes sample data for each table to illustrate how the database can be populated.

Queries

The README provides example queries for various scenarios, including real-time inventory management, customer profiles and personalized recommendations, sales tracking and reporting, supplier management, and employee scheduling and contact management.

Instructions

Database Creation:
Execute the CREATE DATABASE ShoetopiaDB; and USE ShoetopiaDB; commands to create and use the Shoetopia database.
Table Creation:
Execute the CREATE TABLE commands for each table to define the database schema.
Data Insertion:
Execute the INSERT INTO commands to populate the tables with sample data.
Queries:
Use the provided queries to retrieve information from the database based on different scenarios.
Feel free to customize the database schema, data, or queries according to your specific requirements.

Usage Examples

Real-time Inventory Management
sql
Copy code
SELECT * FROM Sneaker WHERE quantityAvailable > 0;
Customer Profiles and Personalized Recommendations
sql
Copy code
-- Replace 'customer_email@example.com' with the actual customer's email
SELECT * FROM Customer WHERE email = 'customer_email@example.com';
Sales Tracking and Reporting
sql
Copy code
-- Replace 'start_date' and 'end_date' with the actual start and end dates
SELECT * FROM PurchaseOrder WHERE DATE(createdAt) BETWEEN 'start_date' AND 'end_date';
Supplier Management
sql
Copy code
SELECT * FROM Supplier;
Employee Scheduling and Contact Management
sql
Copy code
-- Replace 'date' with the actual date and 'employee_id' with the employee's ID
SELECT * FROM EmployeeSchedule WHERE DATE(scheduleDate) = 'date' AND employeeID = 'employee_id';
