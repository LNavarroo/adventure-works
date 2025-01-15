with
    fonte_product as (
        select *
        from {{ source('sap-erp', 'PRODUCT') }}
    )
    
     , product_renomeado as (
        select 
            cast(PRODUCTID as int) as pk_product
            ,cast(PRODUCTSUBCATEGORYID as int) as fk_subcategory
            ,cast(NAME as string) as name_product
            ,cast(WEIGHT as float) as weight_product

        from fonte_product
    )

    select * 
    from product_renomeado