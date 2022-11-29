use sakila;

-- List the number of films per category.
select c.name, count(f.film_id) 
from category c
join film_category f using(category_id)
group by c.name;

-- Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff s 
join address a using(address_id);

-- Display the total amount rung up by each staff member in August 2005.
select s.first_name, s.last_name, sum(p.amount) as amount_rung_up
from staff s 
join payment p using(staff_id)
where date_format(convert(p.payment_date,date), '%m-%y') = '08-05'
group by s.first_name, s.last_name;

-- List all films and the number of actors who are listed for each film.
select f.title, count(a.actor_id) as number_actors
from film f
join film_actor a using(film_id)
group by f.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
-- List the customers alphabetically by their last names.
select c.last_name, c.first_name, sum(p.amount) as amount_paid
from customer c
join payment p using(customer_id)
group by c.last_name, c.first_name
order by c.last_name asc;

