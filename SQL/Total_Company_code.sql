create table product_info(
Product_sku varchar(50),
Title varchar(100),
Product_Grouping varchar(30),
Category varchar(50));

select * from product_info;
delete from web_sales_by_location;

create table web_sales_by_location(
country varchar(75),
billing_city varchar(75),
billing_region varchar(50),
billing_postal_code varchar(50),
product_sku varchar(50),
api_client_title varchar(100),
shipping_city varchar(75),
date date,
year int,
quarter date,
orders int,
gross_sales double precision,
discounts double precision,
returns double precision,
net_sales double precision,
shipping double precision,
taxes double precision,
total_sales double precision,
ordered_item_quantity double precision);

select * from web_sales_by_location;

create table company_name_by_channel(
Channel varchar (100),
Channel_original varchar(100),
Sku varchar(50),
date date,
year int,
month int,
Quantity int,
Gross_Sales double precision,
Netsales double precision);

select * from company_name_by_channel;

select count(*)
from company_sales;

select * from regional_sales;

-- join product_info and web_sales_by_location
with web_sales_with_info as (
select p_sales.*, p_info.*
from web_sales_by_location as p_sales
left join product_info as p_info
on p_sales.product_sku=p_info.product_sku
)
select *
from web_sales_with_info;

--make table with product info 
select p_sales.*, p_info.product_title, p_info.product_grouping,p_info.category
into web_sales_with_product_info
from web_sales_by_location as p_sales
left join product_info as p_info
on p_sales.product_sku = p_info.product_sku;

-- Net_sales by Country
select country, sum(net_sales)
from web_sales
group by country
order by sum(net_sales) desc;

-- Top 10 countries by net sales
select country, year, sum(net_sales)
--into top_country_sales
from web_sales_with_product_info
where country<>'United States'
group by year, country
--having sum(net_sales)>12000
order by year,sum(net_sales) desc;



-- Net sales by country by product
select country, product_sku, product_title, product_grouping, sum(net_sales)
from web_sales
group by country, product_sku, product_title,product_grouping
order by sum(net_sales) desc, country;

--top countries product sales
select year, country, sum(net_sales)
into top_country_sales
from web_sales_by_location
where country='United States' or country = 'Canada' or country='Saudi Arabia' or country='Kuwait' or country='United Arab Emirates' or
	country='United Kingdom' or country = 'Australia' or country = 'Bahrain' or country ='Qatar' or country ='Indonesia'
group by year,country 
order by country, sum(net_sales) desc;

--Calculate total sales by year
select year, sum(netsales)
from company_name_by_channel
group by year
order by year;

select date, sum(netsales)
--into company_sales_by_date
from company_name_by_channel
group by date
order by date;

--Web sales per year
select year, sum(net_sales)
from web_sales_by_location
group by year;

--web sales per date
select date,sum(net_sales)
into web_sales_summary_by_date
from web_sales_by_location
group by date
order by date;

--number of countries
select count(distinct country) as number_of_countries
from web_sales_by_location
;

--sales by channel
select channel_renamed, year, sum(netsales)
--into channel_sales
from company_name_by_channel
group by year, channel_renamed;

--total company combined with product info
select c.*, p.product_title,p.product_grouping,p.category
into company_products
from company_name_by_channel as c
left join product_info as p
on c.sku = p.product_sku;

select count(distinct sku)
from company_products;

select year, channel, sku, sum(quantity), product_title,product_grouping,category
--into company_products_by_channel_summary
from company_products
group by year,channel,sku,product_title,product_grouping,category
order by year, channel, sum desc;

select * from product_info;

select year,date, sku,product_title,sum(quantity)as qty_tot,sum(netsales)as sum_net_sales
into top_company_products
from company_products
group by year, date, sku, product_title
order by year, qty_tot desc;

select channel_original,sku,year,product_title,sum(quantity)as qty_tot,sum(netsales)as sum_net_sales
into top_company_products_by_channel
from company_products
where year=2021
group by channel_original, year,sku, product_title
order by qty_tot desc;




select * from web_sales_with_product_info;

select year, country, product_sku, product_title, sum(orders) as sum_qty,sum(net_sales) as sum_net_sales
into Products_in_top_10_countries
from web_sales_with_product_info
where country='United States' or country = 'Canada' or country='Saudi Arabia' or country='Kuwait' or country='United Arab Emirates' or
	country='United Kingdom' or country = 'Australia' or country = 'Bahrain' or country ='Qatar' or country ='Indonesia'
group by year, country, product_sku, product_title
order by year, country, sum_qty desc;

--sales by country
select year, country, sum(net_sales)
into web_sales_by_country
from web_sales_by_location
group by year,country 
order by year,country, sum(net_sales) desc;

--zip codes
select country,billing_region,sum(net_sales)
into US_states_with_sales
from web_sales_by_location
where year=2021 and country='United States'
group by country,billing_region;

create table state_capitals(
state varchar(75),
city varchar(75),
latitude double precision,
longitude double precision);

select * from state_capitals;

select sales.*,c.latitude,c.longitude
into us_cities_with_lat_lon
from us_locations_with_sales as sales
left join cities as c
on sales.billing_city = c.city and sales.billing_region=c.state;

create table cities(
state varchar(75),
city varchar(75),
latitude double precision,
longitude double precision);

create table countries(
country_code varchar(2),
country varchar(75),
latitude double precision,
longitude double precision);

select sales.*,c.latitude,c.longitude
into countries_with_lat_lon
from sales_by_country as sales
left join countries as c
on sales.country = c.country;

select country, sum(net_sales)
into sales_by_country
from web_sales_by_location
where year=2021
group by country
order by sum desc;

select channel_original, year, date, sum(netsales)as sum_net_sales
into company_sales_by_channel
from company_name_by_channel
group by channel_original, year, date
order by year,date;

select * from company_sales_by_channel;
