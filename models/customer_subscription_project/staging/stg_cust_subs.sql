WITH SOURCE AS(
  SELECT * FROM {{source('customer_subscription', 'SHEET1')}} ),

  
RENAMED AS ( 
  
  SELECT
  
NULLIF(TRIM("CITY"), '')  AS city,
NULLIF(TRIM(LOWER("EMAIL")), '') AS email,
NULLIF(TRIM("INDEX"),'') AS index_col,
NULLIF(TRIM("COMPANY"),'') AS company,
NULLIF(TRIM("COUNTRY"), '') AS country,
NULLIF(TRIM("PHONE 1"), '') AS phone_1,
NULLIF(TRIM("PHONE 2"),'') AS phone_2,
NULLIF(TRIM("WEBSITE"), '') AS website,
NULLIF(TRIM("LAST NAME"),'') AS last_name,
NULLIF(TRIM("FIRST NAME"), '') AS first_name,
NULLIF(TRIM("CUSTOMER ID"), '') AS customer_id,
NULLIF(TRIM("SUBSCRIPTION DATE"), '')::DATE AS subscription_date

  FROM SOURCE )
  
  SELECT * FROM RENAMED;

