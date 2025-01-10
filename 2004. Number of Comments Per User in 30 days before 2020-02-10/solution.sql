SELECT 
user_id, 
SUM(number_of_comments) AS total_comments
FROM fb_comments_count
WHERE created_at >= '2020-02-10'::DATE -  INTERVAL '30 days' AND created_at <= '2020-02-10'::DATE
GROUP BY 1
ORDER BY 2 DESC