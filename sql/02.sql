/*
 * Compute the country with the most customers in it. 
 */
SELECT t.country
FROM (
    SELECT country, COUNT(customer_id)
    FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    GROUP BY country
    ORDER BY count DESC limit 1
) t;
