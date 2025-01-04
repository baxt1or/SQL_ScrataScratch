SELECT
department, 
COUNT(DISTINCT worker_id)
FROM worker
GROUP BY 1
HAVING COUNT(DISTINCT worker_id) < 4