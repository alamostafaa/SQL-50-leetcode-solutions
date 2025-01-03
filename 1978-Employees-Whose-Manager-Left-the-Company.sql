-- Write your PostgreSQL query statement below
SELECT employee_id
FROM employees
WHERE salary <30000
    AND manager_id not in (SELECT employee_id from employees)
order by employee_id