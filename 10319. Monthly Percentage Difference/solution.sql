-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
TO_CHAR(created_at, 'YYYY-MM') AS month,
SUM(value) AS total_value
FROM sf_transactions
GROUP BY 1
ORDER BY 1)


SELECT
month AS year_month,
(total_value - LAG(total_value) OVER(ORDER BY month)) * 1.0 /LAG(total_value) OVER(ORDER BY month) * 100 AS revenue_diff_pct
FROM cte
