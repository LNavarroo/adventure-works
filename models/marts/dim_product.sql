with
    dim_product as (
        select *
        from {{ ref('int_sales__prep_product') }}
    )

select *
from dim_product