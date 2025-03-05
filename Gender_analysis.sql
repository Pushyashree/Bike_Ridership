SELECT
    gender,
    usertype,
    COUNT(*) AS total_rides,
    AVG(TIMESTAMP_DIFF(end_time, start_time, SECOND)) / 60 AS avg_ride_length
FROM `new-york-439415.bike_ridership.final_data`
GROUP BY gender, usertype
ORDER BY total_rides DESC;

