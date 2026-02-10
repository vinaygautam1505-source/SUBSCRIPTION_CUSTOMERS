select
  customer_id,
  first_name,
  last_name,
  concate(first_name, ' ', last_name) as full_name,
  company,
  city,
  country,
  phone_1 as primary_number,
  phone_2 as secondary_number,
  email,
  subscription_date,
  website

from {{ ref('stg_cust_subs') }}  
