-- Write your PostgreSQL query statement below
with daily_amounts as (

    select visited_on, sum(amount) amount
    from customer
    group by visited_on
    order by visited_on

),
    window_time_analysis as (
        SELECT  visited_on,
                ROUND(SUM(amount) over (
                    ORDER BY visited_on
                    rows between 6 preceding and current row
                ), 2) AS amount, 
                ROUND(AVG(amount) over (
                    ORDER BY visited_on
                    rows between 6 preceding and current row
                ), 2) AS average_amount,
                COUNT(*) OVER (
                    ORDER BY visited_on
                    rows between 6 preceding and current row
                ) day_count
        FROM daily_amounts
)
select visited_on, amount, average_amount
from window_time_analysis
where day_count = 7
