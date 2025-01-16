WITH cte AS (
SELECT
product_id, 
TO_CHAR(date, 'YYYY-MM') AS year_month,
SUM(cost_in_dollars * units_sold) AS total
FROM online_orders
WHERE TO_CHAR(date, 'YYYY-MM') BETWEEN '2022-04' AND '2022-05'
GROUP BY 1, 2)

SELECT
product_id, prev * 1.0/ total AS percentage_growth
FROM (SELECT
*,
total * 0.1 AS per,
LAG(total) OVER(PARTITION BY product_id ORDER BY year_month) AS prev
FROM cte) AS sub
WHERE prev IS NOT NULL AND per + prev < total