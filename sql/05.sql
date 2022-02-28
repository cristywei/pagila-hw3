/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
WITH american_circus AS (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title = 'AMERICAN CIRCUS')

SELECT title
FROM film
JOIN film_actor f1 USING (film_id)
JOIN film_actor f2 ON f2.actor_id != f1.actor_id AND f2.film_id = film.film_id 
WHERE f1.actor_id IN (
    SELECT actor_id FROM american_circus)
AND f2.actor_id IN (
    SELECT actor_id FROM american_circus)
GROUP BY title
ORDER BY title;
