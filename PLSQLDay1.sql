--Folter 3 SELECT QUERY 
SELECT title,film_id FROM film
SELECT * FROM film

--FLOTDER 3 WHERE QUERY
SELECT * FROM film WHERE rental_rate>3

select * from payment

/*
	The Payment Table store ids and amount they have paid. I want to get the list of customers ids that have rented out movies 
	that cost 7.99 or more So i can put into platinum category and send the coupen later.
*/
SELECT DISTINCT customer_id as Platinum_members FROM payment where amount>=7.99 

/*
	The film table contain details of films we rent, including their name, rental cost and replacement cose. Take a look at the
	table and generate a query that tell me high value films,meaning
	1. Have rental rate more than 2.99 OR
	2. replacemnt cost is more then 19.99
*/

SELECT title as Movie,rental_rate,replacement_cost FROM film WHERE rental_rate>2.99 OR replacement_cost>19.99 