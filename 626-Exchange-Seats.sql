-- Write your PostgreSQL query statement below
SELECT  case
          when id%2 = 1 and nxt is not null then nxt
          when id%2 = 0 then prv
          when nxt is null then id
        end as \id\, 
        student
FROM (
    SELECT *, lead(id, 1) over () nxt, lag(id, 1) over () prv
    FROM seat
) t
ORDER BY id 
