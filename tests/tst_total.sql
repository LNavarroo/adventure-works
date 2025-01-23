with
    sales_2011 as (
        
        select sum(soma_total_bruto) as soma_total
        from {{ ref('fact_sales') }}
        where ORDERDATE_SALESORDER between '2011-01-01' and '2011-12-31'
    )

select soma_total
from sales_2011
where soma_total not between 12646112.10 and 12646112.20