SELECT CAST('50' AS INTEGER);
SELECT CAST('2023-12-04' AS DATE);
SELECT CAST('50A' AS INTEGER); 
/* ERROR:  invalid input syntax for type integer: "50A"
LINE 2: SELECT CAST('50A' AS INTEGER); */

SELECT city_id,CAST(city_id AS VARCHAR) FROM address
SELECT address,CAST(address AS BIGINT) FROM address
--ERROR:  invalid input syntax for type bigint: "47 MySakila Drive"


--CASE: Conditional expression. Same as if-else 
/* syntex:
            CASE
                WHEN Condition1 THEN result_1
                WHEN Condition2 THEN result_2
                [WHEN......]
                [ELSE else_result]
            END
*/

SELECT rental_rate FROM film LIMIT  20;
SELECT film_id, title,rental_rate,
CASE
    WHEN rental_rate < 1 THEN 'budget'
    WHEN rental_rate >= 1 AND rental_rate <= 3 THEN 'Standard'
    WHEN rental_rate > 3 THEN 'Premium'
END AS MovieCategory
FROM film;

--NULLIF:

SELECT * FROM payment
SELECT amount AS USD,10/amount AS INR FROM payment
SELECT amount AS USD,ROUND(COALESCE(10/NULLIF(amount,0),0),3) AS INR FROM payment
SELECT amount AS USD,ROUND(COALESCE(10/NULLIF(amount,0),0),3) AS INR FROM payment WHERE ROUND(COALESCE(10/NULLIF(amount,0),0),3)=0

-- VIEW:VIRTUAL TABLE 

SELECT * FROM film LIMIT 10
SELECT * from "language"

CREATE VIEW movieLanguageWithCategory
AS
SELECT film.film_id,title,"language".language_id,"language"."name",rental_rate,
CASE
    WHEN rental_rate < 1 THEN 'budget'
    WHEN rental_rate >= 1 AND rental_rate <= 3 THEN 'Standard'
    WHEN rental_rate > 3 THEN 'Premium'
END AS MovieCategory
FROM film
JOIN "language"  
ON "language".language_id = film.language_id;

SELECT * FROM movieLanguageWithCategory
SELECT * FROM movieLanguageWithCategory 
WHERE film_id=2

DROP VIEW movielanguagewithcategory
SELECT * FROM movieLanguageWithCategory
/*ERROR:  relation "movielanguagewithcategory" does not exist
LINE 1: SELECT * FROM movieLanguageWithCategory
*/

--Question: The "Payment" table contain purchaase done by each customer. This table has the column "customer_id" with contains unique id of each customerand can be use to join the "customer" table to get each customer's first/last name and email address. I want to create a report that shows following columns:
--CustomerName-combination of first name and last name
--Email-email address of customer
--Total Rental- total purchase done by customer
--Customer category base on the following rule(Hint: Use 'CASE')
-- 'Elite'-Total Retals more than $200
--  'Platinum'-Total Rentals more than $150
--  'Gold'-Total rentals is more than $100
--  'silver'-total rental is more than $0


select * from payment limit 10
select * from customer limit 10

SELECT customer.customer_id,CONCAT(customer.first_name,customer.last_name) AS customerName,customer.email,sum(payment.amount) AS "Total Rental",
CASE
    WHEN SUM(payment.amount)>=200 THEN 'Elite'
    WHEN SUM(payment.amount)>=150 AND SUM(payment.amount)<200  THEN 'Platinum'
    WHEN SUM(payment.amount)>=100 AND SUM(payment.amount)<150 THEN 'Gold'
    WHEN SUM(payment.amount)>=0 AND SUM(payment.amount)<100 THEN 'silver'
END
FROM customer
JOIN payment 
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id,customerName,customer.email
ORDER BY customer.customer_id

--Question: Create view of above query

CREATE VIEW customerSagments
AS
SELECT customer.customer_id,CONCAT(customer.first_name,customer.last_name) AS customerName,customer.email,sum(payment.amount) AS "Total Rental",
CASE
    WHEN SUM(payment.amount)>=200 THEN 'Elite'
    WHEN SUM(payment.amount)>=150 AND SUM(payment.amount)<200  THEN 'Platinum'
    WHEN SUM(payment.amount)>=100 AND SUM(payment.amount)<150 THEN 'Gold'
    WHEN SUM(payment.amount)>=0 AND SUM(payment.amount)<100 THEN 'silver'
END
FROM customer
JOIN payment 
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id,customerName,customer.email
ORDER BY customer.customer_id

select * from customerSagments
