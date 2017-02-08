-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.
SELECT movies.rating, movies.title
FROM movies ORDER BY rating LIMIT 50;


-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.
SELECT movies.rating, movies.title
FROM movies WHERE movies.rating is NULL ORDER BY movies.title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.
SELECT movies.title
FROM movies WHERE movies.synopsis LIKE '%thrilling%';


-- 4. What were the highest rated ç movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- science fiction movies in 80s
-- movie title, year released, rating
-- sort by rating

SELECT movies.title, movies.year, movies.rating
FROM movies join genres
ON movies.genre_id = genres.id
WHERE genres.name = 'Science Fiction & Fantasy' AND movies.year BETWEEN 1980 AND 1989
ORDER BY movies.rating DESC;


-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- actors in James Bond
-- actor name, movie title, year
-- sorted in asc

SELECT actors.name, movies.title, movies.year
FROM cast_members
JOIN movies
ON cast_members.movie_id = movies.id
JOIN actors
ON actors.id = cast_members.actor_id
WHERE cast_members.character = 'James Bond'
ORDER BY movies.year ASC;


-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- movies with actor julianne Moore
-- movie title, year realeased, genre
-- sort by genre first, movie title

SELECT movies.title, movies.year, genres.name
FROM movies
JOIN genres
ON genres.id = movies.genre_id
JOIN cast_members
ON cast_members.movie_id = movies.id
JOIN actors
ON cast_members.actor_id = actors.id
WHERE actors.name = 'Julianne Moore'
ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title, movies.year, studios.name
FROM movies
JOIN genres
ON movies.genre_id = genres.id
JOIN studios
ON movies.studio_id = studios.id
WHERE genres.name = 'Horror'
ORDER BY movies.year LIMIT 5;

-- include movie title, year released, studio  ORDER BY year
-- five earliest horror movies
-- studio name
