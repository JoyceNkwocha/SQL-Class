select now();
-- USE intro_sql;

-- select id, company_name, country from customers;

-- select * from customers;

-- select company_name as "Company Name" from customers ;

-- select country from customers;

-- select distinct country from customers ;

use intro_sql;

select id, company_name, phone from customers where country = 'France';

select id, order_date, shipper, freight from orders where freight > 100;

select id, company_name, region, country from customers;

select * from customers where country = 'USA';

select * from customers where country = 'USA' and region = 'OR';

select id, order_date, shipper, freight from orders
where order_date >= '2019-01-01' and order_date <= '2019-10-31';

select id, order_date, shipper, freight from orders
where order_date between '2019-01-01' and '2019-10-31';

select * from customers 
where country = 'USA' or country = 'Germany';

select product_name As Product, Category, units_in_stock as Units from products;

select product_name As Product, Category, units_in_stock as Units from products
where category = 'Beverages' or category = 'Dairy Products';

create database book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

desc books;

select concat(author_lname, ' ' , author_fname) from books; /* This is for concatenation*/

select concat_ws(' ', author_fname, author_lname) from books;

select substring('Hellp World', 1, 4);
select substring('Hello World' , 2, 3);
select substring('Hello World' , 3);
select substring('Hello World',-3);
select substring('Hello World',-5, 2);
select substring(Title ,-3) from books;

select substring(Title ,-3), author_lname from books;

select concat(substr(title,1,12),'...' ) from books;

select concat
(
substr(title,1,12),'...'
 ) 
As BookTitle from books;

 select concat(substr(author_fname,1,1),'.',substr(author_lname,1,1),'.') As 'Author Initials' from books;
 
SELECT id, company_name, country from customers order by country;

select count(*) from books;

select count(author_fname) from books; -- This gives us 19 books instead of 22 because there is a Null/empty row 

select count( distinct author_fname) from books;

select author_fname from books;





    CONCAT_WS('. ',
            SUBSTR(author_fname, 1, 1),
            SUBSTR(author_lname, 1, 1),
            ' ') AS 'Author Initials'
FROM
    books;
    
select replace('Hello World','Hell','OO');

Select replace (Title,' ', ' - ') from books;

select char_length('Hello');
select char_length(Title) Title_Length from books;

select upper('hello world');
select lower('hello world');
select concat_ws(' ','I LOVE', upper(title), '!!!') As Titles from books;

select insert('Hello Bobby',1,0,'Hi');

select left('Omghaha',3); -- This same thing happens for the right() function

select repeat('ha',5) ;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages) 
VALUES 
( '10% Happier' , 'Dan' , 'Harris' , 2014 , 29 , 256 ),
 ( 'fake_book' , 'Freida' , 'Harris' , 2001 , 287 , 428 ),
 ( 'Lincoln In The Bardo' , 'George' , 'Saunders' , 2017 , 1000 , 367 );
 
 select count(author_lname) from books where author_lname = 'Harris';
 
 select author_lname, author_fname, book_id from books order by author_lname;
 
 