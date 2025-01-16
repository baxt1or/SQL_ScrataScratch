SELECT
*
FROM (SELECT
*,
MAX(login_timestamp) OVER(PARTITION BY worker_id) AS recent_login
FROM worker_logins) AS sub
WHERE login_timestamp = recent_login