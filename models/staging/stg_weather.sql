{{ config(materialized='table') }}
select
  date,
  city,
  temp_kelvin,
  -- Convert temperature to Celsius for easier understanding
  temp_kelvin - 273.15 as temp_celsius,
  humidity,
  description
from {{ source('weather_api', 'daily_weather') }};