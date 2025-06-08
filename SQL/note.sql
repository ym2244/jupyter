SELECT * FROM film;

SELECT DISTINCT release_year FROM film;
SELECT COUNT(DISTINCT rental_rate) FROM film;

SELECT * FROM film WHERE title = 'Date Speed';

SELECT * FROM film 
WHERE rental_rate NOT BETWEEN 2 AND 5 
ORDER BY rental_rate DESC,film_id ASC
LIMIT 5;

SELECT * FROM film 
WHERE rental_rate NOT BETWEEN 2 AND 5 
ORDER BY film_id;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14';

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT COUNT(*) FROM payment;

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT * FROM film
WHERE title LIKE 'A%e' AND title NOT ILIKE 'a%h__e';

-- general challenge --
SELECT COUNT(*)
FROM payment WHERE amount > 5;

SELECT COUNT(DISTINCT district) FROM address;

SELECT DISTINCT district FROM address;

SELECT COUNT(*) FROM film 
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

SELECT * FROM film 
WHERE title LIKE '%Truman%';


-- group by --

SELECT MIN(replacement_cost), 
MAX(replacement_cost), 
AVG(replacement_cost),
ROUND(AVG(replacement_cost), 2),
SUM(replacement_cost)
FROM film;


SELECT customer_id, staff_id, SUM(amount), COUNT(amount) FROM payment
-- GROUP BY customer_id, staff_id 里的顺序不重要，group by里的值会被视作composite key，
-- 即两个值都一样的一组row才会被算作一样的row 被group到一起
GROUP BY customer_id, staff_id
ORDER BY customer_id, staff_id, SUM(amount) DESC;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount);

SELECT rating, AVG(replacement_cost) FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;



