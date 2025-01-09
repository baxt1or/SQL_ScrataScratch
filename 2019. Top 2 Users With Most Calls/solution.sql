WITH cte AS (SELECT
u.company_id, 
r.user_id, 
COUNT(r.call_id) AS total_calls
FROM rc_calls r
INNER JOIN rc_users u ON r.user_id = u.user_id
GROUP BY 1, 2)

SELECT
*
FROM (SELECT
company_id ,user_id,
DENSE_RANK() OVER(ORDER BY total_calls DESC) AS rnk
FROM cte) AS sub
WHERE rnk <= 2

