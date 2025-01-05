-- Write your PostgreSQL query statement below
SELECT *
FROM users
WHERE mail ~ '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$'
