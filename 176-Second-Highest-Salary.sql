-- Write your PostgreSQL query statement below
-- SELECT salary SecondHighestSalary
-- FROM (
--         SELECT salary, 
--         DENSE_RANK() OVER (ORDER BY salary DESC) rank
--         FROM employee
--     ) T
-- right join (select 1 rank
--             union
--             select 2) ranks
--         using(rank)
-- WHERE rank = 2
-- limit 1

SELECT MAX(salary) SecondHighestSalary
FROM employee
WHERE salary <> (select Max(salary) from employee)