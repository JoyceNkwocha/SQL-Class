use bookshop;
-- != : This is the not equal to operator; --
Select title from books
where year != 2017;

-- Not Like Operator: This is just like the Like function but, the opposite.
Select title, author_fname from books
where author_fname Not Like 'da%';

-- Greater Than Operator (>) and Less Than Operator (<)
Select * from books
where released_year > 2000;

Select title, pages from books
where pages < 200;

Select title, released_year from books
where released_year >= 2010;

-- NB: If you do something like, Select 80 > 40;, the output will be 1. In sql, 1= True and 0 = False
 
-- Logical And (&&)
-- For logical and to work, both have to be true else, its false
select * from books
where author_lname = 'Eggers' and released_year > 2010;

select * from books 
where author_lname = 'Eggers' 
and released_year > 2010 
and title like '%novel%';
 -- You can have as many ands as you want;
 
 -- Logical OR - Provided one is true, there will be an ouput. If both are false, then, it returns no output
Select title, author_lname, released_year from books
where author_lname = 'Eggers' 
or released_year > 2010;

select title, pages from books 
where pages < 200 or
title like '%stories%';

-- Between Operator nad Not Between Operators : It shows the comparison between two things
Select title, released_year from books
where released_year <= 2004 and released_year >= 2015;

-- Or we can write it this way using between
Select title, released_year from books
where released_year between 2004 and 2015;

Select title, released_year from books
where released_year not between 2004 and 2015;

-- NOTE ABOUT COMPARING DATES
select * from people where birthdate < '2005-01-01'; 
-- The above date is inside a string. Even if MySql sees the above as a string, It has a way of knowing when its a date.
-- We can alternatively and easily do
select * from people
where year(birthdate) < 2005; -- This gives the same output as the above.

Select * from people 
where hour(birthtime) between 12 and 16;

-- Alternatively, we can use the CAST FUNCTION. The Cast function converts one datatype to another. So, we can convert string to time.
select * from people
where birthtime between cast('12:00:00' as Time) and cast('16:00:00' as Time);

-- The In Operator / Not In Operator: This helps us select values based off whether some columns is in some set of values.
 Select title, author_lname from books 
 where author_lname in ('Carver', 'Lahiri', 'Smith');
 
 Select title, author_lname from books 
 where author_lname not in ('Carver', 'Lahiri', 'Smith');
 
 -- The Modulo/ Remainder Operator
 select 10 % 4; -- The output gives us the remainder which is 2
 
 Select title, release_year from books
 where released_year >= 2000
 And released_year % 2 != 0;
 
 /* Is Null Operator / Is Not Null Operator
 This works with null values. Since null values are empty, when called normally, they return nothing
 example: Select title from books where title = Null. This returns an empty set.
 But when we do the example below, it shows values that are null */
Select title from books where title = Null; -- This returns an empty set.
 
 Select title from books where title is Null; -- This works.
 
 -- We can also do the same for Is Not NULL

/* Case Statements.
This is used to make decisions about values to have different outcomes based off of values
They have the syntax
 Select ...,
  case
     when ... then
	 else
   End
 From (tablename)
*/

Select title, released_year,
 case 
   when released_year >= 2000 Then 'Modern Lit'
   Else '20th Century lit'
 End As Genre -- If you dont give it an alias, the name it will appear on the table will be long
from books; 

show errors;

-- We can also have multiple case statements
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;

-- Alternatively, we can write it like this.
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;

-- NB Put a comma before you start the case statement and dont use commas to separate the mulltiple case statements.


-- Logical Operators Exercises
Select 10 != 10;
Select 15 > 14 and 99 - 5 <= 94;
Select 1 In (5,3) OR 9 Between 8 and 10;

Select * from books 
where released_year < 1980 ;

Select * from books
where author_lname = 'Eggers' or author_lname = 'Chabon';

Select * from books 
where author_lname = 'Lahiri' and released_year > 2000;

Select * from books
where pages between 100 and 200;

Select * from books
where author_lname like 'S%' or author_lname like 'C%';

Select title, author_lname ,
 case
   when title like '%Stories%' then 'Short Stories'
   When title like '%kids%' or title like '%Heartbreaking%' then 'Memoir'
   else 'Novel'
 end as Type
from books;

Select author_fname, author_lname, concat(count(title), 'books') as Count from books

