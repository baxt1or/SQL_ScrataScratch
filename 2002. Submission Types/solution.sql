SELECT
user_id
FROM loans
WHERE type = 'Refinance' OR type = 'InSchool'
GROUP BY 1
HAVING COUNT(*) >= 2