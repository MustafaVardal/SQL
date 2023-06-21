-- This is single line comment sign


/*

	This is multiple line of signal
*/


-- Class 1 Notes
-- 04/11/2023

-- Select
-- Select everything with *
Select *
From classicmodels.employees;
-- Select  specific field by name
Select lastName, firstName, email
From classicmodels.employees;
-- Select lastName firstName and EmployeeNumber
Select lastName, firstName, employeeNumber
From classicmodels.employees;

-- Limit
Select *
From classicmodels.employees
Limit 5;

-- Distinct ilk once dataya bakiliyor daha sonra hangi column basligi alinicaksa 
-- ona bakiliyor ve sonra da district uygulaniyor.
select distinct country
from classicmodels.customers;

select distinct*
from classicmodels.customers
limit 5;

-- Where

select *
from classicmodels.customers;

select customerName, country
from classicmodels.customers
where country = "France";




