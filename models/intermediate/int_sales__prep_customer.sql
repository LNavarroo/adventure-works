with
    /* Chamada dos modelos necessários. */
    customer as (
        select *
        from {{ ref('stg_sap__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_sales__person') }}
    )

    , prep_customer as (
        select
            customer.PK_CUSTOMER
            ,person.FULL_NAME_PERSON
            
        from customer
        left join person on customer.fk_person = person.pk_person
    )

    select * from prep_customer 
