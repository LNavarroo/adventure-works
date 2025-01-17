with
    /* Chamada dos modelos necessários. */
    adress as (
        select *
        from {{ ref('stg_sales__address') }}
    )

    , stateprovince as (
        select *
        from {{ ref('stg_sales__stateprovince') }}
    )

     ,countryregion as (
        select *
        from {{ ref('stg_sales__countryregion') }}
    )

    , prep_adress as (
        select
            adress.PK_ADRESS
            ,adress.CITY
            ,stateprovince.NAME_STATE
            ,countryregion.NAME_COUNTRY

        from adress  
        left join stateprovince on adress.fk_state = stateprovince.pk_state
        left join countryregion on stateprovince.fk_country = countryregion.pk_country
        
    )

    select * from prep_adress