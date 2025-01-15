with
    fonte_salesreason as (
        select *
        from {{ source('salesforce', 'SALESREASON') }}
    )
    
     , salesreason_renomeado as (
        select 
            cast(SALESREASONID as int) as pk_salesreason
            ,cast(NAME as string) as  name_salesreason
            ,cast(REASONTYPE as string) as type_salesreason


        from fonte_salesreason
    )

    select * 
    from salesreason_renomeado