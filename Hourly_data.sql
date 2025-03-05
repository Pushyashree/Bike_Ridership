SELECT
  day_of_week,
  EXTRACT(HOUR FROM start_time) AS hour_of_day,
  usertype,
  #Format_date('%B', DATE(start_time)) AS month,
  count(*) as total_rides,
  AVG(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as avg_ride_length,
  MIN(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as min_ride_length,
  MAX(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as max_ride_length
FROM `new-york-439415.bike_ridership.final_data`
group by day_of_week, hour_of_day, usertype
order by day_of_week, hour_of_day, usertype
