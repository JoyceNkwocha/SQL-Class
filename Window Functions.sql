-- Window functions perform aggregate operations on groups of rows but they produce a result for each row.

create database window_func;
use window_func;

create table employees(
 emp_no INT PRIMARY KEY auto_increment,
 department varchar(20),
 salary int );
 
 	INSERT INTO employees (department, salary) VALUES
	('engineering', 80000),
	('engineering', 69000),
	('engineering', 70000),
	('engineering', 103000),
	('engineering', 67000),
	('engineering', 89000),
	('engineering', 91000),
	('sales', 59000),
	('sales', 70000),
	('sales', 159000),
	('sales', 72000),
	('sales', 60000),
	('sales', 61000),
	('sales', 61000),
	('customer service', 38000),
	('customer service', 45000),
	('customer service', 61000),
	('customer service', 40000),
	('customer service', 31000),
	('customer service', 56000),
	('customer service', 55000);
	 
     -- OVER : The over clause constructs a window. When it is empty ( over() ) , it includes all records
	 Select avg(salary) over() from employees;
     
	SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;
	 
	SELECT
	   emp_no,
	   department,
	   salary,
	   MIN(salary) OVER(),
	   MAX(salary) OVER()
	FROM employees;
	  
	  
	SELECT
	   emp_no, department, salary, MIN(salary), MAX(salary)
	FROM
	   employees;


-- Inside the over, we can use Partition By, to form the rows into groups of rows. eg Over(Partition by Department)
SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;
 -- use window_func;
SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;



SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

 -- Order by with the window function Over()
 -- We use order by inside over() clause to reorder rows within each cell
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;

-- Rank():  Rank is used to return the rank of the row within its partition
-- It ranks the current row within its partition.

select emp_no, department, salary, rank() over(order by salary desc) as overall_salary_rank
from employees;

select emp_no, department, salary, rank() over(order by salary) as overall_salary_rank
from employees;

	SELECT
	   emp_no,
	   department,
	   salary,
	   ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number, -- The row number counts the number of the rows
	   RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank, -- Rank gives us the rank
	   RANK() OVER(ORDER BY salary DESC) as overall_rank,
	   DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank, -- Dense rank assigns a unique rank value within a specified partition while giving the same rank to identical values
	   ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
	FROM employees ORDER BY overall_rank;

	SELECT
	   emp_no,
	   department,
	   salary,
	   NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
		NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
	FROM employees


SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;


SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;



