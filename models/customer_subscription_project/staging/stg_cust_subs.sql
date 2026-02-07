

with cleaned_and_renamed as (

    select
        trim("CITY")                     as city,
        trim(lower(coalesce("EMAIL", 'abc@gmail.com')))            as email,
        trim("INDEX")                    as index_col,
        trim("COMPANY")                  as company,
        trim("COUNTRY")                  as country,
        REGEXP_REPLACE(trim(COALESCE("PHONE 1", '0000000000')), '[^0-9]', '') AS phone_1,
        REGEXP_REPLACE(trim(COALESCE("PHONE 2", '0000000000')), '[^0-9]', '') AS phone_2,
        trim(lower("WEBSITE"))                  as website,
        trim(coalesce("LAST NAME", 'NA'))                as last_name,
        trim(coalesce("FIRST NAME", 'NA') )              as first_name,
        trim(coalesce("CUSTOMER ID", '00') )             as customer_id,
        try_to_date(trim("SUBSCRIPTION DATE"), 'YYYY-MM-DD') as subscription_date

    FROM {{ source('customer_subscription', 'SHEET1') }}
)
SELECT *
FROM cleaned_and_renamed



