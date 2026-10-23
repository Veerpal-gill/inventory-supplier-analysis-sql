
### creating the database

create database Apex_Project;
use Apex_Project;

select * from inventory;

### Uploaded  Datasets and Rename it as suppliers
### Uploaded  Datasets and Rename it as inventory

### Q.1 How many products are currently in inventory?

select count(*) as Total_Products
from inventory;

### Answer: 10 Total_Products

### Q.2 What is the total inventory value?

select sum(Units_In_stock * unit_Cost) as Inventory_value
from inventory;
  
### Answer: The Inventory value is $76660.
  
### Q.3 Which Category has the highest stock?
  
select category , sum(Units_In_Stock) as Total_Stock 
from Inventory
group by category
order by Total_Stock desc
limit 1;

### Answer: Electronics has the highest stock of 178 units.

### Q.4 Which products need restocking (stock below Reorder level)?
 
select Product_Name, Units_IN_Stock, Reorder_level 
from inventory
where units_In_Stock< Reorder_level;

### Office chair, Microwave and Air Fryer need restocking.

### Q.5 Which supplier provides the most products?

select Supplier_ID, Count(*) as Product_Count
from inventory
group by supplier_ID
Order by Product_Count desc;

### Answer: All 10 suppliers tie exactly at 1 product each.

### Q.6 Which suppleier_1 has the Highest Rating?

Select Supplier_Name, Supplier_Rating
From Suppliers
Order By Supplier_Rating Desc
LIMIT 1;

### Answer: Supplier_1 has the Highest Rating.

### Q.7 Which state has the most Suppliers?

select state , count(*) as Supplier_Count
from Suppliers
group by state
order by Supplier_Count desc
limit 1;

### Answer: California, with 11 suppliers.

### Q.8 Which supplier category contributes the highest inventory value?

select S.Category, sum(i.units_in_stock * i.Unit_cost) as Inventory_value
from inventory i
inner join suppliers s 
on i.supplier_ID = s.supplier_ID
group by s.category
order by Inventory_value desc
limit 1;

### Answer: Electronics category contributes the highest inventory value of $ 40000.
 