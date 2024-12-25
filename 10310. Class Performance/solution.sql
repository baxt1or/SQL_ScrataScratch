-- Write your PostgreSQL query statement below
SELECT
MAX(assignment1 + assignment2 + assignment3) -
MIN(assignment1 + assignment2 + assignment3) AS largest_difference
FROM box_scores