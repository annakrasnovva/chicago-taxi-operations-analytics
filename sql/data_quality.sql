-- Is October 2023 fully represented in the dataset?
select
    count(*) as trips_count,
    min(trip_start_timestamp) as earliest_trip,
    max(trip_start_timestamp) as latest_trip
from `bigquery-public-data.chicago_taxi_trips.taxi_trips`
where
    trip_start_timestamp >= '2023-10-01'
    and trip_start_timestamp < '2023-11-01';

-- Result:
-- 606,474 trips
-- Earliest trip: 2023-10-01 00:00:00 UTC
-- Latest trip: 2023-10-31 23:45:00 UTC
--
-- Conclusion:
-- The dataset contains a full month of October 2023.
