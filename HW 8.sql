-- 1a display 
select first_name, last_name
from actor;

-- 1b first and last name in one column 
SELECT CONCAT(first_name, ' ', last_name) AS 'name' FROM actor;

-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
-- What is one query would you use to obtain this information?
SELECT * FROM actor WHERE first_name LIKE 'Joe%';

-- 2b Find all actors whose last name contain the letters `GEN`:
SELECT * FROM actor WHERE last_name LIKE '%GEN%';

-- 2c Find all actors whose last names contain the letters `LI`. 
-- This time, order the rows by last name and first name, in that order
SELECT * FROM actor WHERE last_name LIKE '%LI%'
GROUP BY last_name, first_name;

-- 2d Using `IN`, display the `country_id` and
-- `country` columns of the following countries: Afghancountry_idcountry_idcountry_idistan, Bangladesh, and China:
SELECT country, country_id
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a Add a `middle_name` column to the table `actor`. Position it between 
-- `first_name` and `last_name`. Hint: you will need to specify the data type.
alter table actor 
add column middle_name varchar(50)after first_name;

-- 3b You realize that some of these actors have tremendously long last names. 
-- Change the data type of the `middle_name` column to `blobs`.
alter table actor 
modify middle_name blob;

-- 3c. Now delete the `middle_name` column.
alter table actor 
drop middle_name;

-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name;

-- 4b. List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors
SELECT last_name, COUNT(last_name) as 'count of last name'
FROM actor GROUP BY last_name
having count(last_name) >= 2;

-- 4c. Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as 
-- `GROUCHO WILLIAMS`, the name of Harpo's second cousin's husband's yoga teacher. 
-- Write a query to fix the record.
select * from actor where first_name = 'Groucho' and last_name = 'Williams';

UPDATE actor 
    SET first_name = 'Harpo'
    where actor_id = 172;
-- select * from actor where first_name = 'Harpo'	


