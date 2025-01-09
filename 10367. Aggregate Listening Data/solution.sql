SELECT
user_id, 
ROUND(SUM(listen_duration)::NUMERIC * 1.0 / 60 , 0) AS total_duration,
COUNT(DISTINCT song_id) AS total_songs
FROM listening_habits
GROUP BY 1