# 2.Top 5 customers in fiscal year 2021

select customer,
	round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales n 
join dim_customer c
	on 
		c.customer_code = n.customer_code
where fiscal_year = 2021
group by customer
order by net_sales_mln desc
limit 5;
