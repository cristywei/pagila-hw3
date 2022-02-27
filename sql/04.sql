/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT tch.first_name, tch.last_name
FROM (
    SELECT first_name, last_name, actor_id, name AS c1
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
) tch
JOIN (
    SELECT first_name, last_name, actor_id, name AS c2
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
) th ON (tch.actor_id = th.actor_id)
WHERE c1 = 'Children' AND c2 != 'Horror'
GROUP BY (tch.first_name, tch.last_name)
ORDER BY last_name;
