/*SELECT c.customerName, o.orderNumber, o.orderDate
FROM classicmodels.customers c
LEFT JOIN classicmodels.orders o
ON c.customerNumber=o.customerNumber;*/
 SELECT Distinct concat(c.contactFirstName, " " , c.contactLastName) as fullName, o.orderNumber, o.orderDate
    FROM classicmodels.customers c
    LEFT JOIN classicmodels.orders o
    ON c.customerNumber = o.customerNumber;

    SELECT Distinct concat(c.contactFirstName, " " , c.contactLastName) as fullName, c.creditLimit
    FROM classicmodels.customers c 
    LEFT JOIN classicmodels.orders
    ON c.customerNumber=orders.customerNumber
    WHERE c.creditLimit = 0 ;
/*
Report customers and their payments.
List all orders with order number, customer name and order date
List all customers who have or not have any order. Return customer name, order number, and order date
List all customers with customer name who have no orders.
Report products with their description. Return product code, name, and description.
List all orders with order date, order line number, product name, quantity ordered, and price for each product. (HINT: join orders, orderdetails, and products tables)
List all employees who have or not have any customers. Return employee first name, last name, customer name, check number, and amount paid. (HINT: join employees, customers, and payments tables)
*/