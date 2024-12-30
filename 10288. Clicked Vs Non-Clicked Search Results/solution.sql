SELECT
ROUND(COUNT(CASE WHEN search_results_position <= 3 AND clicked = 1 THEN 1 END) * 1.0 /
COUNT(*) * 100, 2) AS top_3_clicked,
ROUND(COUNT(CASE WHEN search_results_position <= 3 AND clicked = 0 THEN 1 END) * 1.0 /
COUNT(*) * 100, 2) AS top_3_notclicked
FROM fb_search_events
