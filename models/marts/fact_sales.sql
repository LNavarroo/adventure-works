with
    fact_sales as (
        select *
        from {{ ref('int_sales__prep_metrics') }}
    )

select *
from fact_sales