SELECT
customer_id, 
COUNT(*) AS total_orders,
AVG(amount) AS average_amount
FROM postmates_orders
GROUP BY 1