create or replace table inventory."产品主数据" as
select 
	product_id,
	mode(brand) as brand,
	avg(price) as avg_price
from ecommerce_clean
where category_code = 'electronics.audio.headphone' and event_type = 'purchase'
group by product_id
