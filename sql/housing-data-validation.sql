-- Housing Data Validation
-- Purpose: Validate transformed housing tables before dashboard development.

-- 1. Validate housing type values
SELECT DISTINCT Housing_Type
FROM cmhc_starts_historical;

-- 2. Validate starts values
SELECT *
FROM cmhc_starts_historical
WHERE Starts IS NULL
   OR Starts < 0;

-- 3. Validate vacancy rate range
SELECT *
FROM cmhc_vacancy_rates
WHERE Vacancy_Rate < 0
   OR Vacancy_Rate > 1
   OR Vacancy_Rate IS NULL;

-- 4. Check unmatched regions between starts and region dimension
SELECT s.Region
FROM cmhc_starts_by_area s
LEFT JOIN dim_region r
ON s.Region = r.Region
WHERE r.Region IS NULL;

-- 5. Check missing date values
SELECT *
FROM cmhc_starts_historical
WHERE Date IS NULL;
