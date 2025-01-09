SELECT
COUNT(DISTINCT r.user_id) AS total_users
FROM rc_calls r
INNER JOIN rc_users u ON r.user_id = u.user_id
WHERE u.status = 'paid' AND TO_CHAR(r.date , 'YYYY-MM') = '2020-04'