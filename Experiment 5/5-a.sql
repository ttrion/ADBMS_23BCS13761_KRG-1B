/*Views: Performance Benchmarking : Normal View vs. Materialized View (Medium)
1. Create a large dataset: 
   - Create a table names transaction_data (id , value) with 1 million records.
	- take id 1 and 2, and for each id, generate 1 million records in value column
   - Use Generate_series () and random() to populate the data.
2. Create a normal view and materialized view to for sales_summary, which includes total_quantity_sold, 
total_sales, and total_orders with aggregation.
3. Compare the performance and execution time of both.
*/
drop table if exists transaction_data;

create table transaction_data
(id int, val int);

insert into transaction_data
select 1, random()* 500000 + 100 from generate_series(1,1500000);

insert into transaction_data
select 2, random()* 500000 + 100 from generate_series(1,1500000);

select count(*)
from transaction_data
where id = 2 and val > 400000;

create or replace view v_sales_summary
as
select count(*) as total_orders,
sum(val) as total_sales,
round(avg(val),2) as average_price
from
transaction_data;

explain analyze
select * from v_sales_summary;

drop materialized view if exists mv_sales_summary;

create materialized view mv_sales_summary
as
select count(*) as total_orders,
sum(val) as total_sales,
round(avg(val),2) as average_price
from
transaction_data;

explain analyze
select * from mv_sales_summary;