-- Write your PostgreSQL query statement below
SELECT
p.id AS project_id, p.title,
ROUND(SUM(p.budget) * 1.0 / COUNT(DISTINCT e.emp_id), 0) AS total_allocation 
FROM ms_projects p
INNER JOIN ms_emp_projects e ON p.id = e.project_id
GROUP BY 1, 2
ORDER BY total_allocation DESC