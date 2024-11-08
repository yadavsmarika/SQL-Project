# 3.Top 10 customer by market share
with cte1 as (
select customer,
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales n 
join dim_customer c
	on c.customer_code = n.customer_code
where fiscal_year = 2021
group by customer)

select 	
	*,
	net_sales_mln*100/sum(net_sales_mln) over() as pct
from cte1
order by net_sales_mln desc
limit 10;
