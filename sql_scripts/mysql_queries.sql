

#Summary of all database
SELECT table_name,
       GROUP_CONCAT(column_name ORDER BY ordinal_position SEPARATOR ', ') AS columns
FROM information_schema.columns
WHERE table_schema = 'ContosoSales'
GROUP BY table_name;

#The average length of films by category
SELECT c.name, 
	AVG(f.length) AS average_length
FROM film_category AS f_c
-- Join the tables film & category
INNER JOIN category AS c
  ON f_c.category_id = c.category_id
INNER JOIN film AS f
  ON f.film_id = f_c.film_id
GROUP BY c.name
-- Sort the results in ascending order by length
order by average_length;


#Which films are most frequently rented?
SELECT f.title, COUNT(f.title) AS num_rented_title
FROM film AS f
INNER JOIN inventory AS i
  ON f.film_id = i.film_id
INNER JOIN rental AS r
  ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY COUNT(f.title) DESC
LIMIT 10;


#How many videos were rented in each city?
SELECT co.country, ci.city, COUNT(ci.city) as  num_rented_movie_by_city
FROM rental AS r
INNER JOIN customer AS cu
  ON r.customer_id = cu.customer_id
INNER JOIN address AS a
  ON cu.address_id = a.address_id
INNER JOIN city AS ci
  ON a.city_id = ci.city_id
INNER JOIN country AS co
  ON ci.country_id = co.country_id
GROUP BY co.country, ci.city
ORDER BY COUNT(ci.city) DESC
LIMIT 10;

#Payment
SELECT MONTH(r.rental_date) as month, SUM(p.amount) as total 
FROM payment AS p
INNER JOIN rental AS r
  ON p.rental_id = r.rental_id
GROUP BY MONTH(r.rental_date)
ORDER BY total DESC;
