with
    fonte_store as (
        select *
        from {{ source('wordpress', 'STORE') }}
    )
    
     , store_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) as pk_store
            ,cast(SALESPERSONID as int) as fk_salesperson
            ,cast(NAME as string) as name_store


        from fonte_store
    )

    select * 
    from store_renomeado