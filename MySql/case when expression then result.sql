-- CASE statement
/*
The CASE statement allows you to evaluate a list of conditions and returns one of the possible results.
In other words, it goes through conditions and returns a value when the first condition is met.
If no conditions is met, then it will return the value (default value) in the ELSE statement. 
​
CASE STATEMENT IS USED FOR CATEGORIZING AND AGGREGATING
​
Basic Syntax
SELECT field(s),
CASE WHEN expression_1 THEN result_1
	 WHEN expression_2 THEN result_2
     WHEN expression_3 THEN result_3
     ELSE default_result (optional)
END
FROM table;
*/
/* Create a new column which categorizes products as LOW and HIGH based on the quantity in stock
If quantity in stock < 5,000 stock is "LOW"
If quantity in stock >= 5,000 stock is "HIGH"
*/
SELECT productName, quantityInStock,
	CASE 
		WHEN quantityInStock < 5000 THEN "LOW"
        WHEN quantityInStock >= 5000 THEN "HIGH"
	END AS minimumstock
FROM classicmodels.products; 

 /* Create a new column which categorizes products as LOW and HIGH based on the quantity in stock
If quantity in stock < 5,000 stock is "LOW"
If quantity in stock >= 6,000 stock is "HIGH"
WHEN quantityInStock <= 5999 and  quantityInStock >5001 THEN "AVERAGE"
*/      
SELECT quantityInStock,productName,
	CASE 
		WHEN quantityInStock < 5000 THEN "LOW"
		WHEN quantityInStock <= 5999 and  quantityInStock >5001 THEN "AVERAGE"
        WHEN quantityInStock >= 6000 THEN "HIGH"
        ELSE "UNKNOWN"
	END AS stockLevel
FROM classicmodels.products;

/*
We would like to categorize the prices in the products table to different price level based on their buy price.
Let’s follow the logic below while categorizing the products.
buyPrice < 30: Low Price
buyPrice >= 30 AND buyPrice < 50: Medium Price
buyPrice >= 50 AND buyPrice < 80: High Price
buyPrice >= 80: Very High Price
All other prices including NULL : Unknown
*/

SELECT productName, buyPrice,
	CASE
		WHEN buyPrice < 30 					  THEN "Low Price"
        WHEN buyPrice >= 30 AND buyPrice < 50 THEN "Medium Price"
        WHEN buyPrice >=50  AND buyPrice <80  THEN "High Price"
        WHEN buyPrice >=80  				  THEN "Very High Price"
        ELSE "UNKNOWN"
	END AS priceScala
FROM classicmodels.products;

/*
Basic Syntax
SELECT field(s),
CASE WHEN expression_1 THEN result_1
	 WHEN expression_2 THEN result_2
     WHEN expression_3 THEN result_3
     ELSE default_result (optional)
END
FROM table;
​
SELECT field(s),
CASE expression
	WHEN e1 THEN result_1
    WHEN e2 THEN result_2
    WHEN e3 THEN result_3
    ELSE default_result (optional)
END
FROM table;
*/

SELECT orderNumber, shippedDate - orderDate,
	CASE shippedDate - orderDate
		WHEN 1 THEN '1 Days'
        WHEN 2 THEN '2 Days'
        WHEN 3 THEN '3 Days'
        ELSE '3+ days'
	END AS "Days to Ship"
FROM classicmodels.orders;