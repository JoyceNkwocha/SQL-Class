/* 
First of all, constraints are the rules you put in place for your table that the columns have to follow.alter
Unique Constraint
This makes the value unique in the sense that it cannot be entered twice
*/ 

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error because it is repeated.
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');


-- Check Constraint
-- This checks is an entry is correct or not
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);



-- Named Constraints 
-- This gives names to constraints because when they appear as errors, they appear in a default name that sql gives.

CREATE TABLE users2(
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0) -- Here theh constraint is named 'age_not_negative'. It doesnt have to be put in quotes
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

-- Multiple Constraints
-- This sets up constraints that use multiple columns. The combination is what sets up the constraints
	CREATE TABLE companies (
	   name VARCHAR(255) NOT NULL,
	   address VARCHAR(255) NOT NULL,
	   CONSTRAINT name_address UNIQUE (name , address)
	);
	 
	CREATE TABLE houses (
	 purchase_price INT NOT NULL,
	 sale_price INT NOT NULL,
	 CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
	);


-- Alter TABLE
-- Alter table is used all round sql to add new columsn, add constraints, drop columns, and in general, do a lot of things. It does everything.

-- Adding a new column to an existing table using alter table.
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- Dropping a table using alter table.
ALTER TABLE companies 
DROP COLUMN phone;


-- Renaming Columns
-- This is used to rename columns. It can be done in two different ways
-- Using the rename syntax 

RENAME TABLE companies to suppliers;

-- Or using the alter table syntax
ALTER TABLE suppliers RENAME TO companies;


ALTER TABLE companies
RENAME COLUMN name TO company_name;



-- Modify
-- We use modify to change existing column types
-- NB: Be careful beacause when modifying from one data type to another, it can be an issue eg: when changing from null to not null
-- or, when changing from int to varchar
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);


-- ALTER Constraints 
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;

