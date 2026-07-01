-- ==========================================================
-- Project 4: Relational Database and SQL JOIN Analysis
-- ==========================================================
-- Description:
-- This project demonstrates how to create a relational database
-- using MySQL. It includes Primary Keys, Foreign Keys,
-- INNER JOIN operations, and business analysis using SQL.
--
-- Objectives:
-- • Create a relational database
-- • Establish relationships between tables
-- • Analyze customer purchases
-- • Analyze product performance
-- • Practice SQL JOIN operations
-- ==========================================================

CREATE DATABASE relational_sales;
USE relational_sales;

CREATE TABLE customers ( 
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
region VARCHAR(50)
);
 
 CREATE TABLE products ( 
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
sales DECIMAL (10,2),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id),
FOREIGN KEY(product_id)
REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'John Smith','North'),
(2,'Isabella White','South'),
(3,'Daniel Moore','North'),
(4,'William Jackson','West'),
(5,'Michael Davis','East');

INSERT INTO products VALUES
(101,'Laptop','Electronics'),
(102,'Monitor','Electronics'),
(103,'Desk','Furniture'),
(104,'Cabinet','Furniture');

INSERT INTO orders VALUES
(1001,1,101,1200),
(1002,2,101,1800),
(1003,3,103,700),
(1004,4,104,900),
(1005,5,102,500),
(1006,2,103,750),
(1007,1,104,850);

-- ===========================================================================
-- Business Question 1:
-- Which customers bought which product, and what was the sales amount?
-- ===========================================================================
SELECT
c.customer_name,
p.product_name,
o.sales
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;
-- Insight:
-- This query combines data from all three tables using INNER JOIN.
-- It shows each customer, the product they purchased, and the corresponding sales amount

-- ===========================================================================
-- Business Question 2:
-- Which customers generated the highest total sales?
-- ===========================================================================
SELECT 
c.customer_name,
sum(o.sales) AS total_sales
FROM orders o 
INNER JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;
-- Insight
-- Isabela White generated the highest total sales.

-- ===========================================================================
-- Business Question 3:
-- Which product categories generated the highest total sales?
-- ===========================================================================
SELECT 
p.category,
sum(o.sales) AS total_sales
FROM orders o
INNER JOIN products p 
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;
-- Insigh:
-- The Electronics category generated the highest total sales with 3500.00

-- ===========================================================================
-- Business Question 4:
-- Which product generated the highest total sales?
-- ===========================================================================
SELECT 
p.product_name,
sum(o.sales) AS total_sales
FROM orders o 
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
-- Insight:
-- Laptop is the top-selling product by revenue.
-- The analysis shows that Electronics products contribute the most to total sales.

-- ==========================================================
-- Project Summary
-- ==========================================================
-- This project demonstrates how to build a relational database
-- using MySQL with Primary Keys and Foreign Keys.
-- Multiple SQL JOIN operations were used to combine customer,
-- product, and order information.
-- Business analysis included:
-- • Customer purchase history
-- • Top customers by sales
-- • Sales by product category
-- • Top-performing products

-- Skills demonstrated:
-- • CREATE DATABASE
-- • CREATE TABLE
-- • PRIMARY KEY
-- • FOREIGN KEY
-- • INSERT
-- • INNER JOIN
-- • GROUP BY
-- • ORDER BY
-- • SUM()