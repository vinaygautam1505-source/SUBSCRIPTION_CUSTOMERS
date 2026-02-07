with source as (

    select *
    from {{ source('customer_subscription', 'SHEET1') }}

),

renamed as (

    select
        nullif(trim("CITY"), '')                     as city,
        nullif(trim(lower("EMAIL")), '')             as email,
        nullif(trim("INDEX"), '')                    as index_col,
        nullif(trim("COMPANY"), '')                  as company,
        nullif(trim("COUNTRY"), '')                  as country,
        nullif(trim("PHONE 1"), '')                  as phone_1,
        nullif(trim("PHONE 2"), '')                  as phone_2,
        nullif(trim("WEBSITE"), '')                  as website,
        nullif(trim("LAST NAME"), '')                as last_name,
        nullif(trim("FIRST NAME"), '')               as first_name,
        nullif(trim("CUSTOMER ID"), '')              as customer_id,
        try_to_date(nullif(trim("SUBSCRIPTION DATE"), '')) as subscription_date
    from source

)

select * from renamed;
