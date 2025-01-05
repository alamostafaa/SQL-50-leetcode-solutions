-- Write your PostgreSQL query statement below
-- DELETE FROM Person
-- WHERE id not in (
--             select MIN(id)
--             from (SELECT id 
--                   FROM person i
--                   where email in (select email from person where id <> i.id ))
--             union
--             SELECT id
--             from person i 
--             where eamil not in (select email from person where id <> i.id ))


DELETE FROM person P1
USING person P2
WHERE P1.email = P2.email
  AND P1.id > P2.id;