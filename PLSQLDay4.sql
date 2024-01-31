--DATE TIME DIFFERENT FORMET
SELECT CURRENT_DATE; --CURRENT DATE
SELECT CURRENT_TIME; --CURRENT TIME
SELECT CURRENT_TIMESTAMP; --CURRENT TIME STEMP
SELECT NOW(); --CURRENT TIME DATE WITH TIME STAMP
SELECT AGE(NOW(),'2003-06-17'); --CALCULATE DIFFERENCE
SELECT TO_DATE('20040617','YYYYMMDD'); --STRING TO DATE FORMET


--EXTRECT
SELECT * FROM film
select last_update, EXTRACT(DAY from last_update) FROM film limit 50;
select last_update, EXTRACT(MONTH from last_update) FROM film limit 50;
select last_update, EXTRACT(YEAR from last_update) FROM film limit 50;
select last_update, EXTRACT(QUARTER from last_update) FROM film limit 50;

--MATHEMATICS FUNCTIONS
--ABS():Absolute value
--MOD(X,Y): mode of x and y
--POWER(X,Y): power of x with y
--ROUND(X,Y): round x by y decimal place
--TRUNCATE(X,Y): truncate the x by y place

SELECT ABS(-20);
SELECT MOD(7,5);
SELECT POWER(2,5);
SELECT ROUND(45.222221,3);
SELECT TRUNCATE(4.22141,2);

--STRING FUNCTIONS
--COCATE(STR,STR);
--LENGHT(TEXT)
--LEFT(TEXT,N)
--POSITION(SUBSTRING IN STRING)
--SUBSTR(TEXT,START,[COUNT])

SELECT CONCAT(first_name,last_name) from actor;
SELECT LENGTH(first_name) FROM actor;
SELECT LEFT(first_name,2) FROM actor LIMIT 10;
SELECT SUBSTR(first_name,1,2) FROM actor;

--QUESTION: The "rental" table has fields for rental_date(when the movie was rented), and return_date(when it was returned). We want to reach out the customers whose rental duration was 7 or more days, and send them an email. Can you create a report for me that lists down following column:
--Rental Date
--Return Date
--Rent_Duration
--Customer First name
--Customer Last Name
--Customer Email

SELECT * FROM rental
SELECT * FROM customer

SELECT retal_date,return_date,AGE(return_date,rental_date),customer.first_name,customer.last_name,customer.email FROM rental
JOIN customer
ON rental.customer_id=customer.customer_id;
