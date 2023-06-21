
-- Write a SQL query to find the name of the country, city, and departments, which are running there (inner join)
Select d.department_name, c.country_name, l.city --  table name.column name 
From hr.locations l -- table 
Join hr.countries c -- table
Using (country_id)
Join hr.departments d -- table 
Using(location_id);

-- Write a SQL query to find the department name and the full name (first and last name) of the manager (inner join)
Show keys from hr.departments;
Show keys from hr.employees; -- job_id and department_id we are gonna use because of department_id is primary key to combine both table.WE CAN USE EMPLOYEES TABLE FOR FROM STATEMENT
Show keys from hr.jobs;

SELECT d.department_name, concat(e.first_name,' ', e.last_name) as manager_fullname, job_id
FROM hr.employees 
JOIN hr.departments d
USING (department_id) -- Bring both department_id column which is equal or not...
-- ON e.department_id = d.department_id --------------- If d.department_id is not equal e.department_id, then bring only which column is same department_id. that's why it will bring 12 column.
JOIN hr.jobs j
USING (job_id) 
WHERE j.job_title LIKE ('%Manager');

-- Write a SQL query to find those employees who earn $12000 and above. Return employee ID, starting date, end date, job ID, and department ID (inner join).

SHOW KEYS FROM hr.departments;
SHOW KEYS FROM hr.job_history; -- department id with employee id and e,employee id = jhemployee id
SHOW KEYS FROM hr.employees; 
SELECT  d.department_id, jh.start_date, jh.end_date, e.employee_id, e.salary, e.first_name
FROM hr.employees e
JOIN hr.departments d
ON d.department_id = e.department_id
JOIN hr.job_history jh
USING (job_id) -- ALL THE TIME EMPLOYEES SALARY 
-- USING (employee_id) -- EMPLOYEE_ID AND JOB_ID ARE IN TWO OF TABLES WHICH ONE WE NEED TO USE? -- JUST ONLY IN JOB HISTORY EMPLOYEES SALARY
WHERE e.salary <12000
ORDER BY e.salary DESC;

-- Write a SQL query to find full name (first and last name), and salary of those employees who work in any department located in ‘London’ city (inner join).

SHOW KEYS FROM hr.locations;
SHOW KEYS FROM hr.employees;
SHOW KEYS FROM hr.departments;

SELECT concat(e.first_name, ' ', e.last_name) as full_name_employee, e.salary, l.city, d.department_name
FROM hr.departments d
JOIN hr.employees e
USING(department_id)
JOIN hr.locations l
ON l.location_id= d.location_id
where l.city = 'London';

-- Write a SQL query to retrieve all country_id, country name, region id, region name from both countries and regions tables (inner join)

SELECT c.country_id, c.country_name, r.region_name, r.region_id
FROM hr.countries c
JOIN hr.regions r
-- ON r.region_id = c.region_id
USING (REGION_ID);

-- 6) Write a SQL query to retrieve all cities, country names from both countries and locations tables (inner join)

SELECT c.country_name, l.city
FROM hr.countries c
JOIN hr.locations l
-- ON l.country_id = c.country_id;
USING (country_id); 

-- Write a SQL query to retrieve the first name, last name, department name, and department number for all employees who work for departments 80, 90 or 100 (inner join)

SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM hr.employees e
JOIN hr.departments d
USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID IN (100,90,80)
GROUP BY first_name, last_name;

-- Write a SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department, city, and state province (multiple inner joins)

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM hr.departments d
JOIN hr.employees e 
USING (department_id)
JOIN hr.locations l
USING (location_id)
WHERE e.first_name like ('%z%');


-- Write a SQL query to retrieve the first name, last name, department number, and name for all employees including those who have or do not have any department (left join)

SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;

-- Write a SQL query to find those employees who have or not any job history data and. Return full name, start date, and end date (right join)

SELECT concat(e.first_name, ' ', e.last_name) as full_name_employee, jh.start_date, jh.end_date
FROM hr.job_history jh
RIGHT JOIN hr.employees e
USING(employee_id);

-- Write a SQL query to return all employees including those who do not have a department name or number and all departments including those which do not have any employees (full outer join)
SELECT *
FROM hr.employees
LEFT OUTER JOIN hr.departments
ON employees.department_id = departments.department_id
WHERE employees.employee_id IS NULL
UNION
SELECT *
FROM hr.departments
RIGHT OUTER JOIN  hr.employees
ON employees.department_id = departments.department_id
WHERE employees.department_id IS NULL;

-- 13) Write a SQL query to find all employees who have the same hire dates (Self join)

SELECT concat(e.first_name, ' ',e.last_name) as employee_full_name, e.hire_date
FROM hr.employees e, hr.employees m
where e.hire_date=m.hire_date and e.employee_id<>m.employee_id
ORDER BY hire_date DESC;


-- 14) Write a SQL query to find those employees who work in a department where the employee of last name ‘Taylor’ works. Return first name, last name and department ID (Self join)

SELECT e.first_name, e.last_name, e.department_id
FROM hr.employees e
JOIN hr.employees e2 
ON e.department_id = e2.department_id
WHERE e2.last_name = 'Taylor'
ORDER BY e.first_name, e.last_name, e.department_id;

-- Write a SQL query that returns a table with the average commission percentage for employees by manager id.

SELECT manager_id, AVG(commission_pct) as avg_commission_percentage
FROM hr.employees
GROUP BY manager_id
order by manager_id asc;

-- 16 Write a SQL query that returns the names of departments where the average employee salary is less
-- than the average employee salary for the whole the company.

SELECT d.department_name, AVG(e.salary) as average_employee_salary
FROM hr.departments d
JOIN hr.employees e 
USING(department_id)
-- ON d.department_id = e.department_id
where average_employee_salary < (SELECT AVG(salary) FROM hr.employees)
GROUP BY d.department_id, d.department_name
ORDER BY d.department_name ASC;

