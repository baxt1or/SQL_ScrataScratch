SELECT 
artist,
COUNT(*) AS count
FROM billboard_top_100_year_end
WHERE year >= 1993
GROUP BY 1
ORDER BY 2 DESC