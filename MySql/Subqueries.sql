/*Write a SQL query to find those employees who get a higher salary than the employee whose ID is 163. Return first name, last name.
Write a SQL query to find those employees whose designation is the same as the employee whose ID is 169. Return first name, last name, department ID and job ID.
Write a SQL query to find those employees whose salary matches the smallest salary of any of the departments. Return first name, last name and department ID. (Hint: you need to use group by)
Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
Write a SQL query to find those employees who report that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary.
Write a SQL query to find those employees whose salary is in the range of smallest salary, and 2500. Return all the fields.
Write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.
Write a SQL query to find those employees who earn more than the average salary and work in a department with any employee whose first name contains a character a ‘J’. Return employee ID, first name and salary.
Write a SQL query to find those employees who work in a department where the employee’s first name contains a letter ‘T’. Return employee ID, first name and last name.
Write a SQL query to find those employees who work in the same department where ‘Clara’ works. Exclude all those records where the first name is ‘Clara’. Return first name, last name and hire date.
Write a SQL query to find those employees who get the second-highest salary. Return all the fields of the employees.
Write a SQL query to find those employees who do not work in those departments where manager ids are in between 100 and 200. Return all the fields of the employees.
Write a SQL query to find those employees who work in the department ‘Marketing’. Return first name, last name and department ID.
Write a SQL query to find those employees whose salary matches to the salary of the employee who works in that department of ID 40. Return first name, last name, salary, and department ID.
Write a SQL query to find those employees who work in the department  where the employee with employee_id=201 works. Return first name, last name, salary, and department ID.
Write a SQL query to find those employees who earn more than the average salary. Sort the result-set in descending order by salary. Return first name, last name, salary, and department ID.
Write a SQL query to find those employees who work in departments located at ‘United Kingdom’. Return first name.
Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
Write a query to display the employee id, name ( first name and last name ), Salary, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.*/


/*Write a SQL query to find those employees who get a higher salary than the employee whose ID is 163. Return first name, last name.*/
SELECT first_name,last_name
FROM hr.employees
WHERE salary > (SELECT salary
FROM hr.employees e
WHERE e.employee_id = 163);

/*Write a SQL query to find those employees whose designation is the same as the employee whose ID is 169. Return first name, last name, department ID and job ID. (job_id)*/


SELECT es.first_name, es.last_name, es.department_id, es.job_id
FROM hr.employees es
WHERE es.job_id = (SELECT e.job_id
FROM hr.employees e
WHERE employee_id = 169);

/*Write a SQL query to find those employees whose salary matches the smallest salary of any of the departments. Return first name, last name and department ID. (Hint: you need to use group by)*/


SELECT e.first_name, e.last_name, e.department_id
FROM hr.employees e
WHERE ( e.salary) IN (
  SELECT  min(salary) AS min_salary
  FROM hr.employees
  GROUP BY department_id
);

-- Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

SELECT e.employee_id, e.first_name, e.last_name , salary
FROM hr.employees e -- (e is shortchut employees)
WHERE e.salary > (SELECT avg(es.salary) as average_salary
FROM hr.employees es -- (es is just shortcut employees. we can write whatever we want.)
);

/*Write a SQL query to find those employees who report that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary.*/

SELECT first_name, last_name, employee_id, salary
FROM hr.employees
WHERE manager_id IN ( SELECT manager_id 
From hr.employees
WHERE first_name = 'Payam');

-- Write a SQL query to find those employees whose salary is in the range of smallest salary, and 2500. Return all the fields.


SELECT *
FROM hr.employees
WHERE salary between ( SELECT min(salary)
FROM hr.employees ) AND 2500;

-- Write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.

SELECT first_name, last_name, employee_id, job_id , locations.city
FROM hr.departments
JOIN hr.locations
USING (location_id)
JOIN hr. employees
USING (department_id)
WHERE location_id = (SELECT location_id
FROM hr.locations
WHERE city = 'Toronto');


SELECT first_name, last_name, employee_id, job_id
FROM hr.employees
WHERE department_id IN (
  SELECT department_id
  FROM hr.departments
  WHERE location_id IN (
    SELECT location_id
    FROM hr.locations
    WHERE city = 'Toronto'
  )
);
-- 8. Write a SQL query to find those employees who earn more than the average salary and work in a department with any employee whose first name contains a character a ‘J’. Return employee ID, first name and salary.


SELECT e.employee_id, e.first_name, e.salary
From  hr.employees e
WHERE e.salary > (select avg(salary) from hr.employees)
and department_id in (select department_id from hr.employees) and first_name like '%J%';

-- 9. Write a SQL query to find those employees who work in a department where the employee’s first name contains a letter ‘T’. Return employee ID, first name and last name.


Select employee_id, first_name, last_name
From hr.employees
Where department_id in (Select department_id from hr.employees) and first_name like '%T%';


-- 10. Write a SQL query to find those employees who work in the same department where 'Clara' works. Exclude all those records where the first name is 'Clara'. Return first name, last name and hire date.
Select first_name, last_name, hire_date, department_id
from hr.employees
where  department_id = (
Select department_id
From hr.employees where first_name = 'Clara' )  and  first_name <> 'Clara';

-- 11. Write a SQL query to find those employees who get the second-highest salary. Return all the fields of the employees.
Select *
From hr.employees
Where salary = (Select max(salary)
FROM hr.employees
WHERE salary < (Select max(salary) from hr.employees));

-- 12. Write a SQL query to find those employees who do not work in those departments where manager ids are in between 100 and 200. Return all the fields of the employees.
select *
from hr.employees
where department_id not in (select department_id
from hr.departments
where manager_id between 100 and 200);

-- 13. Write a SQL query to find those employees who work in the department 'Marketing'. Return first name, last name and department ID.
Select first_name, last_name, department_id
from hr.employees
where department_id in ( select department_id from hr.departments where department_name = 'Marketing');

-- 14. Write a SQL query to find those employees whose salary matches to the salary of the employee who works in that department of ID 40. Return first name, last name, salary, and department ID.

SELECT first_name, last_name, salary, department_id
from hr.employees
where salary = (select salary from hr.employees where department_id = 40); -- (chance) the first query finds employees with the exact same salary as any employee in department 40 
																		   -- (exact same salary if not subquery does not work. it gives error. error: subquery returns more than 1 row.)
                                                                           -- if I wanna search department_id 80 it will returns nothing because we do not have any exact matches.


SELECT first_name, last_name, salary, department_id
from hr.employees
where salary in (select salary from hr.employees where department_id = 40); -- while the second query finds employees whose salary matches any salary of an employee in department 40.

-- 15. Write a SQL query to find those employees who work in the department  where the employee with employee_id=201 works. Return first name, last name, salary, and department ID.

Select first_name, last_name, salary, department_id, employee_id
from hr.employees
where department_id = (select department_id from hr.employees where employee_id = 201); -- the first query finds employees who belong to the same department as the employee with employee_id 201

Select first_name, last_name, salary, department_id, employee_id
from hr.employees
where department_id in (select department_id from hr.employees where employee_id = 201); -- the second query finds employees who belong to any department that matches the department_id of the employee with employee_id 201.
																						 -- if we add department_id of employee with employee_id 201

-- 16. Write a SQL query to find those employees who earn more than the maximum salary of a department of ID 40. Return first name, last name and department ID. ?????

Select first_name, last_name, department_id, employee_id
from hr.employees
where salary > all (Select max(salary) from hr.employees where department_id = 40);

-- Write a SQL query to find those employees who work in departments located at 'United Kingdom’. Return first name

Select first_name
From hr.employees
Where department_id in 
(Select department_id from hr.departments where location_id in 
(Select location_id from hr.locations where country_id = 
(Select country_id from hr.countries where country_name= 'United Kingdom')));

-- 18. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively 
-- for those employees whose salary is more than and less than the average salary of all employees.
select employee_id, concat( first_name," ",last_name ), salary ,
		Case 
			WHEN salary >= (Select avg(salary) from hr.employees) Then 'HIGH'
			ELSE'LOW'
		END as SalaryStatus
FROM  hr.employees;



/*19. Write a query to display the employee id, name ( first name and last name ), Salary, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively 
for those employees whose salary is more than and less than the average salary of all employees.*/

SELECT employee_id, concat(first_name, ' ' , last_name) as full_name, salary,
round(salary -(select avg(salary) from hr.employees),2) as avgCompare,
case when salary >= (select avg(salary) from hr.employees) Then 'HIGH'
     ELSE 'LOW'
END AS SalaryStatus
from hr.employees;
