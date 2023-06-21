-- Write a query to find the total order amount for each customer whose 
-- total order amount is greater than the average total order amount across all customers.

Select c.customerName, sum(od.priceEach) as total_order_amount
From classicmodels.orders o
Join classicmodels.customers c
ON o.customerNumber=c.customerNumber
Join classicmodels.orderdetails od
ON od.orderNumber=o.orderNumber
WHERE priceEach > (Select avg(priceEach) From classicmodels.orderdetails)
Group by customerName;

/*
-- 1)Write a query to find the names of all customers who have placed an order in the past month, but who have not placed an order in the past week.

/*SELECT c.customerName, orderDate = '2003-02-11'
FROM classicmodels.customers c
JOIN classicmodels.orders o
USING (customerNumber)
WHERE orderDate = (SELECT o.orderDate where orderDate between 2003-01-01 and 2003-01-31 and orderDate between 2003-02-04 and 2003-02-11 is null );
*/
Select c.customerName
from classicmodels.customers c
where customerNumber in(
	Select customerNumber
    From classicmodels.orders
    Where orderDate > date_sub('2003-05-21', interval 1 month)
    Group by customerNumber
    Having Max(orderDate) < date_sub('2003-05-21', interval 1 week)
    );
 
-- HAVING EXAMPLES
 
 SELECT productLine, Max(buyPrice) AS maxBuyPrice 
FROM classicmodels.products
GROUP BY productLine
HAVING maxBuyPrice > 85;

--    
 SELECT e.officeCode, o.city, count(*) as headCount
FROM classicmodels.employees e 
INNER JOIN classicmodels.offices o
ON e.officeCode= o.officeCode
GROUP BY e.officeCode
HAVING count(*) > 3;

-- 
   






