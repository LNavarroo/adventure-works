with
    /* Chamada dos modelos necessários. */
    salesreason as (
        select *
        from {{ ref('stg_sales__salesreason') }}
    )

    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , prep_salesreason as (
        select
            salesorderheadersalesreason.FK_SALESORDER
            ,salesreason.NAME_SALESREASON
            ,salesreason.TYPE_SALESREASON
            
        from salesreason 
        left join salesorderheadersalesreason on salesreason.pk_salesreason = salesorderheadersalesreason.fk_salereason
    )

    select * from prep_salesreason