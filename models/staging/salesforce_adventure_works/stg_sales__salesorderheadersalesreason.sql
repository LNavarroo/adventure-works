with
    fonte_salesorderheadersalesreason as (
        select *
        from {{ source('salesforce', 'SALESORDERHEADERSALESREASON') }}
    )
    
     , salesorderheadersalesreason_renomeado as (
        select 
            concat(SALESORDERID, '-', SALESREASONID) as pk_sales_order_reason
            ,cast(SALESORDERID as int) as fk_salesorder
            ,cast(SALESREASONID as int) fk_salereason


        from fonte_salesorderheadersalesreason
    )

    select * 
    from salesorderheadersalesreason_renomeado