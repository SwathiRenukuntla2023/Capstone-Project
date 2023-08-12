use sakila;

-- Task-1 : Full Names of actors 

select * from actor;
select concat(first_name, "  " ,last_name) as Full_Name from actor;


-- Task-2 : 
-- (i) Number of times each first name appears 

select first_name, count(first_name) as Number_Of_Times_Appeared from actor
group by first_name ;

-- (ii) Count of actors that have unique first names 

select first_name, count(first_name) as Unique_Count 
from ( select DISTINCT first_name From actor ) as Unique_First_Name 
group by first_name ;


-- Task-3 :
-- (i) Number of times each last name appears 

select last_name, count(last_name) as Number_Of_Times_Appeared from actor
group by last_name ;

-- (ii) all unique last names 

select DISTINCT last_name as Unique_Last_Name from actor; 


-- Task-4 :
-- (i) List of records for the movies with the rating "R"

select * from film;

select * from film
where rating = "R";

-- (ii) List of records for the movies that are not rated "R"

select title, rating from film
where rating <> "R";

-- (iii) List of records for the movies that are suitable for audience below 13 years 

select title, rating from film
where rating = 'G' OR rating = 'PG' OR rating = 'PG-13';


-- Task-5 :
-- (i) List of records for the movies where the replacement cost is upto $11

select * from film 
having replacement_cost <= 11;

-- (ii) List of records for the movies where the replacement cost is between $11 & $20

select * from film 
having replacement_cost between 11 and 20 ;

-- (iii) List of records for the all movies in descending order of their replacement costs

select * from film 
order by replacement_cost desc;


-- Task-6 : Names of the Top_3 movies with the greatest number of actors

select * from film;
select * from film_actor;
select * from actor;

select film.title, count(actor.actor_id) as Number_of_actors from film inner join film_actor
on film.film_id = film_actor.film_id inner join actor
on film_actor.actor_id = actor.actor_id
group by film.title
order by count(actor.actor_id) desc limit 3;


-- Task-7 : Titles of the movies starting with the letters 'k' & 'Q'

select * from film;
select title from film where title like "k%" or title like "Q%" ;


-- Task-8 : Names of all actors who appeared in the film "Agent Truman"

select * from film;
select * from film_actor;
select * from actor;

select film.title, concat(actor.first_name, " " ,actor.last_name) as Actors from film inner join film_actor
on film.film_id = film_actor.film_id inner join actor
on film_actor.actor_id = actor.actor_id
where film.title = "Agent Truman" ; 


-- Task-9 : The Movies categorized as family films

select * from category;
select * from film_category;
select * from film;

select category.name, film.title from category inner join film_category
on category.category_id = film_category.category_id inner join film
on film_category.film_id = film.film_id
where category.name = "Family";


-- Task-10 :
-- (i) Maximum, Minimum & Average rental rates of movies based on their ratings

select * from film;

select max(rental_rate) as Max, min(rental_rate) as Min , avg(rental_rate) as Avg from film
group by rating
order by avg(rental_rate) desc ;

-- (ii) Movies in descending order of their rental frequencies

select * from film;
select * from inventory;
select * from rental;

select film.title as Title, count(rental.rental_id) as Rental_Frequency from film inner join inventory
on film.film_id = inventory.film_id inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.title
order by count(rental.rental_id) desc ;


-- Task-11 : Film categories, the difference between the average film replacement cost and the average film rental rate is greater than $15

select * from film ;
select * from film_category ;
select * from category ;

select category.name as fim_category, AVG(replacement_cost), AVG(rental_rate),( AVG(replacement_cost) - AVG(rental_rate)) as Differnce, 
COUNT(category.name) as category_count from category inner join film_category
on category.category_id = film_category.category_id inner join film
on film_category.film_id = film.film_id
group by category.name
having Differnce > 15  ;


-- Task-12 : Film categories in which the number of movies greater than 70

select * from category ;
select * from film_category ;
select * from film ;

select category.name as Film_Category, count(film.title) as Number_Of_Movies from category inner join film_category
on category.category_id = film_category.category_id inner join film
on film_category.film_id = film.film_id
group by category.name
having count(film.title) >= 70 ;





