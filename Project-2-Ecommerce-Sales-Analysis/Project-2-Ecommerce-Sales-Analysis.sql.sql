-- =============================================================================
-- E-commerce Sales Analysis
-- =============================================================================
USE ecommerce;
-- =============================================================================
-- 1. Overall Business Perfomance
-- =============================================================================
SELECT 
count(*) as total_orders, sum(sales) as total_sales, sum(profit) as total_profit
FROM orders;
-- =============================================================================
-- 2. Top 10 Products by Revenue
-- =============================================================================
SELECT
    product_name,
    SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
-- ============================================================================
-- 3. Top Customers by Spening
-- ============================================================================
SELECT customer_name, sum(sales) as total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10; 
-- ============================================================================
-- 4. Sales by Region
-- ============================================================================
SELECT region, sum(sales) as total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;
-- ============================================================================
-- 5. Profit by Region
-- ============================================================================
SELECT region, sum(profit) as total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;
-- ============================================================================
-- 6. Sales by Category
-- ============================================================================
SELECT category, sum(sales) as total_sales
FROM orders
GROUP BY category
ORDER BY total_sales DESC;
-- ============================================================================
-- 7. Profit by Category
-- ============================================================================
SELECT category, sum(profit) as total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;
-- ============================================================================
-- 8. Average Order Value 
-- ============================================================================
SELECT avg(sales) as average_order_value
FROM orders;