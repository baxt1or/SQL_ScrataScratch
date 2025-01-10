SELECT
post_date, 
COUNT(post_id) AS total_posts
FROM facebook_posts
GROUP BY 1