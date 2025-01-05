-- Write your PostgreSQL query statement below
WITH rank_salaries AS (
    SELECT d.name Department, e.name Employee, e.salary,
           DENSE_RANK() OVER (Partition by d.name ORDER BY e.salary DESC) salary_rank
    FROM employee e
    JOIN department d
        ON d.id = e.departmentId
)
SELECT Department, Employee, salary
FROM rank_salaries
WHERE salary_rank < 4


