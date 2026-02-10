

SELECT *
FROM {{ source('customer_subscription', 'SHEET1') }}
