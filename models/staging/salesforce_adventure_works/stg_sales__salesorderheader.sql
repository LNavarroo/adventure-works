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
            , cast(ONLINEORDERFLAG as string) as onlineflag_salesorder
            , cast(SUBTOTAL as float) as subtotal_salesorder
            , cast(TAXAMT as float) as tax_salesorder
            , cast(FREIGHT as float) as freigth_salesorder
            , cast(TOTALDUE as float) as total_salesorder
        from fonte_salesorderheader
    )

    select * 
    from salesorderheader_renomeado