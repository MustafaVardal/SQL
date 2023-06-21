-- Temp table CTE
WITH customer_USA AS 
(
select *
FROM classicmodels.customers
Where country = 'USA'
)
SELECT customerName, state
From customer_USA
Where state = 'NY';

WITH raking_table as
(
SELECT first_name, last_name, department_id, salary,
RANK() OVER(PARTITION BY department_id Order by salary) salary_rank_per_dep
from hr.employees
)
SELECT *
From raking_table
WHERE salary_rank_per_dep = 4;

WITH CTE1 AS
(
SELECT first_name, last_name, department_id, salary,
RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) salary_rank
FROM hr.employees
),
add_dept_name AS
(
SELECT C1.first_name, C1.last_name, C2.department_name, C1.salary, C1.salary_rank
FROM CTE1 C1
INNER JOIN hr.departments C2
ON C1.department_id = C2.department_id
)
SELECT first_name, last_name, department_name, salary
FROM add_dept_name
WHERE salary_rank =1;



WITH find_marketing as
(
SELECT department_id,
RANK() OVER(PARTITION BY department_id ORDER BY department_name) AS S
From hr.departments
)
SELECT first_name, last_name, department_id
FROM hr.find_marketing;

-- Write a SQL query to find those employees who work in the department ‘Marketing’. Return first name, last name and department ID.
with marketing_employees as
( Select e.first_name, e.last_name, d.department_id
  from hr.employees e
  join hr.departments d
  on d.department_id = e.department_id
  where d.department_name= 'Marketing'
)
select first_name, last_name, department_id
from marketing_employees;

-- Using CTE Write a SQL query to find those employees whose salary matches to the salary of the employee who works in that department of ID 40. 
-- Return first name, last name, salary, and department ID.
WITH dep40 as
( Select salary, department_id
from hr.employees
where department_id = 40
)
Select e.first_name, e.last_name, e.salary, e.department_id
from hr.employees e
join dep40 d
on e.salary = d.salary;


-- Using CTE Write a SQL query to find those employees whose salary matches to the salary of the employee who works in that department of ID 40. 
-- Return first name, last name, salary, and department ID.

with department_40 as
(
select salary, department_id
from hr.employees
where department_id = 40
)
select e.first_name, e.last_name, e.salary, e.department_id
from hr.employees e
join department_40 d
on e.salary = d.salary;

-- Write a SQL query to find those employees who work in the department where the employee with employee_id=201. Return first name, last name, salary, and department ID.

with emp_201 as
(
select department_id
from hr.employees
where employee_id=201
)
select e.first_name, e.last_name, e.salary, e.department_id, e.employee_id
from hr.employees e
join emp_201 e2
on e.department_id = e2.department_id;


-- Write a SQL query to find those employees who work in the department where the employee with employee_id=201. Return first name, last name, salary, and department ID.

with empl_id as
(
select department_id
from hr.employees
where employee_id =201
)
select e.first_name, e.last_name, e.salary, e.department_id
from hr.employees e
join empl_id ei
on e.department_id = ei.department_id;

/*
4) Write a SQL query to find those employees who work in departments located at 'United Kingdom’.
Return first name.
*/

with c_name as
(
	select country_id
    from hr.countries
    where country_name = 'United Kingdom'
), 
cte2 as
( Select location_id
from hr.locations l
join c_name c
on l.country_id = c.country_id
),
cte3 as
(select department_id
from hr.departments d
join cte2 c2
on d.location_id= c2.location_id
)
Select e.first_name
from hr.employees e
join cte3 c3
on e.department_id=c3.department_id