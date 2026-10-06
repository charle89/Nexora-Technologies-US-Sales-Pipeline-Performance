CREATE DATABASE us_sales_analysis;

USE us_sales_analysis;

select * from us_sales_analysis;

SELECT COUNT(*) AS total_records
FROM us_sales_analysis;

--- Start with data-quality analysis
--- This is important because it demonstrates that you're not just creating charts—you know how to validate data.
-- Check missing values
SELECT
    customer,
    state,
    `sales rep`,
    product,
    `sales stage`,
    `Deal Value (USD)`,
    `lead source`,
    `close date`,
    COUNT(*) AS duplicate_count
FROM us_sales_analysis
GROUP BY
    customer,
    state,
    `sales rep`,
    product,
    `sales stage`,
    `Deal Value (USD)`,
    `lead source`,
    `close date`
HAVING COUNT(*) > 1;

--- Overall sales analysis
--- Total opportunities
SELECT COUNT(*) AS total_opportunities
FROM us_sales_analysis;

-- Total pipeline value
create view `total pipeline value` as
SELECT
    SUM(`deal value (usd)`) AS total_pipeline_value
FROM us_sales_analysis;

--- Average deal value
create view `average deal value` as
SELECT
    ROUND(AVG(`Deal Value (USD)`), 2) AS average_deal_value
FROM us_sales_analysis;

--- Minimum and maximum deal
create view `maximum and minimum deal` as
SELECT
    MIN(`Deal Value (USD)`) AS smallest_deal,
    MAX(`Deal Value (USD)`) AS largest_deal
FROM us_sales_analysis;

--- Sales performance by sales rep
create view `sales perfomance by sales rep` as
SELECT
    `sales rep`,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value,
    ROUND(AVG(`Deal Value (USD)`), 2) AS average_deal
FROM `us_sales_analysis`
GROUP BY `sales rep`
ORDER BY pipeline_value DESC;

-- Sales performance by product
create view `sales perfomance by product` as
SELECT
    product,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value,
    ROUND(AVG(`Deal Value (USD)`), 2) AS average_deal
FROM us_sales_analysis
GROUP BY product
ORDER BY pipeline_value DESC;

--- Lead source analysis

-- This is important because management will want to know:

-- Which channels generate the most valuable opportunities?
create view `lead source` as
SELECT
    `lead source`,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value,
    ROUND(AVG(`Deal Value (USD)`), 2) AS average_deal
FROM us_sales_analysis
GROUP BY `lead source`
ORDER BY pipeline_value DESC;

--- Sales funnel analysis

-- This is probably your most important visualization.
create view `sales funnel` as
SELECT
    `sales stage`,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value
FROM us_sales_analysis
GROUP BY `sales stage`
ORDER BY
    CASE `sales stage`
        WHEN 'New Lead' THEN 1
        WHEN 'Contacted' THEN 2
        WHEN 'Qualified' THEN 3
        WHEN 'Proposal Sent' THEN 4
        WHEN 'Negotiation' THEN 5
        WHEN 'Closed Won' THEN 6
        WHEN 'Closed Lost' THEN 7
    END;
    
    -- Calculate win rate
    create view `win rate` as
SELECT
    COUNT(CASE WHEN `sales stage` = 'Closed Won' THEN 1 END) AS closed_won,
    COUNT(CASE WHEN `sales stage` = 'Closed Lost' THEN 1 END) AS closed_lost,
    ROUND(
        COUNT(CASE WHEN `sales stage` = 'Closed Won' THEN 1 END) * 100.0 /
        NULLIF(
            COUNT(CASE
                WHEN `sales stage` IN ('Closed Won', 'Closed Lost')
                THEN 1
            END), 0
        ),
        2
    ) AS win_rate
FROM us_sales_analysis;

--- Win rate by sales rep

--- This is an excellent Power BI visual.
create view `win rate by sales rep` as
SELECT
    `sales rep`,
    COUNT(CASE WHEN `sales stage` = 'Closed Won' THEN 1 END) AS won,
    COUNT(CASE WHEN `sales stage` = 'Closed Lost' THEN 1 END) AS lost,
    ROUND(
        COUNT(CASE WHEN `sales stage` = 'Closed Won' THEN 1 END) * 100.0 /
        NULLIF(
            COUNT(CASE
                WHEN `sales stage` IN ('Closed Won', 'Closed Lost')
                THEN 1
            END), 0
        ),
        2
    ) AS win_rate
FROM us_sales_analysis
GROUP BY `sales rep`
ORDER BY win_rate DESC;

--- Monthly sales analysis

--- Create a monthly view:
create view `mothly view` as
SELECT
    DATE_FORMAT(`close date`, '%Y-%m') AS month,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value,
    SUM(
        CASE
            WHEN `sales stage` = 'Closed Won'
            THEN `Deal Value (USD)`
            ELSE 0
        END
    ) AS won_value
FROM us_sales_analysis
GROUP BY DATE_FORMAT(`close date`, '%Y-%m')
ORDER BY month;
create view `geography analysis` as
SELECT
    state,
    COUNT(*) AS opportunities,
    SUM(`Deal Value (USD)`) AS pipeline_value,
    ROUND(AVG(`Deal Value (USD)`), 2) AS average_deal
FROM us_sales_analysis
GROUP BY state
ORDER BY pipeline_value DESC;