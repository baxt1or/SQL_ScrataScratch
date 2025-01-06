SELECT
DISTINCT host_id, n_beds,
DENSE_RANK() OVER(ORDER BY n_beds DESC) AS rnk
FROM airbnb_apartments
ORDER BY rnk ASC