create or replace table inventory."品类日汇总" as
select 
	date(event_time) as "日期",
	sum(case when event_type = 'purchase' then 1 else 0 end) as "日销量",
	sum(case when event_type = 'purchase' then price else 0 end) as "日销售额",
	sum(case when event_type = 'view' then 1 else 0 end) as "日浏览量",
	sum(case when event_type = 'cart' then 1 else 0 end) as "日加购量"
from ecommerce_clean
where category_code = 'electronics.audio.headphone'
group by date(event_time)
order by date(event_time)
