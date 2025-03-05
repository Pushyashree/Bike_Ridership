WITH merged_data AS (
    -- Merge all four quarters
    SELECT * FROM `new-york-439415.Q1_2019.Q1`
    UNION ALL
    SELECT 
        `01 - Rental Details Rental ID` AS trip_id,
        `01 - Rental Details Local Start Time` AS start_time,
        `01 - Rental Details Local End Time` AS end_time,
        `01 - Rental Details Bike ID` AS bikeid,
        `01 - Rental Details Duration In Seconds Uncapped` AS tripduration,
        `03 - Rental Start Station ID` AS from_station_id,
        `03 - Rental Start Station Name` AS from_station_name,
        `02 - Rental End Station ID` AS to_station_id,
        `02 - Rental End Station Name` AS to_station_name,
        `User Type` AS usertype,
        `Member Gender` AS gender,
        `05 - Member Details Member Birthday Year` AS birthyear,
        ride_length, 
        day_of_week
    FROM `new-york-439415.Q1_2019.Q2`
    UNION ALL
    SELECT * FROM `new-york-439415.Q1_2019.Q3`
    UNION ALL
    SELECT * FROM `new-york-439415.Q1_2019.Q4`
),
gender_mode AS (
    -- Calculate the most common gender (mode)
    SELECT gender
    FROM merged_data
    WHERE gender IS NOT NULL
    GROUP BY gender
    ORDER BY COUNT(*) DESC
    LIMIT 1
),
birthyear_median AS (
    -- Calculate the median birth year
    SELECT PERCENTILE_CONT(birthyear, 0.5) OVER() AS median_value
    FROM merged_data
    WHERE birthyear IS NOT NULL
    LIMIT 1
)
SELECT 
    trip_id, start_time, end_time, bikeid, tripduration, 
    from_station_id, from_station_name, to_station_id, to_station_name,
    usertype, 
    COALESCE(gender, (SELECT gender FROM gender_mode)) AS gender, -- Fill missing gender with mode
    COALESCE(birthyear, (SELECT median_value FROM birthyear_median)) AS birthyear, -- Fill missing birthyear with median
    ride_length, day_of_week
FROM merged_data
WHERE TIMESTAMP_DIFF(end_time, start_time, SECOND) > 0; -- Remove negative ride lengths


