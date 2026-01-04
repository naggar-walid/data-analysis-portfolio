
-- File: customer_analysis.sql
-- Author: Walid Naggar
-- Description: Basic SQL analysis queries

-- Total orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- Revenue per customer
SELECT c.customer_id, SUM(oi.quantity * p.price) AS revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.customer_id;

-- Inactive customers (no orders in last 6 months)
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) < DATE('now', '-6 months');
