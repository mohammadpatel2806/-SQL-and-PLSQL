--JOINS QUESTIONS
--QUESTION: I want something to analyse the pattern between film language and its rental rate. Send me a data extract( a report) that show language of each movie, its title and reltal rate

SELECT "language".name,film.title,film.rental_rate FROM film
JOIN "language"
ON "language".language_id = film.language_id

--QUESTION: Show me a list of actor and count of movies they have acted in. Sort it in a way that the actor who has done most movie is at top
SELECT CONCAT(actor.first_name, ' ',actor.last_name) AS "Actro Name" ,COUNT(film.film_id) FROM actor
JOIN film_actor
ON film_actor.actor_id = actor.actor_id
JOIN film
ON film.film_id = film_actor.film_id
GROUP BY "Actro Name"
ORDER BY COUNT DESC

--QUESTION: I want to careate report that shows the different rating of all movies and count of movies that have been rented of each rating
SELECT film.rating,COUNT(rental.rental_id) 
FROM film
RIGHT JOIN inventory ON inventory.film_id = film.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
GROUP BY rating