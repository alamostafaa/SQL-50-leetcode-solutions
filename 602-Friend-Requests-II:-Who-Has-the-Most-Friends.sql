-- Write your PostgreSQL query statement below
-- with sent_requests as 
-- (
--     select requester_id, COUNT(*) sent_count
--     FROM RequestAccepted
--     GROUP BY 1
-- ), accepted_requests as 
-- (
--     select accepter_id, count(*) accepted_count
--     FROM RequestAccepted
--     GROUP BY 1
-- )
-- SELECT case 
--             when requester_id is null then accepter_id
--             else requester_id
--         END as id,
--         total_friends as num
-- FROM ( 
--     SELECT requester_id, accepter_id, coalesce(sent_count,0) + coalesce(accepted_count,0) total_friends
--     FROM sent_requests s
--     full outer JOIN  accepted_requests a
--         ON  s.requester_id = a.accepter_id
--     ORDER BY 3 DESC
--     LIMIT 1
-- )

WITH ids as (
    SELECT requester_id ID
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id ID
    FROM RequestAccepted
)
SELECT id, count(*) num
FROM IDS
GROUP BY id
ORDER BY num DESC
LIMIT 1
