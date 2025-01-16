SELECT
*
FROM (SELECT
*,
CASE 
    WHEN TO_CHAR(time_stamp, 'HH24:MI') NOT BETWEEN '09::00' AND '16:00'
    OR EXTRACT(DOW FROM time_stamp) IN (0,6)
    OR time_stamp BETWEEN '2022-12-25' AND '2022-12-26' THEN 'Invalid'
    ELSE 'Valid'
END AS status
FROM boi_transactions
WHERE TO_CHAR(time_stamp, 'YYYY-MM') = '2022-12') AS sub
WHERE status = 'Invalid'
