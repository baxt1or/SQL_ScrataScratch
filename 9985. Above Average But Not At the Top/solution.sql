SELECT
id, employeename,total_earned
FROM (SELECT
id, employeename, 
SUM(totalpaybenefits) AS total_earned,
DENSE_RANK() OVER(ORDER BY AVG(totalpaybenefits) DESC) AS rnk
FROM sf_public_salaries
WHERE year = 2013
GROUP BY 1, 2
HAVING SUM(totalpaybenefits) > (SELECT AVG(totalpaybenefits) FROM sf_public_salaries WHERE year = 2013)) AS sub
WHERE rnk >= 6
ORDER BY total_earned DESC