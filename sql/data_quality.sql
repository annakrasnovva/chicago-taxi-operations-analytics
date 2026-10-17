-- 1. Dataset period | Период датасета
-- Is October 2023 fully represented in the dataset? | Полностью ли октябрь отображен в датасете?
select
    count(*) as trips_count,
    min(trip_start_timestamp) as earliest_trip,
    max(trip_start_timestamp) as latest_trip
from `bigquery-public-data.chicago_taxi_trips.taxi_trips`
where
    trip_start_timestamp >= '2023-10-01'
    and trip_start_timestamp < '2023-11-01';

-- Result:
-- 606 474 trips
-- Earliest trip: 2023-10-01 00:00:00 UTC
-- Latest trip: 2023-10-31 23:45:00 UTC

-- Conclusion:
-- The dataset contains a full month of October 2023. | Датасет содержит все дни октября.


-- 2. Missing geographic data | Пропущенные географические данные
-- How many trips don't have start or end of trip? | Как много строк не содержат начальной или конечной точки поездки?
select
    countif(pickup_community_area is null or dropoff_community_area is null) as no_place_trips
from `bigquery-public-data.chicago_taxi_trips.taxi_trips`
where
    trip_start_timestamp >= '2023-10-01'
    and trip_start_timestamp < '2023-11-01';

-- Result
-- 61 381 trips or 10,1% of all October trips

-- Conclusion:
-- About 10% of trips have incomplete geographic information. | Около 10% строк содержат неполные географические данные



-- 3. Zero distance and zero duration | Нулевые дистанцич и длительность поездки
-- Question:
-- How many trips have both zero distance and zero duration? | Как много строк не имеют дистанции И продолжительности поездки?
select
    count(*)
from `bigquery-public-data.chicago_taxi_trips.taxi_trips`
where
    trip_start_timestamp >= '2023-10-01'
    and trip_start_timestamp < '2023-11-01'
    and trip_miles = 0
    and trip_seconds = 0;

-- Result
-- 11639 trips or 1,92% of all October trips 

-- Conclusion:
-- These records require additional investigation before deciding. | Данные требует дополнительного изучения,
-- whether they should be excluded. | чтобы принять решение об их исключении.
