use stolen_vehicles_db;

select  * from stolen_vehicles;

-- data cleaning --
-- handling missing rows --

select * from stolen_vehicles
where vehicle_type="null";

-- turn off sql_safe Updates =0 and turn on keep 1 

SET SQL_SAFE_UPDATES = 0;

delete from  
stolen_vehicles
where 
vehicle_type IS NULL;

-- CHECK FOR DUPLICATE ROWS--
WITH CTE AS
(
SELECT
	*,
    ROW_NUMBER() OVER(Partition by vehicle_id, vehicle_type, make_id, model_year, vehicle_desc, color, date_stolen, location_id ORDER BY vehicle_id ASC) as row_num
FROM stolen_vehicles
)
	SELECT COUNT(*) FROM CTE WHERE row_num > 1;
    

-- EXTRACT YEAR, MONTH AND DAY NAME FROM COLUMN DATE_STOLEN AND MAKE A SEPARATE COLUMNS FOR EACH--


-- YEAR--
SELECT EXTRACT(Year FROM date_stolen) FROM stolen_vehicles;

ALTER TABLE stolen_vehicles
ADD COLUMN Year int after location_id; 

UPDATE stolen_vehicles
SET Year = EXTRACT(Year FROM date_stolen);

-- MONTH--
SELECT EXTRACT(Month FROM date_stolen) FROM stolen_vehicles;

ALTER TABLE stolen_vehicles
ADD COLUMN Month int after Year;

UPDATE stolen_vehicles
SET Month = EXTRACT(Month FROM date_stolen);

-- WEEK--
SELECT EXTRACT(Week FROM date_stolen) FROM stolen_vehicles;

ALTER TABLE stolen_vehicles
ADD COLUMN Week int after Month;

UPDATE stolen_vehicles
SET Week = EXTRACT(Week FROM date_stolen);

-- DAY NAME--
SELECT Dayname(date_stolen) FROM stolen_vehicles;


ALTER TABLE stolen_vehicles
MODIFY COLUMN `Dayname` character(15) after Week;

UPDATE stolen_vehicles
SET `Dayname` = DAYNAME(date_stolen);


 


-- theft analysis on particular days --
 
SELECT 
    Year, 
    Month, Dayname,
    COUNT(vehicle_id) AS theft_count
FROM 
    stolen_vehicles
GROUP BY 
    Year, Month ,Dayname
ORDER BY 
    Year ASC, Month ASC;
    
-- Stolen Vehicles Count by Region and Theft Rate Per Population  --


    
SELECT 
    L.region, 
    L.country, 
    COUNT(V.vehicle_id) AS theft_count, 
    L.population,
    (COUNT(V.vehicle_id) / L.population) * 1000 AS theft_rate_per_1000
FROM 
    stolen_vehicles_db.stolen_vehicles V
JOIN 
    stolen_vehicles_db.locations L ON V.location_id = L.location_id
GROUP BY 
    L.region, L.country, L.population
ORDER BY 
    theft_rate_per_1000 DESC;
    
-- Most Commonly Stolen Vehicle Makes, Models, and Colors  --


SELECT 
    M.make_name, 
    M.make_type, 
    V.vehicle_type, 
    V.model_year, 
    V.color, 
    COUNT(V.vehicle_id) AS theft_count
FROM 
    stolen_vehicles_db.stolen_vehicles V
JOIN 
    stolen_vehicles_db.make_details M ON V.make_id = M.make_id
GROUP BY 
    M.make_name, M.make_type, V.vehicle_type, V.model_year, V.color
ORDER BY 
    theft_count DESC
LIMIT 10;


-- Calculate Vehicle Age at Time of Theft:   --
SELECT 
    vehicle_id, 
    (Year - model_year) AS vehicle_age
FROM 
    stolen_vehicles_db.stolen_vehicles;
    
--     Identify High-Risk Vehicle Types in High-Risk Locations --

SELECT 
    L.region, 
    M.make_name, 
    V.vehicle_type, 
    COUNT(V.vehicle_id) AS theft_count
FROM 
    stolen_vehicles_db.stolen_vehicles V
JOIN 
    stolen_vehicles_db.make_details M ON V.make_id = M.make_id
JOIN 
    stolen_vehicles_db.locations L ON V.location_id = L.location_id
GROUP BY 
    L.region, M.make_name, V.vehicle_type
ORDER BY 
    theft_count DESC
LIMIT 10;



--  Monthly Trend of Vehicle Theft by Location:  --

SELECT 
    L.region, 
    V.Month, 
    COUNT(V.vehicle_id) AS monthly_theft_count
FROM 
    stolen_vehicles_db.stolen_vehicles V
JOIN 
    stolen_vehicles_db.locations L ON V.location_id = L.location_id
GROUP BY 
    L.region, V.Month
ORDER BY 
    L.region, V.Month;


    
    
    



    















