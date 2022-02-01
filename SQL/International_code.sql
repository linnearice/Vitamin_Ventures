select * from web_sales_with_product_info
where country<>'United States';

--Country total website sales by year
select country, year, sum(net_sales)
into top_country_sales_by_year
from web_sales_with_product_info
where country<>'United States'and year<>2022
group by year,country
order by year, sum desc;

--Country website sales by year
select year, date, sum(net_sales)as sum_net_sales
into international_sales_by_month
from web_sales_with_product_info

select product_sku, product_title, sum(orders)as sum_orders,sum(net_sales)as sum_net_sales
into products_international_bottom
from web_sales_with_product_info
where country<>'United States'
group by product_sku,product_title;





-- Quarterly Sales by top ten Countries
select country, year, quarter,sum(net_sales)
--into top_10_international_countries
from web_sales_with_product_info
where country<>'United States' and country ='Canada' or country='Kuwait' or country='Saudi Arabia' or country='United Arab Emirates' or country ='United Kingdom' or
	country='Australia' or country = 'Qatar' or country='Bahrain' or country='France' or country ='Singapore' and year<>2022
group by year, country, quarter
order by year, sum desc;

-- Country sales by year by category
select category, year, sum(net_sales)
from web_sales_with_product_info
where country<>'United States' and year<>2022 and category<>'Shipping'
group by year, category
order by year,sum desc;

--Country by year by product
select product_sku,product_title,year,sum(net_sales)
from web_sales_with_product_info
where country<>'United States'and year<>2022
group by year,product_sku, product_title
order by year,sum desc;

--Country sales by year by product by country
select country,product_sku,product_title,year,sum(net_sales)
from web_sales_with_product_info
where country<>'United States'and year<>2022
group by year,country, product_sku, product_title
order by year,sum desc;


select * from top_country_sales
where year<>2022 and country<>'United States'
order by year,sum desc;

select country, year, sum(net_sales) from web_sales_with_product_info
where year<>2022 and country<>'United States'
group by year, country
order by year,sum desc;