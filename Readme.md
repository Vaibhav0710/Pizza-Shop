# Online Pizza Order System

## Technologies Used

- **Core Java**
- **JDBC**
- **MySQL**

## Description

Developed a **console-based Online Pizza Order System** that allows customers to browse the menu, add pizzas to their cart, and place orders. Administrators can manage and track orders efficiently.

## Setup and Installation

### Prerequisites

- Install **MySQL Server**
- Install **Java Development Kit (JDK)**
- Install **IntelliJ IDEA** (or any Java IDE)

### Configure MySQL Connector

1. Use MySQL JDBC Driver from the repostory which i have given.
2. Add the JAR file to your project:
   - In IntelliJ IDEA:
     - Go to **File** > **Project Structure** > **Libraries** > **Add JARs** and select the downloaded JAR file.
   - In a Maven project, add this dependency:
     ```xml
     <dependency>
         <groupId>mysql</groupId>
         <artifactId>mysql-connector-java</artifactId>
         <version>8.0.33</version>
     </dependency>
     ```

## Key Features

- **User Authentication** (Sign Up & Sign In) with MySQL database.
- **Menu Navigation** for Veg & Non-Veg pizzas with different sizes and pricing.
- **Shopping Cart System** to add pizzas dynamically before confirming an order.
- **JDBC-based database operations** for storing orders, pricing, and customer data.
- **Admin Module** to view all orders and retrieve order details by ID.
- **Relational Database Schema** with efficient data management.

---

## Database Schema

The system consists of the following tables:

1. **users** (Stores customer login details)
2. **pizza_items** (Menu items)
3. **pizza_pricing** (Pricing for different sizes)
4. **orders** (Stores placed orders)
5. **order_details** (Stores items in each order)

---

## SQL Queries

### 1. Creating Tables

```sql
CREATE TABLE users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pizza_items (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Veg', 'NonVeg') NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Description TEXT
);

CREATE TABLE pizza_pricing (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ITEMID INT,
    Size ENUM('Small', 'Medium', 'Large') NOT NULL,
    Price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ITEMID) REFERENCES pizza_items(ID) ON DELETE CASCADE
);

CREATE TABLE orders (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES users(ID) ON DELETE CASCADE
);

CREATE TABLE order_details (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PizzaID INT,
    Size ENUM('Small', 'Medium', 'Large') NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES orders(ID) ON DELETE CASCADE,
    FOREIGN KEY (PizzaID) REFERENCES pizza_items(ID)
);
```

### 2. Inserting Sample Data

```sql
INSERT INTO users (Username, Password, Email) VALUES ('john_doe', 'securepass', 'john@example.com');

INSERT INTO pizza_items (Name, Type, Category, Description) VALUES
('Margherita', 'Veg', 'Simply Veg', 'Single Cheese Topping'),
('Chicken Fiesta', 'NonVeg', 'NonVeg Treat', 'Chunky Chicken, Spicy Chicken, Onion, Capsicum');

INSERT INTO pizza_pricing (ITEMID, Size, Price) VALUES
(1, 'Small', 99.00), (1, 'Medium', 199.00), (1, 'Large', 299.00),
(2, 'Small', 149.00), (2, 'Medium', 249.00), (2, 'Large', 349.00);
```

### 3. Retrieving Orders

```sql
SELECT orders.ID, users.Username, orders.OrderDate, orders.TotalPrice FROM orders
JOIN users ON orders.UserID = users.ID;
```

---

## How to Run

1. Clone the repository.
2. **Import the SQL Schema** into MySQL.
3. Import the **MYSQL JDBC Driver**
4. **Update JDBC Configurations** in `DBUtil.java`.

5. **Run the Java Application** in IntelliJ IDEA.

---

## Future Enhancements

- Add a graphical user interface (GUI) for a better user experience.
- Implement payment gateway integration.
- Introduce discounts and coupon codes.

---

## Author

Vaibhav Jain 🚀
