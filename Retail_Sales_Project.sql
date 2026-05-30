use retail_sales

select *from [dbo].[retail_sales]

select COUNT(*) from retail_sales

select COUNT (*) AS Total 
from retail_sales;

select Gender , SUM (Total_Amount) as total_sales
from retail_sales 
group by Gender ;

select Product_Category , COUNT(*)as total_orders
from retail_sales 
group by  PRODUCT_category
order by total_orders DESC ;

select Age, ROUND (avg ( Total_Amount),2) as avg_bill
from retail_sales
group by age 
order by age; 

select 
      case when age <25 then '18-25'
           when Age < 40 then '26-40'
           else '40+' end as age_group,
      SUM (cast (total_amount as decimal (10,2)))AS revenue, 
      COUNT(distinct (customer ID) as customer 
      from retail_sales
      group by Age;

select SUM(quantity) as 'beauty_qty_female'
from retail_sales
where 'Product_Category' = 'beauty' and Gender= 'female' ;


select Customer_ID, SUM (Total_Amount) as spent,
       RANK() over (order by sum (Total_Amount) DESC) AS spend_rank
from retail_sales
group by Customer_ID;


SELECT Gender,'Product_Category', SUM(Total_amount)as category_sales
from retail_sales
group by Gender
order by Gender, category_sales DESC;


select Customer_ID, SUM(Total_amount)AS customer_spent
from retail_sales
group by Customer_ID
having SUM (Total_amount)> (select AVG(total_amount) from retail_sales
)
order by SUM(Total_Amount) DESC; 