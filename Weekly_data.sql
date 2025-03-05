SELECT
  day_of_week,
  usertype,
  #Format_date('%B', DATE(start_time)) AS month,
  count(*) as total_rides,
  AVG(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as avg_ride_length,
  MIN(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as min_ride_length,
  MAX(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as max_ride_length
FROM `new-york-439415.bike_ridership.final_data`
group by day_of_week, usertype
order by day_of_week, usertype
