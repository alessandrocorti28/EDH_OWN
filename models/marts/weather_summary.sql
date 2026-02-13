{{ config(
  materialized='table',
  description='Summary of daily weather data including average temperature and humidity extremes.'
) }}
select 
  city,
  date,
  ROUND(AVG(temp_celsius)::numeric, 2) as avg_temp_celsius,
  MAX(humidity) as max_humidity,
  MIN(humidity) as min_humidity
from {{ ref('stg_weather') }}
group by city, date;