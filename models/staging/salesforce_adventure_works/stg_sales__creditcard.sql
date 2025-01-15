with
    fonte_creditcard as (
        select *
        from {{ source('salesforce', 'CREDITCARD') }}
    )
    
     , creditcard_renomeado as (
        select

            cast(CREDITCARDID as int) as pk_creditcard
            ,cast(CARDTYPE as string) as type_creditcard
            
        from  fonte_creditcard
    )

    select * 
    from creditcard_renomeado