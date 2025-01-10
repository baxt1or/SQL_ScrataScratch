WITH cte AS (SELECT
u.country, 
TO_CHAR(c.created_at, 'YYYY-MM') AS year_month,
SUM(c.number_of_comments) AS total_comments
FROM fb_comments_count c
INNER JOIN fb_active_users u ON c.user_id = u.user_id
WHERE TO_CHAR(c.created_at, 'YYYY-MM') BETWEEN '2019-12' AND '2020-01'
GROUP BY 1, 2),

dec_rnk AS (SELECT
*,
RANK() OVER(ORDER BY total_comments DESC) AS rnk
FROM cte
WHERE year_month = '2019-12'),

jan_rnk AS (SELECT
*,
RANK() OVER(ORDER BY total_comments DESC) AS rnk
FROM cte
WHERE year_month = '2020-01')


SELECT
d.country, d.rnk AS december_rank, j.rnk AS january_rank
FROM dec_rnk d
INNER JOIN jan_rnk j ON d.country = j.country
WHERE d.rnk >= j.rnk
