-- Write your PostgreSQL query statement below
WITH salary_categories_tb AS (
    SELECT account_id, income,
        CASE 
            WHEN income < 20000 then 'Low Salary'
            WHEN income between 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END Category
    from accounts
), categories as  (
    SELECT 'Low Salary' AS category
    union all
    SELECT 'Average Salary' 
    union all
    SELECT 'High Salary'
)
SELECT sc.Category, COALESCE(COUNT(s.account_id), 0) accounts_count
FROM categories sc
LEFT JOIN 
    salary_categories_tb s
ON 
    sc.category = s.Category
GROUP BY 
    sc.category;


-- SELECT 'Low Salary' category, SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) as accounts_count
-- FROM accounts

-- UNION ALL

-- SELECT 'Average Salary' category, SUM(CASE WHEN income between 20000 and 50000 THEN 1 ELSE 0 END) as accounts_count
-- FROM accounts 

-- UNION ALL

-- SELECT 'High Salary' category, SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) as accounts_count
-- FROM accounts

