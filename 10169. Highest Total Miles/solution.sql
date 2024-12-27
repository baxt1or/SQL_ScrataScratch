-- Write your PostgreSQL query statement below
SELECT
purpose,
SUM(miles) AS total_miles
FROM my_uber_drives
WHERE category = 'Business' AND purpose != ' '
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3