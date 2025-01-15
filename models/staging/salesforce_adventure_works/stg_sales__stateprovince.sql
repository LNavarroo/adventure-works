with
    fonte_state as (
        select *
        from {{ source('salesforce', 'STATEPROVINCE') }}
    )
    
     , state_renomeado as (
        select 
            cast(STATEPROVINCEID as int) as pk_state
            ,cast(COUNTRYREGIONCODE as string) as fk_country
            ,cast(STATEPROVINCECODE as string) as code_state
            ,cast(NAME as string) name_state


        from fonte_state
    )

    select * 
    from state_renomeado