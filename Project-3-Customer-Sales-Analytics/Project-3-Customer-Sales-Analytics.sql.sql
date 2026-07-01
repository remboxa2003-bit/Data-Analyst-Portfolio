-- ===========================================================================
-- Project 3: Customer Sales Analytics
-- ===========================================================================
-- The goal of this project was to analyze customer sales data and identify key business insights related to revenue, profit, customers, products, categories, and regions. SQL was used to answer business questions, summarize data, and create reusable Views for reporting purposes.
-- ===========================================================================

CREATE DATABASE customer_analytics;
USE customer_analytics;
CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT
);
-- ===========================================================================
-- Business Question 1:
-- What is the overall business perfomance?
-- ===========================================================================
SELECT 
count(*) AS total_orders,
sum(sales) AS total_sales,
sum(profit) AS total_profit
FROM orders;
-- ===========================================================================
-- Business Question 2:
-- Which region generates the highest sales and profit?
-- ===========================================================================
SELECT 
region,
sum(sales) AS total_sales,
sum(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;
-- ===========================================================================
-- Business Question 3:
-- Which product categories generate the most revenue and profit?
-- ===========================================================================
SELECT 
category,
sum(sales) AS total_sales,
sum(profit) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_sales DESC;
-- ===========================================================================
-- Business Question 4:
-- Who are the top customers by spending?
-- ===========================================================================
SELECT
customer_name,
sum(sales) AS total_sales
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC;
-- ===========================================================================
-- Business Question 5:
-- Which products generate the highest revenue?
-- ===========================================================================
SELECT
product_name,
sum(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC;
-- ===========================================================================
-- Views
-- ===========================================================================
CREATE VIEW sales_by_region AS
SELECT
region,
sum(sales) AS total_sales,
sum(profit) AS total_profit
FROM orders
GROUP BY region;
-- ===========================================================================
CREATE VIEW sales_by_category AS
SELECT
category,
sum(sales) AS total_sales,
sum(profit) AS total_profit
FROM orders
GROUP BY category;
-- ===========================================================================
CREATE VIEW top_customers AS
SELECT customer_name,
sum(sales) AS total_sales
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC;

-- ===========================================================================
-- Project Conclusion
This project analyzed customer sales data using SQL to answer key business questions and generate actionable insights.
Key Findings:

• The business processed 30 orders, generating total sales of 16,615 and total profit of 3,544.
• North was the best-performing region, generating the highest sales and profit, followed closely by South.
• Electronics was the strongest product category, contributing the majority of revenue and profit.
• Isabella White was the top customer, generating the highest total sales among all customers.
• Laptop was the highest-performing product, significantly outperforming all other products in terms of revenue.
• SQL Views were created to organize and prepare data for reporting and future dashboard development.

Skills Demonstrated:
• SQL Queries
• Aggregate Functions (SUM, COUNT)
• GROUP BY
• ORDER BY
• Business Analysis
• Data Aggregation
• SQL Views
• Insight Generation

Tools Used:
• MySQL
• SQL
• CSV Data