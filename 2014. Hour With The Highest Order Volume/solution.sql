SELECT
DATE(order_timestamp_utc) AS date,
EXTRACT(HOUR FROM order_timestamp_utc) AS hour,
AVG(amount) AS highet_average
FROM postmates_orders
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1