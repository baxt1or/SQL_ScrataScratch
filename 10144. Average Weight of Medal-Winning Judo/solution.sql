-- Write your PostgreSQL query statement below
SELECT
team, AVG(weight) AS avg_weight
FROM olympics_athletes_events
WHERE age BETWEEN 20 AND 30 AND medal IS NOT NULL AND weight IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC