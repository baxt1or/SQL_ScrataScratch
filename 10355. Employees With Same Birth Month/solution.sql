-- Write your PostgreSQL query statement below
WITH months AS (SELECT
DISTINCT birth_month AS month FROM employee_list),

report AS (SELECT
profession, 
birth_month,
COUNT(*) AS total_employees
FROM employee_list a
WHERE birth_month != 0
GROUP BY 1, 2)


SELECT
r.profession, 
m.month, 
COALESCE(r.total_employees, 0) AS total_employees
FROM months m
LEFT JOIN report r ON r.birth_month = m.month
ORDER BY 2