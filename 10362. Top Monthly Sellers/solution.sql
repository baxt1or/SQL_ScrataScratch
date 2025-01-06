SELECT
seller_id, total_sales, product_category, market_place, sales_date
FROM sales_data
WHERE TO_CHAR(sales_date, 'YYYY-MM') = '2024-01'
ORDER BY total_sales DESC
LIMIT 3