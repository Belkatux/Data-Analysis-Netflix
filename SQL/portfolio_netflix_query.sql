-- TV SHOWS x MOVIES
SELECT type, count(type) as quantity FROM movie_desc
GROUP BY type;

-- TV SHOWS X MOVIES BY YEAR
SELECT type, count(type) as quantity FROM movie_desc
WHERE date_added = '2020'
GROUP BY type;

-- TV SHOWS OR MOVIES BY YEAR TABLE
CALL tvmovies('Movie');

-- NUMBER OF TV SHOWS AND THEIR DURATION
SELECT duration, count(*) from movie_desc
WHERE type = 'TV Show'
GROUP BY duration;

-- DESCRIPTION AND NAME OF THE LONGEST TV SHOW
select movie_desc.*, title from title
INNER JOIN movie_desc
ON movie_desc.show_id = title.show_id
where duration = '16 Seasons';

-- TV RATINGS
SELECT rating, count(*) FROM movie_desc
GROUP BY rating;

-- COUNTRY
SELECT country, count(*) FROM country
GROUP BY country
ORDER BY count(*) DESC;

-- COUNT OF TV RATING IN THE UNITED STATES
SELECT rating, count(*) FROM movie_desc
INNER JOIN country
ON movie_desc.show_id = country.show_id
WHERE country = 'United States'
GROUP BY rating
ORDER BY count(*) DESC;

-- NUMBER OF SEASONS OF FRIENDS
SELECT duration FROM movie_desc
INNER JOIN title
ON movie_desc.show_id = title.show_id
WHERE title = 'Friends';

-- TV SHOW OR MOVIE BY RATING
SELECT genre_1, count(*) FROM genre
INNER JOIN movie_desc
ON genre.show_id = movie_desc.show_id
WHERE type = 'Movie'
GROUP BY genre_1
ORDER BY count(*) DESC;
