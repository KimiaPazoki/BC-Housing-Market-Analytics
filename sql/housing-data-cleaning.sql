-- Housing Data Cleaning & Preparation
-- Purpose: Prepare BC housing tables before Power BI modeling.

-- 1. Check missing year values
SELECT *
FROM bc_housing_data_1990_2024
WHERE Year IS NULL;

-- 2. Check missing region values
SELECT *
FROM bc_housing_data_1990_2024
WHERE City IS NULL;

-- 3. Check duplicate region-year records
SELECT
    City,
    Year,
    COUNT(*) AS record_count
FROM bc_housing_data_1990_2024
GROUP BY City, Year
HAVING COUNT(*) > 1;

-- 4. Check missing housing price values
SELECT *
FROM bc_housing_data_1990_2024
WHERE Condo_Average_Price IS NULL
   OR Homeowner_Average_Price IS NULL
   OR Rental_Average_Price IS NULL;
