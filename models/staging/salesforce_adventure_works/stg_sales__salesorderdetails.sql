with
    fonte_salesorderdetails as (
        select *
        from {{ source('salesforce', 'SALESORDERDETAIL') }}
    )
    
     , salesorderdetails_renomeado as (
        select
             cast(SALESORDERDETAILID as int) pk_salesorderdetail
            ,cast(SALESORDERID as int) as fk_salesorder
            , cast(PRODUCTID as int) as fk_product
            , cast(ORDERQTY as int) as qty_salesorderdetail
            , cast(UNITPRICE as int) as unitprice_salesorderdetail
            , cast(UNITPRICEDISCOUNT as float) as discount_salesorderdetail

        from fonte_salesorderdetails
    )

    select * 
    from salesorderdetails_renomeado