-- Write your PostgreSQL query statement below
SELECT sell_date, count(DISTINCT product) num_sold,
        string_agg(DISTINCT product, ',' order by product) as products
FROM activities
GROUP BY sell_date
ORDER BY sell_date