-- =============================================================================
-- PROJECT: SALES ANALYZE
-- Tools: MySQL, SQL
-- =============================================================================
USE superstore;
-- =============================================================================
-- 1. Overall Business Performance 
-- =============================================================================
SELECT 
  COUNT(*) AS total_orders,
  sum(sales) AS total_sales,
  sum(profit)  AS total_profit
FROM orders;
-- =============================================================================
-- 2. Top Products by Revenue
-- =============================================================================
SELECT product_name, sum(sales) as revenue 
FROM orders
GROUP BY product_name
ORDER BY revenue DESC;
-- ============================================================================
-- 3. Top Customers by Spending
-- ============================================================================
SELECT customer_name, sum(sales) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC;  
-- =============================================================================
-- 4. Sales by Region
-- =============================================================================
SELECT region, sum(sales) as total_sales
FROM orders 
GROUP BY region
ORDER BY  total_sales DESC;
-- =============================================================================
-- 5.Profit by Product
-- =============================================================================
SELECT product_name, sum(profit) as total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC;
-- ============================================================================
-- 6. Monthly Sales Trend 
-- ============================================================================
SELECT month(order_date) as month_number, sum(sales) as total_sales
FROM orders
GROUP BY month_number
ORDER BY total_sales DESC; 
-- ============================================================================
-- 7. Profit by Region 
-- ============================================================================
SELECT region, sum(profit) as total_profit
FROM orders 
GROUP BY region
ORDER BY  total_profit DESC;
-- ============================================================================
-- 8. Average Order Value 
-- ============================================================================
SELECT avg(sales) as average_sales, count(*) as count
FROM orders