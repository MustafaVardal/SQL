/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
With using Group by and selection it will bring to you non duplicate data from database. Like Customer_id. 
For example, Select salesRepEmployeeNumber From classicmodels.customers Group by salesRepEmployeeNumber. It will bring whole unique datas.
If you wanna see the count unique data you can use count(*) or count(column_name) in select statement.
Having
If you wanna filtre cumulative data, you need to use having instead of where. sum(), count(),  min()..... etc. 
we need to use having to filtre cumulative datas. where function is working for data filtre...
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


-- Use the countries table. Write a sql query that returns the number of countries in each region.
-- Find the regions that have exactly 6 countries ().

-- Use the departments table. Write a sql  query which returns the number of departments in each location.
-- Find locations that have more than one department.

-- Use the employees table. Write a sql query which returns the number of employees each manager manages.
-- Find the managers who manage more than 10 people
-- Find the managers who manage exactly 6 people

-- Use the employees table.  Extract the first 3 digits of the employees phone number as area_code from the employees table. (Hint: SUBSTR(PHONE_NUMBER,1,3))
-- Find how many employees in each area code.

-- Use the employees table.  Find out how many employees were hired each year. ( Hint: to get the year SUBSTR(hire_date, 8,2) or EXTRACT(YEAR FROM hire_date) )*/

-- Managers want to see all products in inventory.
SELECT count(*)
FROM classicmodels.products;

-- Managers want to see not all products to see only one specific product he wanna see it. how many we have '1952 Alpine Renault 1300'.
SELECT count(*)
FROM classicmodels.products
WHERE productName  = '1952 Alpine Renault 1300';


-- Use the countries table. Write a sql query that returns the number of countries in each region.
-- Find the regions that have exactly 6 countries (). 

SELECT c.region_id, count(*) as countryCount
FROM hr.countries c
GROUP BY region_id
HAVING countryCount = 6;

-- Use the departments table. Write a sql  query which returns the number of departments in each location.
-- Find locations that have more than one department.
SELECT count(department_id) as departmentCount, location_id
FROM hr.departments
GROUP BY location_id
HAVING departmentCount > 1;

-- Use the employees table. Write a sql query which returns the number of employees each manager manages.
-- Find the managers who manage more than 10 people
-- Find the managers who manage exactly 6 people

SELECT COUNT(employee_id) as employee, manager_id
FROM hr.employees
GROUP BY manager_id
HAVING employee> 10;

SELECT COUNT(employee_id), manager_id
FROM hr.employees
GROUP BY manager_id
HAVING count(employee_id)= 6;

-- Use the employees table.  Extract the first 3 digits of the employees phone number as area_code from the employees table. (Hint: SUBSTR(PHONE_NUMBER,1,3))
-- Find how many employees in each area code.

SELECT substr(phone_number,1,3) as area_code, count(employee_id)
FROM hr.employees
GROUP BY area_code;

-- Use the employees table.  Find out how many employees were hired each year. ( Hint: to get the year SUBSTR(hire_date, 8,2) or EXTRACT(YEAR FROM hire_date) )*/

SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS num_employees
FROM hr.employees
GROUP BY hire_year
ORDER BY hire_year;

-- Use the employees table. Find out how many employees were hired in July.
-- (Hint: hire_date LIKE ‘%JULY%’ or SUBSTR(hire_date ,4,3)= ‘JUL’ or EXTRACT(MONTH FROM E.hire_date) = 7) 

SELECT COUNT(*)
FROM hr.employees
WHERE hire_date LIKE '%JULY%';-- WHERE EXTRACT(MONTH FROM hire_date) = 7;
-- Differences having and where.
SELECT EXTRACT(MONTH FROM hire_date) AS hireMonth , count(*)
FROM hr.employees
GROUP BY hireMonth
HAVING hireMonth = 7 ;

/*
7) Use the employees table
    a. Find the sum of all salary for each department
    b. Find the average of all salary for each id
    c. Find the minimum salary of each department
    d. Find the max salary of the following departments: 50, 90, and 100.
*/
-- a.
SELECT sum(salary) AS totalSalary, department_id
FROM hr.employees
GROUP BY department_id;

-- b.
SELECT department_id, avg(salary) as averageSalary
FROM hr.employees
GROUP BY department_id;

-- c.
SELECT department_id, min(salary) AS minSalary
FROM hr.employees
Group by department_id
Having minSalary;

-- d.
SELECT department_id, max(salary) AS maxSalary
FROM hr.employees
WHERE department_id in (50,90,100)
GROUP BY department_id
HAVING maxSalary ;