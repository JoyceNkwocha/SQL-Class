/* Real world data is messy and interrelated.
 There are different types of SQL relationships
 One to one relationship
 One to many relationship : One column to many corresponding enteries.
 Many to Many relationship
 Foreign Key: Foreign Key makes reference to another table, in a given table.
 when creating the different tables, you have to specify what the foreign key is and what it is referencing unless there can be an error.
 */
 	CREATE TABLE customers (
	   id INT PRIMARY KEY AUTO_INCREMENT,
	   first_name VARCHAR(50),
	   last_name VARCHAR(50),
	   email VARCHAR(50)
	);
	 
	CREATE TABLE orders (
	   id INT PRIMARY KEY AUTO_INCREMENT,
	   order_date DATE,
	   amount DECIMAL(8,2),
	   customer_id INT,
	   FOREIGN KEY (customer_id) REFERENCES customers(id)
	);
	 
	INSERT INTO customers (first_name, last_name, email)
	VALUES ('Boy', 'George', 'george@gmail.com'),
	      ('George', 'Michael', 'gm@gmail.com'),
	      ('David', 'Bowie', 'david@gmail.com'),
	      ('Blue', 'Steele', 'blue@gmail.com'),
	      ('Bette', 'Davis', 'bette@aol.com');
	     
	     
	INSERT INTO orders (order_date, amount, customer_id)
	VALUES ('2016-02-10', 99.99, 1),
	      ('2017-11-11', 35.50, 1),
	      ('2014-12-12', 800.67, 2),
	      ('2015-01-03', 12.50, 2),
	      ('1999-04-11', 450.25, 5);

	     
	     
	
show errors;

/* # Cross JOin (They are kind of useless)
Cross join shows how the foreign key on the other table works with the primary key in the other table
eg: select id from customers
where last_name = 'George'
select * from orders where customer_id = 1

or 
select * from orders where customer_id = (Select id from customers where last_name = 'George');

To perform a kind of useless crossjoin
select * from customers, orders;
This select statement shows the two tables, joined together

There are three types of Joins
Inner Join
Left Join
Right Join

The most common type of Join is the inner Join.

# Inner Join
We bring the join keyword to bring in information from another table and we have to specify how they are related
Syntax
Select * from <table>
Join <table> 
on <table.column> = <table.column>;
Example: 
Select * from customers 
Join orders on orders.customer_id = customers.id;

# Inner Join with Group By
Select * from customers
Join orders on customer.id = orders.customer_id
Group by first_name, last_name;

Select first_name, last_name, sum(count) from customers
Join orders on customer.id = order.customer_id
Group By frist_name, last_name
order by sum;

# Left Join
Left join takes everything from the leftside and joins it to the overlap from the right. 
Compared to the inner join, the left join can be used to get specific details.alterA left join gets all the rows on the lefthand and joins it to overlapping 
rows on the right

N.B To use inner join, we can just say Join but to use left join, we specfify left Join
e.g
select first_name, last_name, Order_date, amount from customers
left join orders on orders.customer_id = customer.id;

# Left Join with Group BY
select first_name, last_name, Order_date, ifnull(sum(amount), 0) as MoneySpent from customers
left join orders on customer.id = orders.customer_id
Group by first_name, last_name;

#Right Join
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;
    
    */
--  Exercise
Create table students ( 
id int primary key auto_increment,
first_name varchar(50)
);

Create table papers (
title varchar(50),
grade int,
student_id int,
foreign key (student_id) references students(id) on delete cascade
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade from students
join papers on papers.student_id = students.id
order by grade desc;

select first_name, title, grade from students
left join papers on papers.student_id = students.id;

select first_name, IFNULL(title, 'missing'), IFNULL(grade, 0) from students
left join papers on papers.student_id = students.id;
 
select first_name, IFNULL(avg(grade), 0) as average from students
left join papers on papers.student_id = students.id
group by first_name
order by average desc;

select first_name, IFNULL(avg(grade), 0) as average,
case
when avg(grade) > 75 Then 'Passing'
else 'Failing'
end as 'Passing Status'
from students
left join papers on papers.student_id = students.id
group by first_name
order by average desc;


/* Many to Many Relationships
For many to many relationships, we need 3 tables. The left table, the right table and the join table.
The join table/union table connects the other two tables together.*/

Create Database tv_Db;
use tv_Db;
	CREATE TABLE reviewers (
	    id INT PRIMARY KEY AUTO_INCREMENT,
	    first_name VARCHAR(50) NOT NULL,
	    last_name VARCHAR(50) NOT NULL
	);
	 
	CREATE TABLE series (
	    id INT PRIMARY KEY AUTO_INCREMENT,
	    title VARCHAR(100),
	    released_year YEAR,
	    genre VARCHAR(100)
	);
	 
	CREATE TABLE reviews (
	    id INT PRIMARY KEY AUTO_INCREMENT,
	    rating DECIMAL(2 , 1 ),
	    series_id INT,
	    reviewer_id INT,
	    FOREIGN KEY (series_id)
	        REFERENCES series (id),
	    FOREIGN KEY (reviewer_id)
	        REFERENCES reviewers (id)
	);
	 
	INSERT INTO series (title, released_year, genre) VALUES
	    ('Archer', 2009, 'Animation'),
	    ('Arrested Development', 2003, 'Comedy'),
	    ("Bob's Burgers", 2011, 'Animation'),
	    ('Bojack Horseman', 2014, 'Animation'),
	    ("Breaking Bad", 2008, 'Drama'),
	    ('Curb Your Enthusiasm', 2000, 'Comedy'),
	    ("Fargo", 2014, 'Drama'),
	    ('Freaks and Geeks', 1999, 'Comedy'),
	    ('General Hospital', 1963, 'Drama'),
	    ('Halt and Catch Fire', 2014, 'Drama'),
	    ('Malcolm In The Middle', 2000, 'Comedy'),
	    ('Pushing Daisies', 2007, 'Comedy'),
	    ('Seinfeld', 1989, 'Comedy'),
	    ('Stranger Things', 2016, 'Drama');
	 
	 
	INSERT INTO reviewers (first_name, last_name) VALUES
	    ('Thomas', 'Stoneman'),
	    ('Wyatt', 'Skaggs'),
	    ('Kimbra', 'Masters'),
	    ('Domingo', 'Cortes'),
	    ('Colt', 'Steele'),
	    ('Pinkie', 'Petit'),
	    ('Marlon', 'Crafford');
	    
	 
	INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
	    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
	    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
	    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
	    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
	    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
	    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
	    (7,2,9.1),(7,5,9.7),
	    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
	    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
	    (10,5,9.9),
	    (13,3,8.0),(13,4,7.2),
	    (14,2,8.5),(14,3,8.9),(14,4,8.9);


-- Class Challenge/ ClassWork
use tv_db;
select title, rating from series
join reviews on reviews.series_id = series.id 
limit 20;

select title , Round(avg(rating),2) as 'Average Rating' from series -- This rounds the output of average rating to 2 decimal places
join reviews on reviews.series_id = series.id
group by title
order by avg(rating);

select first_name, last_name, rating from reviewers
join reviews on reviews.reviewer_id = reviewers.id;

select title as 'Unreviewed Series' from Series
left join reviews on reviews.series_id = series.id
where reviews.rating IS NULL;

Select genre, avg(rating) from series
join reviews on reviews.series_id = series.id
group by genre;

select first_name, 
last_name, 
count(rating) as Count, 
IfNull(Min(rating), 0) as MIn, 
IfNull(Max(rating),0) as Max, 
Round(IfNull(Avg(rating), 0), 2) as Avg,
case
when count(rating) > 0 Then 'Active'
else 'Inactive'
end as Status
from reviewers
left Join reviews on reviews.reviewer_id = reviewers.id
group by first_name, last_name;

-- Using IF()
select first_name, 
last_name, 
count(rating) as Count, 
IfNull(Min(rating), 0) as MIn, 
IfNull(Max(rating),0) as Max, 
Round(IfNull(Avg(rating), 0), 2) as Avg,
If(count(rating) > 0, 'Active' , 'Inactive') as Status
from reviewers
left Join reviews on reviews.reviewer_id = reviewers.id
group by first_name, last_name;

 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
        INNER JOIN
    series ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviews.reviewer_id = reviewers.id;
 
 use tv_db;
 
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviewers
        INNER JOIN
    reviews ON reviews.reviewer_id = reviewers.id
        INNER JOIN
    series ON reviews.series_id = series.id;


/* Views
Views are stored queries that can be reused. Views allow us take a query that produces a result, stores it and gives it a name
Syntax
Create View <view_name> AS < The Query you want to be stored>*/

Create View full_review AS
SELECT title, genre, first_name, last_name, rating FROM reviews
JOIN series ON reviews.series_id = series.id
JOIN reviewers ON reviews.reviewer_id = reviewers.id;


-- Replacing/ ALtering Views
-- If you make a mistake when writing a view, and you need to update it, you can use the create or replace syntax
Create or replace view ordered_series AS 
SELECT * FROM rseries
order by released_year desc;
-- Create or replace means, if there is no view, create it but if there is a view, replace it.
