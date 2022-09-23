use sakila;

show tables;

select * from actor;
select * from actor_info;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from customer_list;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_list;
select * from film_text;
select * from inventory;
select * from `language`;
select * from nicer_but_slower_film_list;
select * from payment;
select * from rental;
select * from sales_by_film_category;
select * from sales_by_store;
select * from staff;
select * from staff_list;
select * from store;

#Q1 list of all actors
select first_name, last_name from actor order by last_name asc;

#Q2 Surname of the actor with forename John ANSWER = Suvari
select last_name from actor where first_name="John";

#Q3 all actors with surname Neeson ANSWER Christian and Jayne
select first_name, last_name from actor where last_name="Neeson";

#Q4 all actors with ID number divisible by 10
select actor_id, first_name, last_name from actor where actor_id%10=0;

#Q5 description of the movie with ID 100
select `description` 



