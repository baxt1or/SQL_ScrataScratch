SELECT
   user_id
FROM twitch_sessions
   GROUP BY 1
   HAVING COUNT(DISTINCT session_type) = 2