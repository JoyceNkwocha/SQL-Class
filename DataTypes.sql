/* Varchat is used for text whose length is not fixed. It allows us specify the length
Char is used for data with similar fixed length or size. eg. getting two letter initials or postal code.
there are different types of integers, smallint, tinyint, mediumint, int and bigint. they have a range of values they can accommodate.
Decimals(7,2). This typically menas that the full length of the digits including the ones after the decimal should be seven and the one after the 
decimal should be two. eg. 12345.33. 7 digits in total, 2 after the decimal.
There is also float and double. decimal takes up much memory space but it is precise, float takes up less memory space but after 7 decimal points,
it becomes less precise. Double can take up up to 15 decimal points before it becomes less precise.

There are the Date and Time data types. Then, there is the datetime datatype.
Date is in this format yyyy-mm-dd
Time is hh:mm:ss
So dateTime is yyyy-mm-dd hh:mm:ss   together but separated with a space. 
CURDATE gives us the current date. Select CURDATE().
CURTIME gives us the current time. Select CURTIME().
NOW() gives us the current date and time.
Timestamp is just like datetime but, it has a smaller range than datetime and takes up lessmemory, 
so timestamp gives us the date and time too,
we also have currenttimestamp.
select CURTIMESTAMP
Day()- also called the day of the month
Dayofweek()- shows the day of the week where 1= sunday, 2= Monday...
Dayofyear()_ shows the day of the year
MonthName()- Tells the name of the month
Dayname()- Tells the name of the day
Date_format(date, format)- foormats the date value according to the format string. 
different formats include: %a- Abbr. weekdayname(sat...sun), %b- abbr. monthname (jan...dec) etc Check for other formats in the reference manual.
you can also get the hour(), minute() second()
Example of dateformat: Select date_format(curdate, '%a');
You can also use multiple formats and however you write them inside the ' ' is how theyll come out
eg: Select date_format(curdate, '%a %b %M:%U')Dont forget to close the ' '.

Date Math?Time Math. We can find the difference in dates and time, add the, subtract them etc
DateDiff(expr1,expr2)- expr1 and expr2 are expressed as values in days from one date to another. Expr1-expr2.
dateAdd( date, Interval expr unit)- we have the date, then the interval, the expression and the unit of the expression eg. DateAdd(curdate, interval 18 year);
the unit should not have S.
Datesub has the same syntax as dateadd
*/
-- Exercises.
Create table time( 
name varchar(100),
time timestamp default now(),
currenttime timestamp default now()
);
desc time;
insert into time(name) 
values ( 'Joana'), ('Ezekiel');

select * from time;

