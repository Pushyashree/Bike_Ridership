SELECT 
    CASE 
        WHEN birthyear IS NULL THEN 'Unknown'
        WHEN birthyear >= 2000 THEN 'Gen Z (2000+)'
        WHEN birthyear BETWEEN 1980 AND 1999 THEN 'Millennial (1980-1999)'
        WHEN birthyear BETWEEN 1960 AND 1979 THEN 'Gen X (1960-1979)'
        ELSE 'Boomer (Before 1960)'
    END AS age_group,
    usertype,
    COUNT(*) AS total_rides,
    AVG(TIMESTAMP_DIFF(end_time, start_time, SECOND)) / 60 AS avg_ride_length_mins
FROM `new-york-439415.bike_ridership.final_data`
GROUP BY age_group, usertype
ORDER BY age_group, usertype;
