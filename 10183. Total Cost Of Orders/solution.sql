SELECT
c.id, c.first_name, 
SUM(o.total_order_cost) AS total_amount
FROM customers c
INNER JOIN orders o ON c.id = o.cust_id
GROUP BY 1, 2
ORDER BY 2