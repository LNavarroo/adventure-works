with
    fonte_salesperson as (
        select *
        from {{ source('salesforce', 'SALESPERSON') }}
    )
    
     , salesperson_renomeado as (
        select 
            cast(BUSINESSENTITYID as int) pk_salesperson
        from fonte_salesperson
    )

    select * 
    from salesperson_renomeado