WITH cte AS (SELECT
company_id, 
TO_CHAR(r.date, 'YYYY-MM') AS year_month, 
COUNT(call_id) AS total_calls
FROM rc_calls r 
INNER JOIN rc_users u ON r.user_id = u.user_id
WHERE TO_CHAR(r.date, 'YYYY-MM') BETWEEN '2020-03' AND '2020-04'
GROUP BY 1,2
ORDER BY 1),

cte2 AS ((SELECT
company_id,
LAG(total_calls) OVER(PARTITION BY company_id ORDER BY year_month) - total_calls  AS diff
FROM cte))

SELECT
company_id, diff
FROM cte2
WHERE diff = (SELECT MAX(diff) FROM cte2)



