-- A)
-- Kreditanvändning: 15 krediter för en 30-dagars månad.
-- Pris per kredit:  $3.90 USD.
-- Total månadskostnad: Cirka $58.50 USD.

WITH compute_cost AS (
    SELECT 
        0.5 AS credits_per_day,
        30 AS days_in_month,
        3.90 AS price_per_credit
)
SELECT 
    credits_per_day * days_in_month AS total_credits,
    (credits_per_day * days_in_month) * price_per_credit AS total_cost
FROM 
    compute_cost;

-- B) 
WITH compute_cost AS (
    SELECT 
        2.0 AS credits_per_day_1,
        1.5 AS credits_per_day_2,
        1.0 AS credits_per_day_3,
        10 AS days_in_period,
        3.90 AS price_per_credit
)
SELECT 
    (credits_per_day_1 * days_in_period) + 
    (credits_per_day_2 * days_in_period) + 
    (credits_per_day_3 * days_in_period) AS total_credits,
    
    ((credits_per_day_1 * days_in_period) + 
    (credits_per_day_2 * days_in_period) + 
    (credits_per_day_3 * days_in_period)) * price_per_credit AS total_cost
FROM 
    compute_cost;

-- C) 
WITH warehouse_usage AS (
    SELECT
        'A' AS warehouse,
        'XS' AS size,
        1.0 AS credits_per_hour,
        10 AS hours_per_day,
        30 AS days_in_month,
        3.90 AS price_per_credit
    UNION ALL
    SELECT
        'B' AS warehouse,
        'S' AS size,
        2.0 AS credits_per_hour,
        2 AS hours_per_day,
        30 AS days_in_month,
        3.90 AS price_per_credit
    UNION ALL
    SELECT
        'C' AS warehouse,
        'M' AS size,
        4.0 AS credits_per_hour,
        1 AS hours_per_day,
        30 AS days_in_month,
        3.90 AS price_per_credit
),
costs AS (
    SELECT
        warehouse,
        size,
        credits_per_hour * hours_per_day * days_in_month AS total_credits,
        (credits_per_hour * hours_per_day * days_in_month) * price_per_credit AS total_cost
    FROM
        warehouse_usage
)
SELECT
    warehouse,
    size,
    total_credits,
    total_cost
FROM
    costs
UNION ALL
SELECT
    'Total' AS warehouse,
    NULL AS size,
    SUM(total_credits) AS total_credits,
    SUM(total_cost) AS total_cost
FROM
    costs;

-- D) 
WITH period_usage AS (
    SELECT
        'First 10 Days' AS period,
        2 AS clusters,
        10 AS hours_per_day,
        10 AS days_in_period,
        1 AS credits_per_hour_per_cluster,
        3.90 AS price_per_credit
    UNION ALL
    SELECT
        'Next 10 Days' AS period,
        3 AS clusters,
        10 AS hours_per_day,
        10 AS days_in_period,
        1 AS credits_per_hour_per_cluster,
        3.90 AS price_per_credit
    UNION ALL
    SELECT
        'Last 10 Days' AS period,
        4 AS clusters,
        10 AS hours_per_day,
        10 AS days_in_period,
        1 AS credits_per_hour_per_cluster,
        3.90 AS price_per_credit
),
cost_calculations AS (
    SELECT
        period,
        clusters,
        hours_per_day,
        days_in_period,
        clusters * hours_per_day * days_in_period * credits_per_hour_per_cluster AS total_credits,
        (clusters * hours_per_day * days_in_period * credits_per_hour_per_cluster) * price_per_credit AS total_cost
    FROM
        period_usage
)
SELECT
    period,
    clusters,
    hours_per_day,
    days_in_period,
    total_credits,
    total_cost
FROM
    cost_calculations
UNION ALL
SELECT
    'Total' AS period,
    NULL AS clusters,
    NULL AS hours_per_day,
    NULL AS days_in_period,
    SUM(total_credits) AS total_credits,
    SUM(total_cost) AS total_cost
FROM
    cost_calculations;

