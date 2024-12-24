/* Project: Mavenmovies */
/* Purpose: To draw insights from the dataset, finding the patterns and answering the questions */
/* Step 1 */
/* uploading the SQL code to Workbench and executing it */
/* Next: using mavenmovies data set to find answers to the given questions */


use mavenmovies; /* 'Use' let MySQL know, which database I will be using */


/* QUESTION 1: Write a SQL query to count the number of characters except for the spaces for each actor. 
Return the first 10 actors' name lengths along with their names */

Select   /* 'Select' statement provides the most fundamental functionality for retrieving data from a table */
Concat(first_name,' ',last_name) as Full_Name, 
length(first_name) + length(last_name) as Number_of_Characters 
from actor     /* 'From' identifies the table that the concerned columns live in */
limit 10;      /* 'Limit' claue set the upper limit on number of records returned by select statenent */


/* QUESTION 2: List all Oscar awardees(Actors who received the Oscar award) 
with their full names and the length of their names */

Select 
Concat(first_name,' ',last_name) as Full_Name, 
length(first_name) + length(last_name) as Number_Of_Characters 
from actor_award 
where awards like '%Oscar%';   /* 'Where' clause used to filter the records according to given condition */


/* QUESTION 3: Find the actors who have acted in the film ‘Frost Head’ */

Select 
concat(first_name,' ',last_name) as Full_Name, 
fl.title as Film_Acted_In 
from actor ac 
Inner Join film_actor fa using (actor_id)
Inner Join film fl using (film_id) /* Joins query and access data from multiple tables, based on logical relationships */
where title like 'Frost Head';


/* QUESTION 4: Pull all the films acted by the actor ‘Will Wilson’ */

Select 
fl.Title as Film_Name 
from actor ac 
Inner Join film_actor fa using (actor_id) 
Inner Join film fl using (film_id) 
where Concat(first_name,' ',last_name) like 'Will Wilson';


/* QUESTION 5: Pull all the films which were rented and return them in the month of May */

Select 
fl.title as Film_Title, 
date(rental_date) as Rented_date, 
date(return_date) as Renturn_Date 
from film fl 
Inner Join Inventory Inv Using (film_id)
Inner Join rental rn Using (inventory_id) 
where monthname(rental_date) like 'May' AND monthname(return_date) like 'May'; 
/* Monthname returns the name of month from the date column */
/* Month functions can also be used but it returns the value as number */


/* QUESTION 6: Pull all the films with ‘Comedy’ category */

Select
title as Film_with_category_Comedy 
from film
Inner Join film_category using (film_id)
Inner Join category using(category_id)
where name like 'Comedy';

/* It was great learning experience, utlizing the SQL skill learned during during class and labs */
/* I would like to thank OdinSchool for given me this opportunity to showcase my SQL skills, I would 
love to hear the feedback and implement it to improve */
/* --End Of The Project-- */