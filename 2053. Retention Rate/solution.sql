WITH cte AS (
    SELECT 
        account_id,
        COUNT(DISTINCT user_id) AS total_users
    FROM sf_events
    WHERE TO_CHAR(date, 'YYYY-MM') = '2021-01'
    GROUP BY 1
),

cte2 AS (
    SELECT 
        account_id,
        COUNT(DISTINCT user_id) AS retained_users
    FROM sf_events
    WHERE TO_CHAR(date, 'YYYY-MM') > '2021-01'
    AND user_id IN (
        SELECT DISTINCT user_id
        FROM sf_events
        WHERE TO_CHAR(date, 'YYYY-MM') = '2021-01'
    )
    GROUP BY account_id
),

jan AS (
    SELECT
        cte.account_id,
        COALESCE(cte2.retained_users * 1.0 / cte.total_users, 0) AS retention_rate
    FROM cte
    LEFT JOIN cte2 ON cte.account_id = cte2.account_id
),

cte4 AS (
    SELECT
        account_id,
        COUNT(DISTINCT user_id) AS total_users
    FROM sf_events
    WHERE TO_CHAR(date, 'YYYY-MM') = '2020-12'
    GROUP BY 1
),

cte5 AS (
    SELECT
        account_id,
        COUNT(DISTINCT user_id) AS retained_users
    FROM sf_events
    WHERE TO_CHAR(date, 'YYYY-MM') > '2020-12'
    AND user_id IN (
        SELECT DISTINCT user_id
        FROM sf_events
        WHERE TO_CHAR(date, 'YYYY-MM') = '2020-12'
    )
    GROUP BY account_id
),

dec AS (
    SELECT
        cte4.account_id, 
        COALESCE(cte5.retained_users * 1.0 / cte4.total_users, 0) AS retention_rate
    FROM cte4
    LEFT JOIN cte5 ON cte4.account_id = cte5.account_id
)

SELECT
    j.account_id, 
    COALESCE(j.retention_rate / d.retention_rate, 0) AS retention_rate_ratio
FROM jan j
INNER JOIN dec d ON j.account_id = d.account_id;
