with
    /* Chamada dos modelos necessários. */
    salesperson as (
        select *
        from {{ ref('stg_sales__salesperson') }}
    )

    , person as (
        select *
        from {{ ref('stg_sales__person') }}
    )

     ,employee as (
        select *
        from {{ ref('stg_sap__employee') }}
    )

     , prep_salesperson as (
        select
            salesperson.PK_SALESPERSON
            ,person.FULL_NAME_PERSON
            ,employee.JOBTITLE_EMPLOYEE
            ,employee.GENDER_EMPLOYEE
        
        from salesperson
        left join employee on salesperson.pk_salesperson = employee.pk_employee
        left join person on salesperson.pk_salesperson = person.pk_person
        
    )

    select * from prep_salesperson