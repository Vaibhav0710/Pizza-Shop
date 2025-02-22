CREATE DATABASE IF NOT EXISTS hackathon
USE hackathon;

-- Table: pizza_customers
CREATE TABLE pizza_customers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(30),
    Password VARCHAR(15),
    Mobile VARCHAR(15),
    Address VARCHAR(60),
    Email VARCHAR(40) UNIQUE
);

-- Table: pizza_items
CREATE TABLE pizza_items (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(40),
    Type VARCHAR(20),
    Category VARCHAR(30),
    Description VARCHAR(120)
);

-- Table: pizza_pricing
CREATE TABLE pizza_pricing (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ITEMID INT,
    SIZES VARCHAR(20),
    Price DOUBLE,
    FOREIGN KEY (ITEMID) REFERENCES pizza_items(ID) ON DELETE CASCADE
);

-- Table: pizza_orders
CREATE TABLE pizza_orders (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT,
    OrderTime DATETIME,
    STATUS VARCHAR(12),
    FOREIGN KEY (CustomerId) REFERENCES pizza_customers(ID) ON DELETE CASCADE
);

-- Table: pizza_orderdetails
CREATE TABLE pizza_orderdetails (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderId INT,
    PRICEID INT,
    FOREIGN KEY (OrderId) REFERENCES pizza_orders(ID) ON DELETE CASCADE,
    FOREIGN KEY (PRICEID) REFERENCES pizza_pricing(ID) ON DELETE CASCADE
);

