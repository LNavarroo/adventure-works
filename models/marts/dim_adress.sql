with
    dim_adress as (
        select *
        from {{ ref('int_sales__prep_adress') }}
    )

select *
from dim_adress