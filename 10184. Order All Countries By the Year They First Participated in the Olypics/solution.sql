-- Write your PostgreSQL query statement below
SELECT 
noc, 
MIN(year) AS first_year
FROM olympics_athletes_events
GROUP BY 1
ORDER BY first_year, noc