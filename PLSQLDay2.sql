--LIMIT:  limit the result row

SELECT * FROM actor LIMIT 10

--BETWEEN: give result in between givent condition and if we use NOT BETWEEN then it will exclude that condition and give the result

SELECT * FROM payment WHERE amount BETWEEN 1.99 AND 4.99;
SELECT * FROM payment WHERE amount NOT BETWEEN 1.99 AND 4.99

--IN: IN is use to get result in given condtion like we use multiple OR

SELECT * FROM address WHERE district IN('Alberta','QLD')
SELECT * FROM address WHERE district NOT IN ('Alberta','QLD')

--LIKE:Use to get a specific value using pattern match.
--Use for 0 or more charechter match. _ use for any singal charachter match

SELECT * FROM address WHERE address LIKE '%Avenue%'
SELECT * FROM address WHERE address LIKE 'Avenue'


/*Quetion: A "film" table has the replacement cost and rental duration for each movie.
Can you tell me that movies just title and revenue details sort by heighest to lowest rplacement cost and rented out for 4-6 weeks.
Also I don't want all data just give me 100 records
*/

SELECT title,rental_rate,replacement_cost FROM film WHERE rental_duration BETWEEN 4 AND 6 ORDER BY replacement_cost DESC LIMIT 100

/* Quetion:
I want a list of all movies that either have the rating 'G'or 'PG'.
The movie must be longher then 120 minutes in length and they should have the word Action any where in dicription
*/
SELECT * FROM film
SELECT title,film.description,length,rating FROM film WHERE length>120 AND (rating IN('G','PG') AND film.description LIKE ('%Action%'))


--AGGREGATE FUNCTIONS:   Compute the result using mathematical operation function

--Common Average Function

--AVG: Use for find average value of column
SELECT AVG(rental_rate) FROM film

--SUM: Use for find sum of the column value
SELECT SUM(rental_rate) FROM film

--MAX: find the maximum value from column
SELECT MAX(rental_rate) FROM film

--MIN: find the minimum value from column
SELECT MIN(rental_rate) FROM film

--ROUND: use for round the decimal 
SELECT ROUND(AVG(rental_rate),2) FROM film

--COUNT: use to find the count of row
SELECT COUNT(*) AS total_cont FROM film
SELECT COUNT(rating) FROM film WHERE rating='G'

--GROUP BY: Use to group the table colum. use with aggregate function
SELECT payment_id,payment_date,SUM(amount) as Total_Amount FROM payment  GROUP BY payment_date,payment_id ORDER BY SUM(amount) DESC

--HEAVING: use to fatch data from group.It is use in combining with the GROUP BY

SELECT payment_id,payment_date,SUM(amount) as Total_Amount FROM payment  
GROUP BY payment_date,payment_id HAVING SUM(amount)>=9.99
ORDER BY SUM(amount) DESC

--SUB QUERY: USE IN(SELECT) WHERE  COLUMN CONDITION(SELECT)

SELECT  title,rental_rate FROM film
WHERE rental_rate>(SELECT AVG(rental_rate) FROM film)

/* Quetion
The actor table has name of all actors. Can you tell me actor first name which are most common and how many time record it?
*/
SELECT first_name,COUNT(first_name) FROM actor
GROUP BY first_name
ORDER BY COUNT(first_name) DESC
