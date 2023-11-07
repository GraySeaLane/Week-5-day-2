--HOMEWORK--

---1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(first_name)
FROM actor
WHERE last_name = 'Wahlberg'

--2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount <= 5.99 AND amount >= 3.99;

--3. What film does the store have the most of? (search in inventory)
SELECT COUNT (film_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT (film_id) DESC;

--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William'


--5. What store employee (get the id) sold the most rentals?
SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id;

--6. How many different district names are there?
SELECT COUNT(DISTINCT(district))
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT COUNT(film_id), film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id)DESC; 

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT (customer_id)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT COUNT(rating), rating
FROM film
GROUP BY rating 
ORDER BY COUNT(rating)DESC;


--NOTES BELOW--


--Select all records from after table query
--*all columns
--columns name in the SELECT statement will show up in the query output

SELECT *
FROM actor;

--Query for actor first and last name
SELECT first_name, last_name
FROM actor;

--Where clause brings back info based on provided condition
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

--Query using like, LIKE is similar to equal(=), but more forgiving
--% wild card character that stands for anything that could occupy that space
--QUERY A NAME THAT STARTS WITH A J
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

--__ underscores are a placeholder for characters

--Query for first names 3 letter word first names that start with k
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

--COMPARING OPERATORS ARE:
-- GREATER THAN >
--LESS THAN <
--GREATER OR EQUAL >=
--LESS OR EQUAL <=
-- NOT EQUAL <>

SELECT *
FROM payment;
-- query for data that shows customers who have paid an amount
--greater than $2.99

SELECT customer_id, amount
FROM payment
WHERE amount > 2.99;

--where clause is similar to if statement where we are asking a question
--of our data

--same thing but <

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--same but >= to
SELECT customer_id, amount
FROM payment
WHERE amount < .99;

--same <= 

SELECT customer_id, amount
FROM payment
WHERE amount <= .99;

--not equal <>
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00;

--ORDER BY CLAUSE, IT ORGANIZES THE DATA BUT ASCending OR CAN SWITCH TO DESCending
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC, customer_id DESC
--LIMIT 1;

--SQL Aggregates (runs calc)
-- SUM(), AVG(), COUNT(), MIN(), MAX()

--Query to display amounts above 5.99
SELECT SUM (amount) AS sum_amount
FROM payment
WHERE amount > 5.99;

SELECT payment_date
FROM payment
ORDER BY payment_date ASC;

--Query to display average payment amount
--ROUND BY 2 DEC PLACES

SELECT ROUND(AVG(amount),2)
FROM payment;

SELECT *
FROM rental

--query to display the count of amounts greater than 5.99

SELECT COUNT (amount)
FROM payment
WHERE amount > 5.99;

--bad way to write- select * from actor where first_name = 'Grace'
--better
--SELECT *
--FROM actor
--WHERE first_name = 'Nick';

-- BETWEEN something AND something_else

SELECT *
FROM payment;

--we can chain our where clauses
SELECT *
FROM payment;
WHERE amount >5.99 AND customer_id = 341; --extremely similar to if conditional in python

--max query
SELECT MAX (amount)
FROM payment;
WHERE amount < 6.50;

--min query
SELECT MIN(amount)
FROM payment;

--we can run calculations but then also group the calculations 
--by using the GROUP BY clause
--query to get sum of all transactions
SELECT SUM (amount)
FROM payment; 

--query to get sum of all transactions seperated by their amounts
--whatever you seperate your calc on
--thats what you GROUP BY
SELECT SUM (amount), amount
FROM payment
GROUP BY amount
ORDER BY amount;

--query to display amount of rentals per customer
--count - how many
--GROUP BY seperates out by cust id

SELECT COUNT (amount), customer_id
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC
LIMIT 3;

--shows client name
SELECT *
FROM customer
WHERE customer_id = 341;


--queries

--SELECT
--FROM
--WHERE(OPTIONAL)
--GROUP BY()
--HAVING (HAVING IS TO GROUP BY AS WHERE IS TO SELECT)
--ORDER BY()
--she fell with grace holding oreos

--last clause is having

--query to select how many rental per customer using count ( )aggregate and 
--group by
--custom id ABOVE 350

--what if we wanted the count amount above 20

SELECT COUNT (amount), customer_id
FROM payment
WHERE customer_id >350 -- since cond isn't being asked on calc it can be in a where
GROUP BY customer_id -- seperating calc by customers
HAVING COUNT(amount)>20 -- also question, cond is being asked in calc so needs to be HAVING
ORDER BY customer_id ASC;


--DISTINCT CLAUSE GRABS UNIQUE DATA- no duplicates
SELECT DISTINCT(film_id)
FROM inventory; 
