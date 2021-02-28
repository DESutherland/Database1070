-- Evan Sutherland W0443868
-- 11/27/2020
-- Assignment 2 DBAS 1007 Basic SQL Queries

USE sakila;

-- 1.	Create a query that returns all film titles in alphabetical order for the language with ID = 1.
SELECT title
    FROM film
    WHERE language_id = 1
    ORDER BY title ASC;

-- 2.	Create a query that will list all the film titles containing the word “Drama” in the description.
-- (You need only to accommodate the displayed spelling of the word.)
SELECT title
    FROM film
    WHERE description LIKE '%Drama%';

-- 3.	Create a query that lists all films with the ratings 'G', 'PG, and 'PG-13' and also do not have an original
-- language ID. Build the query to check for all conditions, regardless of the data. Sort the results alphabetically
-- by rating, then title.
SELECT title, rating
    FROM film
    WHERE rating = 'G' OR rating = 'PG' OR rating = 'PG-13'
    AND original_language_id IS NULL
    ORDER BY rating ASC, title ASC;

-- 4.	Create a query that lists all payment ids for amounts less than $2.99 and after the June 1st, 2005.
-- Sort the results by payment date, then amount.
SELECT payment_id, payment_date, amount
    FROM payment
    WHERE amount < 2.99 AND payment_date > '2005-06-01'
    ORDER BY payment_date ASC, amount ASC;


-- 5.	Create a query that lists all cities who have 'Canada' as a country.  Build the query as if you do not know
-- Canada's country id.  Hint: Remember you can have selects within select queries. Sort the results reverse
-- alphabetically by city name.
SELECT city
    FROM city
    WHERE country_id =
          (SELECT country_id from country WHERE country = 'Canada')
    ORDER BY city DESC;

-- 6.	Create a query that returns all films that either start with the letter ‘A’, or end with the letter ‘t’.
-- Suppress any duplicate film names and sort the results in reverse alphabetical order.
SELECT title
    FROM film
    WHERE title LIKE 'A%' OR title LIKE '%t'
    GROUP BY title
    ORDER BY title DESC;

-- 7.	Create a query that returns each customer ID and the count of payments they have made. Make sure you call the
-- second column "count". Sort results by count in reverse order.
SELECT customer_id,
       COUNT(payment_id) AS Count
    FROM payment
    GROUP BY customer_id
    ORDER BY Count DESC;

-- 8.	Create a query that lists the CustomerId and maximum paid by each customer.
-- Then modify the query to display only those records whose amount was more than $5.99.
-- Sort from highest total to lowest total, then sort by CustomerId from lowest to highest.
SELECT customer_id,
       MAX(amount)
    FROM payment
    GROUP BY customer_id, amount
    HAVING amount > 5.99
    ORDER BY amount DESC, customer_id ASC;

-- 9.	Create a query that returns the CustomerId and the total number of items for each rental. Sort the results
-- from the most number of items rented to least number of items rented. Note: this is using a different table from
-- the previous two queries.
SELECT customer_id, COUNT(rental_id)
    FROM rental
    GROUP BY customer_id
    ORDER BY COUNT(rental_id) DESC;

-- 10.	Create a query that returns all customers who have payments with a total over $7.00 and were served by the
-- staff with an ID of 1. Sort the results by customer ID from highest to lowest, then amount lowest to highest.
SELECT customer_id, amount
    FROM payment
    WHERE amount > 7 AND staff_id = 1
    ORDER BY customer_id DESC, amount ASC;

-- 11.	Create a query that lists the CategoryId and count of films (name this column Cat_Count).
-- Restrict your results to only those categories with more than 60 films. Sort the results by the Category Count
-- in descending order.
SELECT category_id, (COUNT(film_id)) AS Cat_Count
    FROM film_category
    GROUP BY category_id
    HAVING (COUNT(film_id))>60
    ORDER BY Cat_Count DESC ;

-- 12.	Create a query that returns the names of the films with Actor ID 107.  Sort the movie titles alphabetically.
SELECT title
    FROM film
    WHERE film_id IN
          (SELECT film_id FROM film_actor WHERE actor_id = 107);

-- 13.	Create a query that only lists the actor ids from films that contain more than 36 actors.
-- Sort from largest to smallest amount of actors in film.
SELECT actor_id, (COUNT(film_id)) AS actor_count
    FROM film_actor
    GROUP BY actor_id
    HAVING (Count(film_id))>36
    ORDER BY actor_count DESC;

-- 14.	Create a query that displays the total of films are not in inventory.
-- Call the single column "Total Not In Inventory".
SELECT COUNT(film_id) AS 'Total Not In Inventory'
    FROM film WHERE film_id NOT IN
        (SELECT film_id FROM inventory);




-- 15.	Create a query that lists all of the film ids for any movies that contain the actor with the title
-- "RIP CRAWFORD". Do not use the actor's ID in the query. Display Film IDs in Ascending order.
SELECT film_id
    FROM film_actor
    WHERE actor_id IN
        (SELECT actor_id FROM actor WHERE first_name = 'RIP' AND last_name = 'CRAWFORD')
    ORDER BY film_id ASC;


