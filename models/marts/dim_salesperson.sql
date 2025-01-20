with
    dim_salesperson as (
        select *
        from {{ ref('int_sales__prep_salesperson') }}
    )

select *
from dim_salesperson