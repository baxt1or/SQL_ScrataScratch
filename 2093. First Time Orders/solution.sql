WITH cte AS (SELECT
*,
DATE(o.order_timestamp) AS date,
MIN(DATE(o.order_timestamp)) OVER(PARTITION BY m.id ORDER BY DATE(o.order_timestamp)) AS first_order
FROM order_details o
INNER JOIN merchant_details m ON o.merchant_id = m.id)

SELECT
merchant_id,name, 
COUNT(*) AS total,
COUNT(CASE WHEN date = first_order THEN 1 END) AS total_first
FROM cte
GROUP BY 1,2
