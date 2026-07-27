#Query 1 – Count unique users

SELECT
    step,
    COUNT(DISTINCT user_id) AS unique_users
FROM funnel_events
GROUP BY step;

#Query 2 – Calculate conversion rates

WITH stage_counts AS (
    SELECT
        step,
        COUNT(DISTINCT user_id) AS users,
        CASE
            WHEN step = 'visited_site' THEN 1
            WHEN step = 'signup_started' THEN 2
            WHEN step = 'details_filled' THEN 3
            WHEN step = 'email_verified' THEN 4
            WHEN step = 'purchase_completed' THEN 5
        END AS stage_order
    FROM funnel_events
    GROUP BY step
)

SELECT
    step,
    users,
    ROUND(
        (users / LAG(users) OVER (ORDER BY stage_order)) * 100,
        2
    ) AS conversion_rate
FROM stage_counts
ORDER BY stage_order;

#Query 3 – Biggest drop-off

WITH stage_counts AS (
    SELECT
        step,
        COUNT(DISTINCT user_id) AS users,
        CASE
            WHEN step = 'visited_site' THEN 1
            WHEN step = 'signup_started' THEN 2
            WHEN step = 'details_filled' THEN 3
            WHEN step = 'email_verified' THEN 4
            WHEN step = 'purchase_completed' THEN 5
        END AS stage_order
    FROM funnel_events
    GROUP BY step
),
conversion AS (
    SELECT
        step,
        users,
        ROUND(
            (users / LAG(users) OVER (ORDER BY stage_order)) * 100,
            2
        ) AS conversion_rate
    FROM stage_counts
)
SELECT *
FROM conversion
WHERE conversion_rate IS NOT NULL
ORDER BY conversion_rate ASC
LIMIT 1;

