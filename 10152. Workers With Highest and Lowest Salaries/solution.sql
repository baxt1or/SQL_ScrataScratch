-- Write your PostgreSQL query statement below
SELECT
worker_id, salary, department, worker_title
FROM (SELECT
w.worker_id, w.salary, w.department, t.worker_title,
MIN(w.salary) OVER() AS min_sal,
MAX(w.salary) OVER() AS max_sal
FROM worker w
INNER JOIN title t ON w.worker_id = t.worker_ref_id) AS sub
WHERE salary = max_sal OR salary = min_sal