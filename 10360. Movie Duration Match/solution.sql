SELECT
s.flight_id, c.movie_id,c.title, c.duration
FROM entertainment_catalog c
INNER JOIN flight_schedule s ON c.duration <= s.flight_duration