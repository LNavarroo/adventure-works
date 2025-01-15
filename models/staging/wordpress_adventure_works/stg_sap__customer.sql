with
    fonte_customer as (
        select *
        from {{ source('wordpress', 'CUSTOMER') }}
    )
    
     , customer_renomeado as (
        select 
            cast(CUSTOMERID as int) as pk_customer
            ,cast(PERSONID as int) as fk_person
            ,cast(STOREID as int) as fk_store
            ,cast(TERRITORYID as int) as fk_territory

        from fonte_customer
    )

    select * 
    from customer_renomeado