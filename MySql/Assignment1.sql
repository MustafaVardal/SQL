/*
1) Display all of the fields in the employees table.
*/
select *
from hr.emp_details_view;

/*
2) Display the first and last names of all employees, as well as their job title.
*/

select firstName, lastName, jobTitle
from classicmodels.employees;


/*
3) Display the first name, last name, and job title for the top 3 highest rank employees at Classic Models Inc.
Hint: The employees table is already sorted by employee rank
*/

select firstName, LastName, jobTitle
from classicmodels.emplemployeesoyees
limit 3;

/*
4) Display a list of distinct jobs performed at Classic Models Inc.
*/

select distinct jobTitle
from classicmodels.employees;

/*
5) Display a list of the different product lines that are sold by Classic Models Inc.?
*/

select distinct productLine
from classicmodels.products;



/*
6) What individual columns would work as a primary key for the products table?
*/
Select productCode -- it is coming from orderdetails.
from classicmodels.products;

/*
7) Display the product name and product line for all items that Classic Models Inc. buys from Second Gear Diecast.
*/

select productName, productLine
from classicmodels.products
where productVendor = "Second Gear Diecast";

/*
8) Display all of the order numbers for customer 486.
*/

select distinct orderNumber
from classicmodels.orders
where customerNumber = 486;

/*
9) Display all of the order numbers for customer 486 that have shipped.
*/
select  distinct orderNumber
from classicmodels.orders
where status = "Shipped";

/*
10) Display all of the order numbers for customer 486 that have shipped and there are no comments associated with the order.
*/
select orderNumber, customerNumber, status, comments
from classicmodels.orders
 where  customerNumber = 486 and status = "Shipped" and comments is null; 

 /*
11) Display all of the order numbers for customers with a customer numner higher than 400 that have shipped and there are no comments associated with the order.
*/
select customerNumber,orderNumber, status , comments
from classicmodels.orders
where customerNumber>400 and status = "Shipped" and comments is null;

/*
12) Display the customer number of any customer that has made a payment greater than $10,000. Do not include duplicate customer numbers.
*/
select distinct customerNumber, amount
from classicmodels.payments
where amount > 10000;

/*
13) Display the 10 smallest payments to Classic Models Inc.
*/
select *
from classicmodels.payments
order by amount asc
limit 10;

/*
14) Display the 5 smallest payments to Classic Models Inc. from the year 2004.
*/
select *
from classicmodels.payments
where year(paymentDate) = 2004
order by amount asc
limit 5;

/*
15) Display the top 5 highest paid employees by in alphabetical order by last name.
*/
select  distinct last_name , salary
from  hr.employees 
order by salary desc,  last_name asc
limit 5;

/*
16) Display a list of countries where we have information about the state a customer comes from.
*/

select state, country
from  classicmodels.customers
where country is not null and state is not null;

/*
17) Display the customer name and phone number for customers located in New York City or Barcelona.
*/

select customerName, phone, city
from classicmodels.customers
where city = "NYC" or city = "New York City"  or city= "Barcelona";

/*
18) Display the customer name and phone number for customers that do not have a sales representative assigned.
*/

select customerName, phone, salesRepEmployeeNumber
from classicmodels.customers
where salesRepEmployeeNumber is null;

/*
19) Display the sales representative employee numbers for customers located in France.
*/

select salesRepEmployeeNumber, country, contactFirstName
from classicmodels.customers
where country is not null and country = "France";

/*
20) Display the customer name and phone number for all customers with a contact first name of Julie not located in California.
*/

select contactFirstName,phone, state
from classicmodels.customers
WHERE contactFirstName= "Julie" and state!= "CA" ;









