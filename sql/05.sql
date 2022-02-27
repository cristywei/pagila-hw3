/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
SELECT title
FROM film
JOIN film_actor USING (film_id)
JOIN film_actor fa2 ON (fa2.actor_id = film_actor.actor_id)
--WHERE actor_id 
ORDER BY title;
