SELECT
gender, 
COUNT(appointmentid) AS total_orders
FROM medical_appointments
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1