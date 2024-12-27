-- Write your PostgreSQL query statement below
SELECT
u.company_id, e.user_id,
COUNT(*) AS total_events
FROM playbook_events e
INNER JOIN playbook_users u ON e.user_id = u.user_id
WHERE e.device = 'macbook pro' AND e.location = 'Argentina' AND language != 'spanish'
GROUP BY 1, 2
ORDER BY 3 DESC