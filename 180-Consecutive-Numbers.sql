-- Write your PostgreSQL query statement below
WITH num_consecutive AS (
    SELECT num,
            lag(num, 1) over (order by id) prev1,
            lag(num, 2) over (order by id) prev2
    FROM logs
)
SELECT DISTINCT num ConsecutiveNums
-- select *
FROM num_consecutive
WHERE num = prev2 and num = prev1

