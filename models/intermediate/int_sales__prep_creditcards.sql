with
    /* Chamada dos modelos necessários. */
    creditcard as (
        select *
        from {{ ref('stg_sales__creditcard') }}
    )

      , prep_creditcard as (
        select
            creditcard.PK_CREDITCARD
            ,creditcard.TYPE_CREDITCARD

        from creditcard
    )

    select * from prep_creditcard