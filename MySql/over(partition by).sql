/*
Write a SQL query which returns employees first names, last names, department id and minimum, maximum, total and average salary, and employee headcount for each department. 
Note that each department is considered as one partition in this example.*/
Select first_name, last_name, department_id, salary,
min(salary) over(partition by (department_id)) as min_salary_each_department,
max(salary) over(partition by (department_id)) as max_salary_each_department,
sum(salary) over(partition by (department_id)) as total_salary_each_department,
avg(salary) over(partition by (department_id)) as avg_salary_each_department,
count(*) over(partition by (department_id)) as count_of_employees

From hr.employees;


select first_name, last_name, department_id, salary,
first_value(first_name) over (partition by department_id order by salary range between unbounded preceding and unbounded following) as highest_salary
from hr.employees;

/*Write a sql query which returns first and last names, department ids, salaries of the employees and the employees who have the highest salary in each department.*/

SELECT first_name, last_name, department_id, salary,
last_value (first_name) over (partition by department_id order by salary range between unbounded preceding and unbounded following) as highest_salary
FROM hr.employees;

SELECT first_name, last_name, department_id, salary,
FIRST_VALUE (first_name) over (partition by department_id order by salary DESC range between unbounded preceding and unbounded following) as highest_salary
FROM hr.employees;

-- Who has the highest salary in each department?
Select first_name, last_name, department_id, salary,
max(salary) over (partition by department_id order by salary range between unbounded preceding and unbounded following) as highest_salary
from hr.employees;
-- What is the highest salary in the company overall?
SELECT first_name, last_name, manager_id, salary,
max(salary) over(partition by manager_id order by salary range between unbounded preceding and unbounded following) as highest_salary
from hr.employees;

-- rank()
-- dense_rank()
-- ntile()
-- row_number()
-- lead(column_name, iteration_number, use for null value 0) next iteration
-- lag(column_name, iteration_number, use for null value 0e) previous iteration

Select first_name, last_name, department_id, salary,
rank() over(partition by department_id order by salary range between unbounded preceding and unbounded following) as rank_employees
from hr.employees;

Select first_name, last_name, department_id, salary,
dense_rank() over(order by department_id range between unbounded preceding and unbounded following) as rank_dense_employees
from hr.employees;


Select first_name, last_name, department_id, salary,
row_number() over(order by department_id range between unbounded preceding and unbounded following) as row_Number_emp
From hr.employees;

Select first_name, last_name, department_id, salary,
lead(department_id,1,0) over(order by department_id range between unbounded preceding and unbounded following) as after_department_id
from hr.employees;

Select first_name, last_name, department_id, salary,
lag(department_id,1,0) over (order by department_id range between unbounded preceding and unbounded following) as prev_depart_id
from hr.employees;

Select first_name, last_name, department_id, salary,
percent_rank() over(partition by salary order by department_id)
from hr.employees

