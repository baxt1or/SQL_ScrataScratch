SELECT
   user_id, stream_total AS streams, viewer_total AS viewers
FROM (SELECT
   user_id, 
   COUNT(CASE WHEN session_type = 'streamer' THEN 1 END) AS stream_total,
   COUNT(CASE WHEN session_type = 'viewer' THEN 1 END) AS viewer_total,
   ROW_NUMBER()  OVER(ORDER BY COUNT(CASE WHEN session_type = 'streamer' THEN 1 END) DESC) AS rnk
FROM twitch_sessions
   GROUP BY 1
   HAVING COUNT(CASE WHEN session_type = 'streamer' THEN 1 END) > COUNT(CASE WHEN session_type = 'viewer' THEN 1 END)) AS sub
WHERE rnk <= 3