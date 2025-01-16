with
    fonte_salesorderheader as (
        select *
        from {{ source('salesforce', 'SALESORDERHEADER') }}
    )
    
     , salesorderheader_renomeado as (
        select 
             cast(SALESORDERID as int) as pk_salesorder
            , cast(SHIPTOADDRESSID as int) as fk_adress
            , cast(SALESPERSONID as int) as fk_salesperson
            , cast(CUSTOMERID as int) as fk_customer
            , cast(CREDITCARDID as int) as fk_creditcard
            , cast(ORDERDATE as date) as orderdate_salesorder
            , cast(SHIPDATE as date) as shipdate_salesorder
            , cast(ONLINEORDERFLAG as string) as is_online_salesorder
            , cast(SUBTOTAL as numeric(18,4)) as subtotal_salesorder
            , cast(TAXAMT as numeric(18,4)) as tax_salesorder
            , cast(FREIGHT as numeric(18,4)) as freigth_salesorder
            , cast(TOTALDUE as numeric(18,4)) as total_salesorder
        from fonte_salesorderheader
    )

    select * 
    from salesorderheader_renomeado