SELECT
ROUND(COUNT(CASE WHEN status = 'closed' AND date = '2020-01-10' THEN acc_id END) *1.0/
COUNT(CASE WHEN date = '2020-01-10' THEN acc_id END), 2) AS closed_ratio
FROM fb_account_status
