select * from web_sales_with_product_info
where country='United States';

--US total website sales by year
select country, year, sum(net_sales)
from web_sales_with_product_info
where country='United States'
group by country, year;

--US total website sales by year
select country, year,date, sum(net_sales)as sum_net_sales
into US_sales_by_month
from web_sales_with_product_info
where country='United States' and year<>2022
group by country, year,date
order by year, sum_net_sales desc;

--US sales by year, state
select billing_region, year, sum(net_sales)
into US_sales_by_state
from web_sales_with_product_info
where country='United States'and year <>2022
group by year, billing_region, year
order by year, billing_region; 

--2021 sales
select billing_region,year,sum(net_sales)
into US_2021_sales
from web_sales_with_product_info
where country='United States' and year=2021
group by billing_region,year;

-- 2021 Sales by top ten US States
select billing_region, year, sum(sum)as sum
into top_10_US_states_2021_sales
from US_2021_sales
where billing_region ='California' or billing_region='Texas' or billing_region='Florida' or billing_region='New York' or billing_region ='Washington' or
	billing_region='Pennsylvania' or billing_region = 'Illinois' or billing_region='North Carolina' or billing_region='New Jersey' or billing_region ='Virginia'
group by year, billing_region, year
order by year, billing_region;

-- US sales by year by category
select category, year, sum(net_sales)
from web_sales_with_product_info
where country='United States' and year<>2022 and category<>'Shipping'
group by year, category
order by year,sum desc;

__US sales by year by product
select product_sku,product_title,year,sum(net_sales)
from web_sales_with_product_info
where country='United States'and year<>2022
group by year,product_sku, product_title
order by year,sum desc;

--US sales by year by product by state
select product_sku,product_title,year,billing_region, sum(ordered_item_quantity) as units_sold,sum(net_sales)
--into top_us_products
from web_sales_with_product_info
where country='United States'and year=2021 and (billing_region ='California' or billing_region='Texas' or billing_region='Florida' or billing_region='New York' or billing_region ='Washington')
group by year,billing_region, product_sku, product_title
order by year,sum desc;

--Count number of cities
select count(distinct billing_city),year
from web_sales_with_product_info
where country='United States'
group by year;

select * from web_sales_with_product_info;

--US total website sales by year
select country, year, quarter, sum(net_sales)
into US_quarter_sales
from web_sales_with_product_info
where country='United States' and year<>2022
group by country, year, quarter
order by quarter;

select * from top_company_products
where year=2021
order by sum_net_sales desc;

select * from company_product_by_channel_summary;

select product_sku,product_title,year, sum(ordered_item_quantity) as units_sold,sum(net_sales)
into products_US_bottom
from web_sales_with_product_info
where country='United States'and year=2021
group by year, product_sku, product_title
order by year,sum desc;
