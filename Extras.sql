/* Group by using 'Having clause'
The having clause is used to filter the gorups that we get back from group by. It specifies conditions on groups
typically formed by the group by clause. */
-- Example
SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_review
GROUP BY title HAVING COUNT(rating) > 1;

/* Group by With Rollup
It gives a summary of the whole group by that was performed.alterif you do an average at the end, it shows an extra row of 
the entire average of the outputted results. 
If you do a count, it counts every output and gives the summary at the end with an additional row */

SELECT 
    title, COUNT(rating)
FROM
    full_review
GROUP BY title WITH ROLLUP;
 
 
/*SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_review
GROUP BY released_year , genre , first_name WITH ROLLUP; */

select * from full_review;
use tv_db;


