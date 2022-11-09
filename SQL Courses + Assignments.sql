#########################################################
-- SECTION 5: First Steps in SQL
#########################################################


######################
-- EXERCISE (Assignment): Creating a Database - Part I
CREATE DATABASE IF NOT EXISTS Sales;

CREATE SCHEMA IF NOT EXISTS Sales;


######################
-- EXERCISE (Assignment): Creating a Database - Part II
USE Sales;


######################
-- Course: Creating a Table

CREATE TABLE sales 
(
	purchase_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_of_purchase DATE NOT NULL,     
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
--  Exercise (Assignment) :Creating a table 
CREATE TABLE customers                                                 
(
    customer_id INT,

    first_name varchar(255),

    last_name varchar(255),

    email_address varchar(255),

    number_of_complaints int
);

######################
-- Course: Using Databases and Tables

USE Sales;
SELECT * FROM customers;
SELECT * FROM sales.customers;

######################
-- EXERCISE (Assignment): Using Databases and Tables
SELECT * FROM sales;
SELECT * FROM sales.sales;


######################
-- Course : Additional Notes on Using Tables
DROP TABLE sales;

-- EXERICSE (Assignment): Additional Notes on Using Tables
DROP TABLE sales;


##########################################################
-- SECTION 6: MySQL Constraints
##########################################################

###########
-- Course: PRIMARY KEY Constraint

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

-- EXERCISE (Assognment): PRIMARY KEY Constraint
DROP TABLE customers;

CREATE TABLE customers				
(
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int, 
PRIMARY KEY (customer_id)
);

CREATE TABLE items (
    item_id VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
PRIMARY KEY (item_id)
);

  CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
PRIMARY KEY (company_id)
);

######################
-- Course: FOREIGN KEY Constraint - Part I
DROP TABLE sales;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

######################
-- Course: FOREIGN KEY Constraint - Part II

DROP TABLE sales;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);

ALTER TABLE sales 
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

-- Course: FOREIGN KEY Constraint - Part II
DROP TABLE sales;

DROP TABLE customers;

DROP TABLE items;

DROP TABLE companies;

######################
-- Course: UNIQUE KEY Constraint

/*create table customers				
(
    customer_id int,
    first_name varchar(255),
	last_name varchar(255),
	email_address varchar(255),
	number_of_complaints int,
PRIMARY KEY (customer_id)
);
*/

CREATE TABLE customers 
(
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address)
);

DROP TABLE customers;

CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

ALTER TABLE customers
DROP INDEX email_address;

-- EXERCISE (Assignment): UNIQUE KEY Constraint
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
 
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

select * from customers;

######################
-- Course: DEFAULT Constraint

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender) 
VALUES	('Peter', 'Figaro', 'M');

SELECT * FROM customers;
    
ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

-- EXERCISE (Assignment): DEFAULT Constraint
CREATE TABLE companies
(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);

DROP TABLE companies;

######################
-- Course: NOT NULL Constraint - Part I
CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
PRIMARY KEY (company_id)
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

INSERT INTO companies (headquarters_phone_number)
VALUES ('+1 (202) 555-0196'); #error : company_name doesn't have a default value

INSERT INTO companies (headquarters_phone_number, company_name)
VALUES	('+1 (202) 555-0196', 'Company A');

SELECT * FROM companies;

-- EXERCISE (Assignment): NOT NULL Constraint - Part I
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;


##########################################################
-- SECTION 9: The SQL SELECT Statement
##########################################################

######################
-- Course: SELECT - FROM
SELECT first_name, last_name
FROM employees;
    
SELECT *
FROM employees;

-- EXERCISE (Assignment): SELECT - FROM
SELECT dept_no
FROM departments;

-- EXERCISE (Assignment): SELECT - FROM
SELECT *
FROM departments;

######################
-- Course: WHERE
SELECT *
FROM employees
WHERE first_name = 'Denis';
    
-- EXERCISE (Assignment): WHERE
SELECT *
FROM employees
WHERE first_name = 'Elvis';
    
######################
-- Course: AND

SELECT *
FROM employees
WHERE first_name = 'Denis' AND gender = 'M';
    
-- EXERCISE (Assignment): AND
SELECT *
FROM employees
WHERE first_name = 'Kellie' AND gender = 'F'; 


######################
-- Course: OR

SELECT *
FROM employees
WHERE first_name = 'Denis';
    
SELECT *
FROM employees
WHERE first_name = 'Denis' AND gender = 'M';

SELECT *
FROM employees
WHERE first_name = 'Denis' OR first_name = 'Elvis';

SELECT *
FROM employees
WHERE first_name = 'Denis' AND first_name = 'Elvis';
    
-- EXERCISE (Assignment): OR
SELECT *
FROM employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna'; 
    
######################
-- Course: Operator Precedence

SELECT *
FROM employees
WHERE last_name = 'Denis' AND gender = 'M' OR gender = 'F';

SELECT *
FROM employees
WHERE last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
    
######################
-- EXERCISE (Assignment): Operator Precedence
SELECT *
FROM employees
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');


######################
-- Course: IN / NOT IN

SELECT *
FROM employees
WHERE first_name = 'Cathie' OR first_name = 'Mark' OR first_name = 'Nathan';

SELECT *
FROM
    employees
WHERE first_name IN ('Cathie' , 'Mark', 'Nathan');

SELECT *
FROM employees
WHERE first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
-- EXERCISE (Assignment 1): IN / NOT IN    
SELECT *
FROM employees
WHERE first_name IN ('Denis' , 'Elvis');
    
-- EXERCISE (Assignment 2): IN / NOT IN 
SELECT *
FROM employees
WHERE first_name NOT IN ('John' , 'Mark', 'Jacob');

######################
-- Course: LIKE / NOT LIKE 

SELECT *
FROM employees
WHERE first_name LIKE('Mar%');
    
SELECT *
FROM employees
WHERE first_name LIKE('ar%');

SELECT *
FROM employees
WHERE first_name LIKE('%ar');
    
SELECT *
FROM employees
WHERE first_name LIKE('%ar%');

SELECT *
FROM employees
WHERE first_name LIKE ('Mar_');
    
SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Mar%');

-- EXERCISE (Assignment): LIKE / NOT LIKE 
SELECT *
FROM employees
WHERE first_name LIKE('Mark%');

SELECT *
FROM employees
WHERE hire_date LIKE ('%2000%');

SELECT *
FROM employees
WHERE emp_no LIKE ('1000_');
    
######################
-- EXERCISE (Assignment): Wildcard Characters
SELECT *
FROM employees
WHERE first_name LIKE ('%JACK%');

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Jack%'); 
    

######################
-- Course: BETWEEN - AND
   
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
    
SELECT *
FROM employees
WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';    

-- EXERCISE (Assignment): BETWEEN - AND
SELECT *
FROM salaries;

SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;
    
SELECT *
FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';
    
SELECT dept_name
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

    
######################
-- Course: IS NOT NULL / IS NULL
    
SELECT *
FROM employees
WHERE first_name IS NOT NULL;
    
SELECT *
FROM employees
WHERE first_name IS NULL;

-- EXERCISE (Assignment): IS NOT NULL / IS NULL
SELECT dept_name
FROM departments
WHERE dept_no IS NOT NULL;


######################
-- Course: Other Comparison Operators

SELECT *
FROM employees
WHERE first_name = 'Mark';
    
SELECT *
FROM employees
WHERE first_name <> 'Mark';
    
SELECT *
FROM employees
WHERE first_name != 'Mark';
    
SELECT *
FROM employees
WHERE hire_date > '2000-01-01';
    
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';

SELECT *
FROM employees
WHERE hire_date < '1985-02-01';
    
SELECT *
FROM employees
WHERE hire_date <= '1985-02-01';

-- EXERCISE (Assignment): Other Comparison Operators
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND gender = 'F';

SELECT *
FROM salaries
WHERE salary > 150000;


######################
-- Course: SELECT DISTINCT

SELECT gender
FROM employees;
    
SELECT DISTINCT gender
FROM employees;
    
-- EXERCISE (Assignment): SELECT DISTINCT
SELECT DISTINCT hire_date
FROM employees;
    

######################
-- Course: Introduction to Aggregate Functions    
    
SELECT COUNT(emp_no)
FROM employees;
    
SELECT *
FROM employees
WHERE first_name IS NULL;
    
SELECT COUNT(first_name)
FROM employees;

SELECT COUNT(DISTINCT first_name)
FROM employees;

-- EXERCISE (Assignment): Introduction to Aggregate Functions
SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;
    
SELECT COUNT(*)
FROM dept_manager;


######################
-- Course: ORDER BY

SELECT *
FROM employees
ORDER BY first_name;

SELECT *
FROM employees
ORDER BY first_name ASC;

SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT *
FROM employees
ORDER BY emp_no DESC;

SELECT *
FROM employees
ORDER BY first_name , last_name ASC;

-- EXERCISE (Assignment): ORDER BY
SELECT *
FROM employees
ORDER BY hire_date DESC;


######################
-- Course: GROUP BY

SELECT first_name
FROM employees;
    
SELECT first_name
FROM employees
GROUP BY first_name;

SELECT DISTINCT first_name
FROM employees;

SELECT COUNT(first_name)
FROM employees
GROUP BY first_name;

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name;

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
ORDER BY first_name DESC;


######################
-- Course: Using Aliases (AS)

SELECT  first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
ORDER BY first_name DESC;

-- EXERCISE (Assignment): Using Aliases (AS)
SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;


######################
-- Coourse: HAVING

SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';
    
SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

/*
SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;
*/

SELECT first_name, COUNT(first_name) as names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

-- EXERCISE (Assignment): HAVING
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

# When using WHERE instead of HAVING, the output is larger because in the output we include 
# individual contracts higher than $120,000 per year. The output does not contain average salary values.

# Finally, using the star symbol instead of “emp_no” extracts a list that contains all columns 
# from the “salaries” table.


######################
-- Course: WHERE vs HAVING - Part I

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;


######################
-- Course: WHERE vs HAVING - Part II

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) < 200 AND hire_date > '1999-01-01'
ORDER BY first_name DESC;

-- EXERCISE (Assignment): WHERE vs HAVING - Part II
SELECT emp_no, from_date
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;


######################
-- Course: LIMIT

SELECT *
FROM salaries;
    
SELECT *
FROM salaries
ORDER BY salary DESC;

SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
LIMIT 100;

-- EXERCISE (Assignment): LIMIT
SELECT *
FROM dept_emp
LIMIT 100;


    
