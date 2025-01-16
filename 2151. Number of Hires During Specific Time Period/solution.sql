SELECT
COUNT(DISTINCT id) AS total_employees
FROM employees
WHERE TO_CHAR(joining_date, 'YYYY-MM') BETWEEN '2022-01' AND '2022-08'