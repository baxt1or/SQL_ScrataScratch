SELECT
p.user_id, 
p.signup_date,
COUNT(CASE WHEN p.signup_date + INTERVAL '30 days' >= u.activity_date THEN 1 END) AS total_logins
FROM user_profiles p
INNER JOIN user_activities u ON p.user_id = u.user_id
GROUP BY 1, 2
HAVING COUNT(CASE WHEN p.signup_date + INTERVAL '30 days' >= u.activity_date THEN 1 END) >= 1