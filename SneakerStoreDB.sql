-- Create the Database 
CREATE DATABASE ShoetopiaDB;

-- use ShoetopiaDB sample
USE ShoetopiaDB;

-- Create the Category table
CREATE TABLE Category (
    categoryID VARCHAR(50) PRIMARY KEY,
    categoryName VARCHAR(255),
    descriptionCont TEXT
);

-- Create the Supplier table
CREATE TABLE Supplier (
    supplierID VARCHAR(50) PRIMARY KEY,
    supplierName VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(255),
    address TEXT,
    pricing TEXT,
    leadTimes TEXT
);

-- Create the Sneaker table
CREATE TABLE Sneaker (
    sneakerID VARCHAR(50) PRIMARY KEY,
    brand VARCHAR(255),
    model VARCHAR(255),
    size VARCHAR(10),
    colour VARCHAR(255),
    quantityAvailable INT,
    price DECIMAL(10, 2),
    categoryID VARCHAR(50),
    supplierID VARCHAR(50),
    FOREIGN KEY (categoryID) REFERENCES Category(categoryID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);

-- Create the Employee table
CREATE TABLE Employee (
    employeeID VARCHAR(50) PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    address TEXT,
    position VARCHAR(255),
    employmentDate DATE,
    dateOfBirth DATE,
    hourRate DECIMAL(10, 2)
);

-- Create the Customer table
CREATE TABLE Customer (
    customerID VARCHAR(50) PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    paymentInfo TEXT,
    postalCode VARCHAR(15)
);

-- Create the PurchaseOrder table
CREATE TABLE PurchaseOrder (
    orderID VARCHAR(50) PRIMARY KEY,
    sneakerID VARCHAR(50),
    customerID VARCHAR(50),
    employeeID VARCHAR(50),
    quantity INT,
    totalAmount DECIMAL(10, 2),
    paymentInfo TEXT,
    orderStatus VARCHAR(255),
    FOREIGN KEY (sneakerID) REFERENCES Sneaker(sneakerID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);

-- Create the Review table
CREATE TABLE Review (
    reviewID VARCHAR(50) PRIMARY KEY,
    sneakerID VARCHAR(50),
    customerID VARCHAR(50),
    comment TEXT,
    FOREIGN KEY (sneakerID) REFERENCES Sneaker(sneakerID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

INSERT INTO Category (categoryID, categoryName, descriptionCont) VALUES
('CAT001', 'Running Shoes', 'Shoes designed for running activities.'),
('CAT002', 'Basketball Shoes', 'Shoes specifically designed for playing basketball.'),
('CAT003', 'Casual Shoes', 'Everyday wear shoes for casual occasions.');

-- Insert data into Supplier table
INSERT INTO Supplier (supplierID, supplierName, phone, email, address, pricing, leadTimes) VALUES
('SUP001', 'Nike Supplier', '123-456-7890', 'nike@example.com', '123 Supplier St, City', 'Standard Pricing', '2 weeks'),
('SUP002', 'Adidas Supplier', '987-654-3210', 'adidas@example.com', '456 Supplier St, City', 'Bulk Discount', '3 weeks'),
('SUP003', 'Puma Supplier', '111-222-3333', 'puma@example.com', '789 Supplier St, City', 'Tiered Pricing', '4 weeks');

-- Continuing to insert data into Sneaker table
INSERT INTO Sneaker (sneakerID, brand, model, size, colour, quantityAvailable, price, categoryID, supplierID) VALUES
('ZX8000', 'Adidas', 'ZX 8000', '8', 'White', 18, 119.99, 'CAT002', 'SUP002'),
('RS-X3', 'Puma', 'RS-X3', '9', 'Green', 22, 109.99, 'CAT003', 'SUP003'),
('AJ1-BRED', 'Nike', 'Air Jordan 1', '10', 'Black/Red', 12, 199.99, 'CAT002', 'SUP001'),
('SUPERSTAR', 'Adidas', 'Superstar', '7.5', 'White/Black', 25, 89.99, 'CAT003', 'SUP002'),
('AIRFORCE1', 'Nike', 'Air Force 1', '11', 'White', 30, 129.99, 'CAT001', 'SUP001');

-- Continuing to insert data into Employee table
INSERT INTO Employee (employeeID, firstName, lastName, email, address, position, employmentDate, dateOfBirth, hourRate) VALUES
('EMP003', 'Mark', 'Taylor', 'mark.taylor@example.com', '789 Employee St, City', 'Sales Associate', '2022-03-01', '1995-11-10', 16.00),
('EMP004', 'Sarah', 'Clark', 'sarah.clark@example.com', '101 Employee St, City', 'Cashier', '2022-04-01', '1992-07-18', 14.50),
('EMP005', 'Chris', 'Miller', 'chris.miller@example.com', '202 Employee St, City', 'Stock Clerk', '2022-05-01', '1988-04-25', 13.00),
('EMP006', 'Emily', 'Roberts', 'emily.roberts@example.com', '303 Employee St, City', 'Sales Manager', '2022-06-01', '1980-09-05', 22.50);

-- Continuing to insert data into Customer table
INSERT INTO Customer (customerID, firstName, lastName, email, paymentInfo, postalCode) VALUES
('CUST003', 'Charlie', 'Brown', 'charlie@example.com', 'Credit Card: **** **** **** 5678', 'V6A 1H6'),
('CUST004', 'Olivia', 'Davis', 'olivia@example.com', 'Credit Card: **** **** **** 8765', 'V6B 3A7'),
('CUST005', 'Daniel', 'Anderson', 'daniel@example.com', 'PayPal: daniel@example.com', 'V6C 2X1'),
('CUST006', 'Sophia', 'Wright', 'sophia@example.com', 'Credit Card: **** **** **** 4321', 'V6A 4S2'),
('CUST007', 'William', 'Moore', 'william@example.com', 'PayPal: william@example.com', 'V6B 1R8');

-- Continuing to insert data into PurchaseOrder table
INSERT INTO PurchaseOrder (orderID, sneakerID, customerID, employeeID, quantity, totalAmount, paymentInfo, orderStatus) VALUES
('PO003', 'ZX8000', 'CUST003', 'EMP003', 2, 239.98, 'Credit Card: **** **** **** 1234', 'Shipped'),
('PO004', 'RS-X3', 'CUST004', 'EMP004', 3, 329.97, 'Credit Card: **** **** **** 5678', 'Processing'),
('PO005', 'AJ1-BRED', 'CUST005', 'EMP005', 1, 199.99, 'PayPal: daniel@example.com', 'Shipped'),
('PO006', 'SUPERSTAR', 'CUST006', 'EMP006', 2, 179.98, 'Credit Card: **** **** **** 8765', 'Delivered'),
('PO007', 'AIRFORCE1', 'CUST007', 'EMP003', 1, 129.99, 'PayPal: william@example.com', 'Shipped');

-- Continuing to insert data into Review table
INSERT INTO Review (reviewID, sneakerID, customerID, comment) VALUES
('REV003', 'ZX8000', 'CUST003', 'Great for running, highly recommended!'),
('REV004', 'RS-X3', 'CUST004', 'Love the design, very stylish.'),
('REV005', 'AJ1-BRED', 'CUST005', 'Perfect fit and comfortable.'),
('REV006', 'SUPERSTAR', 'CUST006', 'Classic design, goes well with any outfit.'),
('REV007', 'AIRFORCE1', 'CUST007', 'Excellent quality and durability.');


-- Show all tables in the SneakerStore database
SHOW TABLES;

-- Show the structure of each table in the SneakerStore database
SHOW FULL COLUMNS FROM Category;
SHOW FULL COLUMNS FROM Supplier;
SHOW FULL COLUMNS FROM Sneaker;
SHOW FULL COLUMNS FROM Employee;
SHOW FULL COLUMNS FROM Customer;
SHOW FULL COLUMNS FROM PurchaseOrder;
SHOW FULL COLUMNS FROM Review;


-- Query to retrieve all Category
SELECT * FROM Category;
-- Query to retrieve all Supplier
SELECT * FROM Supplier;
-- Query to retrieve all Sneaker
SELECT * FROM Sneaker;
-- Query to retrieve all Employee
SELECT * FROM Employee;
-- Query to retrieve all Customer
SELECT * FROM Customer;
-- Query to retrieve all PurchaseOrder
SELECT * FROM PurchaseOrder;
-- Query to retrieve all Review
SELECT * FROM Review;

-- Real-time Inventory Management
SELECT * FROM Sneaker WHERE quantityAvailable > 0;

-- Customer Profiles and Personalized Recommendations
-- Replace 'customer_email@example.com' with the actual customer's email
SELECT * FROM Customer WHERE email = 'customer_email@example.com';

-- Replace 'customer_id' with the actual customer ID
SELECT * FROM Sneaker s
JOIN PurchaseOrder po ON s.sneakerID = po.sneakerID
WHERE po.customerID = 'customer_id'
ORDER BY po.quantity DESC LIMIT 5;

-- Sales Tracking and Reporting
-- Replace 'start_date' and 'end_date' with the actual start and end dates
SELECT * FROM PurchaseOrder WHERE DATE(createdAt) BETWEEN 'start_date' AND 'end_date';

-- Replace 'start_date' and 'end_date' with the actual start and end dates
SELECT s.*, COUNT(po.sneakerID) AS totalSales, SUM(po.totalAmount) AS totalRevenue
FROM Sneaker s
JOIN PurchaseOrder po ON s.sneakerID = po.sneakerID
WHERE DATE(po.createdAt) BETWEEN 'start_date' AND 'end_date'
GROUP BY s.sneakerID
ORDER BY totalSales DESC;

-- Supplier Management
SELECT * FROM Supplier;

-- Update supplier information
-- Replace 'supplier_id' and other fields with the actual values
UPDATE Supplier SET email = 'new_email@example.com', pricing = 'new_pricing' WHERE supplierID = 'supplier_id';

-- Employee Scheduling and Contact Management
-- Replace 'date' with the actual date and 'employee_id' with the employee's ID
SELECT * FROM EmployeeSchedule WHERE DATE(scheduleDate) = 'date' AND employeeID = 'employee_id';

-- Update employee contact information
-- Replace 'employee_id' and other fields with the actual values
UPDATE Employee SET phone = 'new_phone_number' WHERE employeeID = 'employee_id';

-- Query to retrieve all products
SELECT * FROM Sneaker;

-- Query to retrieve all purchase orders with customer and product details
SELECT 
    PurchaseOrder.*,
    Customer.firstName AS customerFirstName,
    Customer.lastName AS customerLastName,
    Sneaker.*
FROM PurchaseOrder
JOIN Customer ON PurchaseOrder.customerID = Customer.customerID
JOIN Sneaker ON PurchaseOrder.sneakerID = Sneaker.sneakerID;

-- Query to retrieve customer details and their reviews
SELECT 
    Customer.*,
--    Review.rating,
    Review.comment
FROM Customer
LEFT JOIN Review ON Customer.customerID = Review.customerID;

-- Query to retrieve employee details
SELECT * FROM Employee;

-- Query to retrieve supplier details
SELECT * FROM Supplier;

-- Query to retrieve reviews with product details
SELECT 
    Review.*,
    Sneaker.brand,
    Sneaker.model,
    Sneaker.categoryID
FROM Review
JOIN Sneaker ON Review.sneakerID = Sneaker.sneakerID;

-- Query to retrieve category details
SELECT * FROM Category;


-- Real-time Inventory Management
SELECT * FROM Sneaker WHERE quantityAvailable > 0;

-- Customer Profiles and Personalized Recommendations
-- Replace 'customer_email@example.com' with the actual customer's email
SELECT * FROM Customer WHERE email = 'customer_email@example.com';

-- Replace 'customer_id' with the actual customer ID
SELECT s.* FROM Sneaker s
JOIN PurchaseOrder po ON s.sneakerID = po.sneakerID
WHERE po.customerID = 'customer_id'
ORDER BY po.quantity DESC LIMIT 5;

-- Sales Tracking and Reporting
-- Replace 'start_date' and 'end_date' with the actual start and end dates
SELECT * FROM PurchaseOrder WHERE DATE(createdAt) BETWEEN 'start_date' AND 'end_date';

-- Replace 'start_date' and 'end_date' with the actual start and end dates
SELECT s.brand, s.model, COUNT(po.sneakerID) AS totalSales, SUM(po.totalAmount) AS totalRevenue
FROM Sneaker s
JOIN PurchaseOrder po ON s.sneakerID = po.sneakerID
WHERE DATE(po.createdAt) BETWEEN 'start_date' AND 'end_date'
GROUP BY s.sneakerID
ORDER BY totalSales DESC;

-- Supplier Management
SELECT * FROM Supplier;

-- Update supplier information
-- Replace 'supplier_id' and other fields with the actual values
UPDATE Supplier SET email = 'new_email@example.com', pricing = 'new_pricing' WHERE supplierID = 'supplier_id';

-- Employee Scheduling and Contact Management
-- Replace 'date' with the actual date and 'employee_id' with the employee's ID
SELECT * FROM EmployeeSchedule WHERE DATE(scheduleDate) = 'date' AND employeeID = 'employee_id';

-- Update employee contact information
-- Replace 'employee_id' and other fields with the actual values
UPDATE Employee SET phone = 'new_phone_number' WHERE employeeID = 'employee_id';
