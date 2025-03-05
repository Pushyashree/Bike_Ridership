SELECT
  #day_of_week,
  usertype,
  Format_date('%B', DATE(start_time)) AS month,
  count(*) as total_rides,
  AVG(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as avg_ride_length,
  MIN(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as min_ride_length,
  MAX(TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 as max_ride_length
FROM `new-york-439415.bike_ridership.final_data`
WHERE NOT #to remove one large outlier in February (debugging code @ end)
((Format_date('%B', DATE(start_time)) = 'February')
AND (TIMESTAMP_DIFF(end_time, start_time, SECOND))/60 > 100000.0)
group by month, usertype
order by month, usertype


#Debugging

#Debugging negative time differences and removing those rows
#SELECT
#  start_time,
#  end_time,
#  day_of_week,
#  timestamp_diff(end_time, start_time, SECOND) as ride_sec,
#  timestamp_diff(end_time, start_time, SECOND)/ 60 as ride_min,
#  Format_date('%B', DATE(start_time)) AS month
#FROM `new-york-439415.bike_ridership.final_data`
#WHERE
#  Format_date('%B', DATE(start_time)) = 'November'
#AND day_of_week = 1
#ORDER BY ride_sec ASC


#Debugging to find ride_length outlier
#SELECT
#  usertype,
#  count(*) as total_rides,
 # Format_date('%B', DATE(start_time)) AS month,
 # TIMESTAMP_DIFF(end_time, start_time, SECOND)/60 AS ride_length
#FROM `new-york-439415.bike_ridership.final_data`
#WHERE Format_date('%B', DATE(start_time)) = 'February' 
#(Found February as an outlier from line graph of ride_length vs months)
#group by month, usertype, ride_length
#order by ride_length DESC