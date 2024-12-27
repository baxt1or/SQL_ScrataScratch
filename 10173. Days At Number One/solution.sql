-- Write your PostgreSQL query statement below
SELECT
a.trackname, 
COUNT(*)
FROM spotify_daily_rankings_2017_us a
INNER JOIN spotify_worldwide_daily_song_ranking ww ON a.trackname = ww.trackname AND a.date = ww.date
WHERE a.position =1 AND ww.position = 1 AND ww.region = 'us'
GROUP BY 1
ORDER BY 1, 2 DESC