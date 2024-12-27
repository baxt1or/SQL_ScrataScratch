-- Write your PostgreSQL query statement below
SELECT
a.product_id, a.product_name,
COUNT(b.transaction_id) AS total_transactions
FROM excel_sql_inventory_data a
INNER JOIN excel_sql_transaction_data b ON a.product_id = b.product_id
GROUP BY 1,2
ORDER BY 1 