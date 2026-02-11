{{ config(
    materialized='table'
) }}

WITH monthly_subscriptions AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', subscription_date) AS subscription_month,
        COUNT(*) AS total_subscriptions
    FROM {{ ref('dim_cust_subs') }}
    GROUP BY
        customer_id,
        DATE_TRUNC('month', subscription_date)
)

SELECT
    customer_id,
    subscription_month,
    total_subscriptions
FROM monthly_subscriptions
ORDER BY customer_id, subscription_month
