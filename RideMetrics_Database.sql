CREATE DATABASE RideMetrics;

USE RideMetrics;

CREATE SCHEMA Bronze;
CREATE SCHEMA Silver;
CREATE SCHEMA Gold;



  SELECT * FROM Gold.ML_demand_features
  where duration <=0

    SELECT * FROM Gold.ML_earnings_features
  where distance_metres <=0

     SELECT * FROM Bronze.Uber_Trips
  where trip_distance_miles <=0 and cancellation_fee_local>0

  select * from Uber_Payments_Silver_pivoted

   SELECT * FROM Bronze.Uber_Payments



 

