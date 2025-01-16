WITH cte AS (
SELECT
product_id, 
SUM(quantity) AS total
FROM marketing_campaign
GROUP BY 1)

SELECT
product_id,
total AS units,
CASE 
    WHEN total BETWEEN 1 AND 9 THEN 'Poor'
    WHEN total BETWEEN 10 AND 19 THEN 'Unsatisfactory'
    WHEN total BETWEEN 20 AND 29 THEN 'Satisfactoty'
    ELSE 'Outstanding'
END AS category
FROM cte
ORDER BY units DESC