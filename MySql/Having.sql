Select  o.officeCode, o.city, count(*) as headCount
From classicmodels.employees e
Join classicmodels.offices o
Using(officeCode)
Group by 1
Order by 3 ; -- means select 3 column 

Select  o.officeCode, o.city, count(*) as headCount
From classicmodels.employees e
Join classicmodels.offices o
Using(officeCode)
Group by 1
Having headCount>2; -- kidda where filtre

Select productLine, count(*) as productCount
From classicmodels.products
where quantityInStock >1000
group by productLine
having productCount >=10;

Select productLine, sum(quantityInStock) as totalStock
From classicmodels.products
group by productLine
having totalStock between 60000 and 120000;