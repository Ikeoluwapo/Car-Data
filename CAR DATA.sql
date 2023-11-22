create database data;
use data;

SELECT 
    *
FROM
    data.`car data`;
    
SELECT 
    Name, year
FROM
    `car data`
WHERE
    year = 2023;
    
/* To check the various years in the database */
SELECT DISTINCT
    year
FROM
    `car data`;
    
-- To check if the Names are distinct
SELECT DISTINCT
    fuel
FROM
    `car data`;
    
SELECT DISTINCT
    seller_type
FROM
    `car data`;
    
SELECT DISTINCT
    transmission
FROM
    `car data`;
    
SELECT DISTINCT
    owner
FROM
    `car data`;
    
SELECT DISTINCT
    seats
FROM
    `car data`;
    
SELECT 
    *
FROM
    data.`car data`
LIMIT 1;

-- Check number of cars that uses fuel and store for presentation
CREATE VIEW FUEL AS
    SELECT 
        fuel, COUNT(year)
    FROM
        `car data`
    GROUP BY fuel;
-- To see view
SELECT 
    *
FROM
    FUEL;
    
-- Check Total Number of ditinct cars in the database
DESCRIBE `car data`;-- To see database of car data

-- Check all Car Names that begin with A
SELECT 
    *
FROM
    `car data`
WHERE
    Name LIKE 'A%';
    
    /* To check for missing data */
SELECT 
    *
FROM
    `car data`
WHERE
    selling_price IS NULL
        OR km_driven IS NULL
        OR fuel IS NULL
        OR seller_type IS NULL
        OR transmission IS NULL
        OR owner IS NULL
        OR mileage IS NULL
        OR engine IS NULL
        OR max_power IS NULL
        OR torque IS NULL
        OR seats IS NULL;
        
-- To group cars by their seat. 
SELECT  seats, count(seats) FROM  `car data` group by seats order by count(seats) desc; -- This shows majority of the cars in the database are 5 seated

-- To select a random sample of rows
SELECT * FROM  `car data` ORDER BY rand() LIMIT 10;

-- To check the number of rows in SQL
SELECT count(*) FROM  `car data`;

SELECT * FROM  `car data`;

-- Show the average selling price per year
CREATE VIEW Year_Sellingprice AS
    SELECT 
        year, ROUND(AVG(selling_price), 2) AS Average_SellingPrice
    FROM
        `car data`
    GROUP BY year;
    -- To see what is saved in view
    SELECT * FROM Year_Sellingprice;
    
    -- To check the car transmission majorly bought in this database
   SELECT  transmission, count(seats) FROM  `car data` group by transmission; 
   -- This showed theere were wrongly spelled transmission, so needs to be corrected
 -- Take away safe mode so as to update and change back to 1 once done
 SET SQL_SAFE_UPDATES = 0;
 -- To trim leading space before Manual
 UPDATE `car data` 
SET 
    transmission = trim(transmission) WHERE transmission LIKE '%Manual';
    -- To trim leading space before Automatic
    UPDATE `car data` 
SET 
    transmission = trim(transmission) WHERE transmission LIKE '%Automatic';
    -- Close safe code
     SET SQL_SAFE_UPDATES = 1;
    SELECT distinct(transmission) FROM `car data`;
    
    SELECT  transmission, count(seats) AS agg FROM  `car data` group by transmission; 
    -- From this, we can see that majority of the cars bought are Manual
    
    SELECT Name, selling_price, engine, mileage FROM `car data` WHERE owner = 'First Owner' and seller_type = 'Dealer' and fuel = 'Petrol' and seats > 5;
    -- This does not infer much
    
	SELECT Name, selling_price, engine, mileage, seats, fuel, seller_type FROM `car data` WHERE selling_price >= 700000 and seats > 5;
    -- From these it seems majority of the cars that fall in this category, use diesel and were sold by Individuals
    
    -- To see the number of cars that fall into different categories of sellar_type
    SELECT count(seats), seller_type FROM `car data` group by seller_type;
    