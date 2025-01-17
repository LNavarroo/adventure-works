 with
    /* Chamada dos modelos necessários. */
    salesorderdetail as (
        select *
        from {{ ref('stg_sales__salesorderdetail') }}
    )

    , salesorderheader as (
        select *
        from {{ ref('stg_sales__salesorderheader') }}
    )

    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , salesreason as (
        select *
        from {{ ref('stg_sales__salesreason') }}
    )


     , prep_salesmetrics as (
        select
            salesorderdetail.PK_SALESORDERDETAIL
            ,salesorderdetail.FK_PRODUCT
            ,salesorderheader.FK_ADRESS
            ,salesorderheader.FK_SALESPERSON
            ,salesorderheader.FK_CUSTOMER
            ,salesorderheader.FK_CREDITCARD
            ,salesorderheader.ORDERDATE_SALESORDER 
            ,salesorderheader.SHIPDATE_SALESORDER 
            ,salesreason.NAME_SALESREASON 
            ,salesreason.TYPE_SALESREASON 
            ,salesorderheader.IS_ONLINE_SALESORDER 
            ,salesorderdetail.QTY_SALESORDERDETAIL 
            ,salesorderdetail.UNITPRICE_SALESORDERDETAIL 
            ,salesorderdetail.DISCOUNT_SALESORDERDETAIL 
            ,salesorderheader.TAX_SALESORDER 
            ,salesorderheader.FREIGTH_SALESORDER 
            ,salesorderheader.SUBTOTAL_SALESORDER 
            ,salesorderheader.TOTAL_SALESORDER 
        
        from salesorderdetail
        left join salesorderheader on salesorderdetail.FK_SALESORDER = salesorderheader.pk_salesorder
        left join salesorderheadersalesreason on salesorderheader.pk_salesorder = salesorderheadersalesreason.fk_salesorder
        left join salesreason on salesorderheadersalesreason.fk_salereason = salesreason.pk_salesreason
        
    )

    , metrics as (
            select
            PK_SALESORDERDETAIL
            ,FK_PRODUCT
            ,FK_ADRESS
            ,FK_SALESPERSON
            ,FK_CUSTOMER
            ,FK_CREDITCARD
            ,ORDERDATE_SALESORDER as orderdate
            ,SHIPDATE_SALESORDER as shipdate
            ,NAME_SALESREASON as reason
            ,TYPE_SALESREASON reasontype
            ,IS_ONLINE_SALESORDER as is_online
            ,QTY_SALESORDERDETAIL as quantity
            ,UNITPRICE_SALESORDERDETAIL as unitprice
            ,DISCOUNT_SALESORDERDETAIL as discount
            ,TAX_SALESORDER tax
            ,FREIGTH_SALESORDER as freigth
            ,SUBTOTAL_SALESORDER as subtotal
            ,TOTAL_SALESORDER as total

        from prep_salesmetrics
    )

    select * from metrics