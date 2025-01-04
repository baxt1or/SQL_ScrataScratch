SELECT
department, 
worker_id,
COUNT(*)
FROM worker
WHERE department = 'HR'
GROUP BY 1, 2
HAVING COUNT(*) > 1