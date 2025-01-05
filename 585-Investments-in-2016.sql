-- Write your PostgreSQL query statement below
SELECT ROUND(SUM(tiv_2016::decimal), 2) tiv_2016
FROM Insurance i
where tiv_2015 in (   
                    SELECT tiv_2015  
                    FROM Insurance
                    WHERE pid <> i.pid
                )
    AND (lat, lon) not in (
                    SELECT lat, lon
                    FROM Insurance
                    WHERE pid<> i.pid
    )
        