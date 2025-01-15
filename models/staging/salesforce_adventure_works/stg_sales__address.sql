with
    fonte_address as (
        select *
        from {{ source('salesforce', 'ADDRESS') }}
    )
    
     , adress_renomeado as (
        select
            cast(ADDRESSID as int) as pk_adress
            ,cast(STATEPROVINCEID as int) as fk_state
            ,cast(CITY as string) as city

        from  fonte_address
    )

    select * 
    from adress_renomeado