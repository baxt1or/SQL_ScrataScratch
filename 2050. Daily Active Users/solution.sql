SELECT
account_id,
ROUND(AVG(total_users), 2) AS avg_users
FROM (SELECT
account_id, 
date, 
COUNT(DISTINCT user_id) AS total_users
FROM sf_events
WHERE TO_CHAR(date, 'YYYY-MM') = '2021-01'
GROUP BY account_id, date) AS sub
GROUP BY 1