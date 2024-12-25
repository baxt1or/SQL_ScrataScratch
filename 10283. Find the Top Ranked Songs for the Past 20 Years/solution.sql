-- Write your PostgreSQL query statement below
WITH cte AS (SELECT 
id,song_name, year_rank, year
FROM billboard_top_100_year_end
WHERE year >= '1993' AND year <= '2013'
ORDER BY year_rank )


SELECT
id AS song_id, song_name
FROM cte
GROUP BY 1,2
HAVING COUNT(CASE WHEN year_rank = 1 THEN 1 END) >= 1