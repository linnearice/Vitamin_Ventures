-- Base tables we will be working with to create other tables to easily portray in plotly

WITH web_sales_with_info AS (
	SELECT 
		   p_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.web_sales_by_location p_sales
		LEFT JOIN public.product_info p_info 
			ON p_sales.product_sku = p_info.product_sku
)
SELECT *
FROM web_sales_with_info
LIMIT 100;



WITH channel_sales_with_info AS(
	SELECT 
		   c_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.company_sales_by_channel c_sales
		LEFT JOIN public.product_info p_info 
			ON c_sales.product_sku = p_info.product_sku
)
SELECT *
FROM channel_sales_with_info
LIMIT 100;



-- web sales all countries breakdown
WITH web_sales_with_info AS (
	SELECT 
		   p_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.web_sales_by_location p_sales
		LEFT JOIN public.product_info p_info 
			ON p_sales.product_sku = p_info.product_sku
)
SELECT 
    product_sku
  , date
  , country
  , api_client_title
  , product_grouping
  , product_title
  , category
  , SUM(net_sales) AS net_sales
  , SUM(shipping) AS shipping
  , SUM(taxes) AS taxes
  , SUM(total_sales) AS total_sales
INTO web_all_countries_breakdown
FROM web_sales_with_info
GROUP BY 1, 2, 3, 4, 5, 6, 7
ORDER BY 2 DESC, 8 DESC;

-- web sales United States breakdown
WITH web_sales_with_info AS (
	SELECT 
		   p_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.web_sales_by_location p_sales
		LEFT JOIN public.product_info p_info 
			ON p_sales.product_sku = p_info.product_sku
)
SELECT 
    product_sku
  , date
  , shipping_city
  , billing_postal_code
  , api_client_title
  , product_grouping
  , product_title
  , category
  , SUM(net_sales) AS net_sales
  , SUM(shipping) AS shipping
  , SUM(taxes) AS taxes
  , SUM(total_sales) AS total_sales
INTO web_US_breakdown
FROM web_sales_with_info
WHERE country='United States'
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
ORDER BY 2, 8 DESC;

-- channel with product group by month
WITH channel_sales_with_info AS(
	SELECT 
		   c_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.company_sales_by_channel c_sales
		LEFT JOIN public.product_info p_info 
			ON c_sales.product_sku = p_info.product_sku
)
SELECT
    channel
  , month
  , product_grouping
  , SUM(quantity) AS product_quantity
  , SUM(net_sales) AS Sales
INTO channel_product_group_by_month
FROM channel_sales_with_info
GROUP BY 1, 2, 3
ORDER BY 2 DESC, 5 DESC;

--channel product info breakdown
WITH channel_sales_with_info AS(
	SELECT 
		   c_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.company_sales_by_channel c_sales
		LEFT JOIN public.product_info p_info 
			ON c_sales.product_sku = p_info.product_sku
)
SELECT
    product_title
  , product_grouping
  , category
  , month
  , SUM(quantity) AS product_quantity
  , SUM(net_sales) AS Sales
INTO channel_product_info_breakdown
FROM channel_sales_with_info
GROUP BY 1, 2, 3, 4
ORDER BY 1, 4 DESC, 6 DESC;

-- sku breakdown by channel
WITH channel_sales_with_info AS(
	SELECT 
		   c_sales.*
		 , p_info.product_title
		 , p_info.product_grouping
		 , p_info.category
	FROM public.company_sales_by_channel c_sales
		LEFT JOIN public.product_info p_info 
			ON c_sales.product_sku = p_info.product_sku
)
SELECT
    product_sku
  , channel
  , SUM(quantity) AS product_quantity
  , SUM(net_sales) AS Sales
INTO sku_breakdown_by_channel
FROM channel_sales_with_info
GROUP BY 1, 2
ORDER BY 1 ASC, 4 DESC;