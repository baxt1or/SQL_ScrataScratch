SELECT
shipment_id
FROM (SELECT
shipment_id,
DENSE_RANK() OVER(ORDER BY weight DESC) AS rnk
FROM amazon_shipment) AS sub
WHERE rnk = 3