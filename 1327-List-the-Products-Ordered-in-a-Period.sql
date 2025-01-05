-- Write your PostgreSQL query statement below
select person_name
from (
    select person_name, 
        sum(weight) over (order by turn) total_weights
    from queue  
) temp
where total_weights <= 1000
order by total_weights DESC
limit 1;