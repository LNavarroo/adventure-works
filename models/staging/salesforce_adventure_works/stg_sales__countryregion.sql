with
    fonte_countryregion as (
        select *
        from {{ source('salesforce', 'COUNTRYREGION') }}
    )
    
     , country_renomeado as (
        select
            cast (COUNTRYREGIONCODE as string) as pk_country
            ,cast (NAME as string) as name_country
            
        from  fonte_countryregion
    )

    select * 
    from country_renomeado