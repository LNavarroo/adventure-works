with
    fonte_salesterritory as (
        select *
        from {{ source('wordpress', 'SALESTERRITORY') }}
    )
    
     , salesterritory_renomeado as (
        select 
            cast(TERRITORYID as int) as pk_territory
            ,cast(COUNTRYREGIONCODE as string) fk_country
            ,cast(NAME as string) as name_territory

        from fonte_salesterritory
    )

    select * 
    from salesterritory_renomeado