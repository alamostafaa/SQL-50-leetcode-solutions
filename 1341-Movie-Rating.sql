-- Write your PostgreSQL query statement below

-- getting the user with the highest rating count
with highest_rating_user_tb as (
    select name, count(m.movie_id) rating_count
    from users u
    join movieRating m on u.user_id = m.user_id
    group by name
    order by rating_count DESC, name
    limit 1
), 
-- Getting the movie name with highest average!
  highest_rating_movie_tb as (
    SELECT m.movie_id, m.title, avg(mr.rating) avg_rating
    FROM movies m
    join movieRating mr ON m.movie_id = mr.movie_id
    where to_char(created_at, 'YYYY-MM') = '2020-02' 
    GROUP BY 1, 2
    order by avg_rating desc, m.title
    limit 1
)

select name results
from highest_rating_user_tb

union all

select title
from highest_rating_movie_tb
