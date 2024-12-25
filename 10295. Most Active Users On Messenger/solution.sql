-- Write your PostgreSQL query statement below
WITH users AS (SELECT user1 AS username,msg_count FROM fb_messages
UNION ALL
SELECT user2,msg_count FROM fb_messages)

SELECT
username,
SUM(msg_count) AS total
FROM users
GROUP BY 1
ORDER BY total DESC
LIMIT 10