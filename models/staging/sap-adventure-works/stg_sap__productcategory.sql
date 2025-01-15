with
    fonte_productcategory as (
        select *
        from {{ source('sap-erp', 'PRODUCTCATEGORY') }}
    )
    
     , productcategory_renomeado as (
        select 

            cast(PRODUCTCATEGORYID as int) as pk_productcategory
            ,cast(NAME as string) as name_productcategory

        from fonte_productcategory
    )

    select * 
    from productcategory_renomeado